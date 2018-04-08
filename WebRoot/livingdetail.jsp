<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="cn.it.model.*"%>
<%@page import="java.util.List"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>民宿详情页</title>
	<meta charset="utf-8">
	 <link rel="stylesheet" type="text/css" href="css/frame1.css">
   <link rel="stylesheet" type="text/css" href="css/homestayDetail.css">
      <link rel="stylesheet" type="text/css" href="css/form.css">
    <script type="text/javascript" src="js/jquery.js"></script>
    <script src="js/form.js"></script>
</head>
<body>
<div class="myWrap">
<nav>
    <ul>
    <li class="logo"><img src="img/logo1.png"></li>
    <li class="nav1"><a href="${pageContext.request.contextPath}/welcome.do">首页</a></li>
    <li class="nav1"><a href="${pageContext.request.contextPath}/village.do?villageSeason=<%=""%>&villageSpecial=<%=""%>">乡村</a></li>
    <li class="nav1"><a href="${pageContext.request.contextPath}/routeshow.do">路线</a></li>
    <li class="nav1"><a href="${pageContext.request.contextPath}/spot.do">景点</a></li>
    <li class="nav1"><a href="${pageContext.request.contextPath}/living.do">民宿</a></li>
    <li class="nav1"><a href="${pageContext.request.contextPath}/travels.do?title=<%=""%>&sel=<%="a"%>">游记</a></li>
    <li class="block"></li>
    <%User user =(User) session.getAttribute("userses");
        if(user == null){%>
    <li class="nav2"><a href="javascript:openLogin();">登陆</a></li>
    <li class="nav2"><a href="javascript:openRegister();">注册</a></li>
    <%}else{ if(user.getDel()==2){%>
    <li class="nav2"><a href="${pageContext.request.contextPath}/admin.jsp">个人中心</a></li>
    <li class="nav2"><a href="logout.do">注销</a></li>
    <%}else if(user.getDel()==3){ %>
    <li class="nav2"><a href="${pageContext.request.contextPath}/hotelexam.do">个人中心</a></li>
    <li class="nav2"><a href="logout.do">注销</a></li>
    <%}else{ %>
    <li class="nav2"><a href="${pageContext.request.contextPath}/individual.do?func=a">个人中心</a></li>
    <li class="nav2"><a href="logout.do">注销</a></li>
    <%}} %>
    </ul>
</nav>
<div class="wraper">
<div id="hidebg"></div><!--遮罩层-->
     <!-- 登录框 -->
      <div class="login-wrap" id="win">
       <div class="x">
        <a href="javascript:closeLogin();"><img src="img/x.png"></a>
       </div>
        <h2>Login</h2>
        
        <div class="form">
          <input id="un1" type="text" placeholder="Username" name="un" />
          <input id="pw1" type="password" placeholder="Password" name="pw" />
          <button id="bottona"> Sign in </button>
          <a href="javascript:openRegister();"> <p> Don't have an account? Register </p></a>
        </div>
    </div>

    <div class="login-wrap" id="register">
       <div class="x">
        <a href="javascript:closeRegister();"><img src="img/x.png"></a>
       </div>
        <h2>Login</h2>
        
        <div class="form">
          <input id="un2" type="text" placeholder="Username" name="un" />
          <input id="pw2" type="password" placeholder="Password" name="pw" />
          <input id="pw3" type="password" placeholder="Repassword" name="pw" />
          <input id="nk1" type="text" placeholder="nickname" name="un" />
          <button id="bottonb"> Register! </button>
        </div>
    </div>
  <%Hotel hotel = (Hotel)request.getAttribute("hotel"); 
    List<Room> minlist = (List<Room>)request.getAttribute("minpricelist");
    List<Comments> avgpoint = (List<Comments>)request.getAttribute("avgpoint"); %>
  <div class="topBox">
    <div class="titleBox">
      <div class="titleName"><%=hotel.getHotelName() %><span class="tip">综合评分：</span><span class="point"><%=hotel.getPoint() %></span></div>
      <%for(Room ml:minlist){
          if(ml.getHotelName().equals(hotel.getHotelName())) {
             if(ml.getPrice()!=null){
       %>
      <div class="titlePrice">￥<span><%=ml.getPrice() %></span>起</div>
      <% } 
        }
       }%>
    </div><!-- titleBox结束 -->
    <div class="addressBox">
     <div class="leftBox">
       <div class="topBox">
         <div class="imgBox"><img src="img/address.png"></div>  
         <div class="txtBox"><a href="#"><%=hotel.getAddress() %></a></div>
       </div>
       <div class="bottomBox">
         <div class="phoneBox">联系电话<span><%=hotel.getTel() %></span></div>
       </div>
     </div>  
     <div class="rightBox">
        <button><a href="#001">立即预定</a></button> 
     </div>
    </div><!-- addressBox结束 -->
    <div class="secTitleBox"><h3>民宿内景</h3></div><!-- secTitleBox结束 -->
    <div class="box">
    <div class="secBox">
      <ul id="loopPics">
   </ul>
    </div><!-- secBox结束 -->
    </div>
  </div><!-- topBox结束 -->

  <div class="homeTypeName">房型列表</div>
  <div class="homeList" id="001">
    <div class="homeListName">
      <div class="List1">房型</div>
      <div class="List6">政策</div><!-- 政策 -->
      <div class="List7">房费</div><!-- 房费 -->
    </div>
      <%List<Room> rlist = (List<Room>)request.getAttribute("roomlist"); 
          for(Room rl:rlist){
            if(rl.getTotal()>0){%>
      <ul class="masterUl">
        <li class="masterLi">
          <div class="List1">
            <div class="List1Name"><%=rl.getType() %></div>
          </div>
          <ul class="subUl">
            <li>
                <div class="List6"><%=rl.getPolicy() %></div><!-- 政策 -->
                <div class="List7">￥<span><%=rl.getPrice() %></span></div><!-- 房费 -->
                <%if(user == null){%>
                  <a href="javascript:openLogin();"><div class="List8"><div class="orderBtn"><div class="BtnTop">预定</div><div class="BtnBottom">在线付</div></div></div></a>
                  <%}else{ %>
                  <a href="${pageContext.request.contextPath}/livingorder.do?userId=<%=hotel.getUserId() %>&orderName=<%=hotel.getHotelName() %>&theme=<%=hotel.getTheme() %>&address=<%=hotel.getAddress() %>&type=<%=rl.getType() %>&price=<%=rl.getPrice() %>&wayofpayment=<%=rl.getWayofpayment() %>"><div class="List8"><div class="orderBtn"><div class="BtnTop">预定</div><div class="BtnBottom">在线付</div></div></div></a><!-- 按钮 -->
                <%} %>
            </li>
          </ul>
        </li><!-- li结束 -->
      </ul>
      <%} 
       }%>
    </div>
    <div class="homeIntroName">民宿介绍</div>
    <div class="homeIntroContent"><p><%=hotel.getIntroduce() %></p></div>

    <div class="homeOrderName">预定须知</div>
    <div class="homeOrderContent"><%=hotel.getIssue() %></div>

    <div class="homeCommentName">用户评论</div>
    <%List<Comments> clist = (List<Comments>)request.getAttribute("commentslist");
        for(Comments cl:clist){%>
    <div class="homeCommentContent">
      <ul>
        <li>
          <div class="leftBox">
            <div class="imgBox"><img src="./<%=cl.getImage() %>"></div>
            <div class="nameBox"><span><%=cl.getWriter() %></span></div>
          </div>
          <div class="rightBox">
            <div class="pointBox">评分<span class="point"><%=cl.getPoint() %><span></div>
            <div class="contentBox"><p><%=cl.getContent() %></p></div>
            <div class="footBox">发表于<span><%=cl.getUpdateTime().toString().substring(0,cl.getUpdateTime().toString().indexOf(".")) %></span></div>
          </div>
        </li>
      </ul>
    </div>
    <%} %>

    <div class="news_comment">
      <div class="news_comment_title"><h3>我要评论</h3></div>
      <form action="${pageContext.request.contextPath}/commentslivingsubmit.do?hotelName=<%=hotel.getHotelName() %>"	method="post">
      <div class="news_comment_point">
            <div class="words">评分:</div><div id="score1" name="point" data-score="1"><input type="text" name="point" class="news_comment_p" placeholder="1"></div>
      </div>
         <textarea maxlength="140" id="status" name="status" onkeydown='countChar("status","counter");' onkeyup='countChar("status","counter");'></textarea>
         <div>可以输入<span id="counter">140</span>字<br/> </div> 
         <input type="submit" name="a" class="subBtn" id="btn2" value="发布评论">
      </form>
    </div>
</div>

<div class="footer" id="footer">
  <div class="foot">
    <div class="follow_box">
      <p class="txt_follow">联系大村网</p>
    </div>
    <p class="main_links">
      <a href="http://www.xunlei.com/introduction.html" target="_blank">关于大村</a>
      <a href="http://www.xunlei.com/connection.html" target="_blank">联系我们</a>
      <a href="http://hr.xunlei.com/" target="_blank">加入大村</a>
      <a href="http://help.xunlei.com/" target="_blank">客户服务</a>
      <a href="http://yangtai.xunlei.com/" target="_blank">大村之旅</a>
    </p>
    <p class="links">
      <a href="http://www.xunlei.com/images/zzdx.jpg" target="_blank">增值电信业务粤B2-20050219号</a>
      <span>|</span>
      <a target="_blank" href="http://www.xunlei.com/images/wlwh.jpg">粤网文[2017]0901-125号</a>
      <span>|</span>
      <a target="_blank" href="http://www.xunlei.com/images/yp.jpg">广电节目经营(粤)字第786号-20050219号</a>
      <span>|</span>
      <a target="_blank" href="http://www.xunlei.com/images/cbxkz.jpg">互联网出版(粤)字053号</a>
    </p>
    <p>Copyright ? 2003-2017 XUNLEI.COM All Rights Reserved</p>
  </div>
</div>
</div>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="plug/star/lib/jquery.raty.js"></script>
<script type="text/javascript">
  $(document).ready(function () {
  $('.news_comment_p').val('1');
  var str="<%=hotel.getPhoto() %>";
 var myPics=str.split(";");
 var len=myPics.length;
 for(let i=0;i<len;i++){
  var temp="<li><a href='javascript:void(0);'><img src='"+myPics[i]+"' /></a>+</li>";
  $('#loopPics').prepend(temp);
 }
 new ZouMa().Start();
});
function ZouMa() {
 this.maxLength = 3; //最低显示数   
 this.Timer = 2000;//计时器间隔时间
 this.Ul = $(".box ul");
 var handId;//计时器id
 var self = this;
 this.Start = function () {
  if (self.Ul.children().length < this.maxLength) {
   self.Ul.append(self.Ul.children().clone());
  }
  handId = setInterval(self.Play, self.Timer);
 }
 this.Play = function () {
  var img = self.Ul.children().eq(0);
  var left = img.children().eq(0).width();
  img.animate({ "marginLeft": (-1 * left) + "px" }, 600, function () {
   $(this).css("margin-left", "auto").appendTo(self.Ul);
  });
 }
}

// $('#score1').raty({ score: $('#score1').data-score });
$('#score1').raty({
   mouseover: function(score, evt) {
   
    $('.news_comment_p').val(score);

  },
  score: function() {
    return $(this).attr('data-score');
  }
});
function countChar(textareaName,spanName)
{
document.getElementById(spanName).innerHTML = 140 - document.getElementById(textareaName).value.length;
}


$("#bottona").click(function(){
var params = {};  
    //params.XX必须与Spring Mvc controller中的参数名称一致    
    //否则在controller中使用@RequestParam绑定  
    params.username = $("#un1").val();  
    params.password = $("#pw1").val();
         $.ajax({  
        async:false,  
        type: "POST",  
        url: "login1.do",//注意路径  
        data:params,  
        dataType:"json",  
        success:function(data){  
            if(data.result=='SUCCESS'){  
                alert(data.error);
                location.reload();
            }else{  
                alert("修改失败，失败原因【" + data + "】");  
            }  
        },  
        error:function(data){  
            alert(data.result);  
        }  
  })
  });
  
  $("#bottonb").click(function(){
var params = {};  
    //params.XX必须与Spring Mvc controller中的参数名称一致    
    //否则在controller中使用@RequestParam绑定  
    params.username = $("#un2").val();  
    params.password = $("#pw2").val();
    params.password1 = $("#pw3").val();
    params.nickname = $("#nk1").val();
    
         $.ajax({  
        async:false,  
        type: "POST",  
        url: "register1.do",//注意路径  
        data:params,  
        dataType:"json",  
        success:function(data){  
            if(data.result=='SUCCESS'){  
                alert(data.error);
                location.reload();
            }else{  
                alert("修改失败，失败原因【" + data + "】");  
            }  
        },  
        error:function(data){  
            alert(data.result);  
        }  
  })
  });
</script>
</body>
</html>