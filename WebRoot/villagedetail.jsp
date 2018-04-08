<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="cn.it.model.*"%>
<%@page import="java.util.List"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>乡村详情</title>
	<meta charset="utf-8">
	 <link rel="stylesheet" type="text/css" href="css/frame1.css">
    <link rel="stylesheet" type="text/css" href="css/vilDetail.css">
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
    int ids=0;
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
<%Village village=(Village)request.getAttribute("village");%>
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
<div class="vilTitle titleCss">
<div class="titleBox">
    <div class="titleDetailBox">
      <h3><%=village.getVillageTitle() %></h3>
      <span>welcome To</span>
    </div>
    <div class="goodBox">
      <div class="goodItem agreeBox">
        <div class="IconBox"  id="goodBtn">
          <img class="goodOn" src="img/good/ic_vote_checked.png">
          <img class="goodOff" src="img/good/ic_vote_normal.png">
        </div>
        <div id="count1" class="NumberBox"><%=village.getVillageCount() %></div>
      </div>
      <div class="goodItem collection">
        <div class="IconBox"  id="collectionBtn">
           <img class="collectionOn" src="img/good/ic_thanked.png">
           <img class="collectionOff" src="img/good/ic_thank.png">
        </div>
        <div id="count2" class="NumberBox"><%=village.getVillageCollect() %></div>
      </div>
    </div>
  </div><!-- titleBox结束 -->
  <hr>
</div>
<div class="vilIntroWraper">
  <div class="leftBox">
    <div class="introBox">
      <div class="imgBox">
        <img src="<%=village.getVillageImg() %>">
      </div>
      <div class="introText">
        <p><%=village.getVillageDetail() %></p>
      </div>
    </div>
  </div><!-- leftBox结束 -->
  <div class="rightBox">
     <div id="villigeMap"></div>
     <div class="introText MapText">
       <p style="font-size:1.5em;color:#F0AB38;margin-bottom:15px;">参考位置</p>
       <p>距您<span style="font-size:1.2em;color:#F0AB38;margin:0 5px;font-weight:600;">35</span>Km</p>
     </div>
  </div><!-- rightBox结束 -->
</div><!-- vilIntroWraper结束 -->

<div class="vilDetailWraper">
    <div class="homeStayWrapper titleCss"> 
   <div class="news_comment_title"><h3>民宿推荐</h3></div>
   
          <div class="homeList">
          <%List<Hotel> villageHotels = (List<Hotel>)request.getAttribute("villageHotels");
            List<Room> minlist = (List<Room>)request.getAttribute("minpricelist");
            for(Hotel vh:villageHotels){ %>
           <div class="homeItem">
            <div class="homeImg">
              <img src="<%=vh.getImage() %>">
            </div>
            <div class="homeIntro">
              <h4><a href="livingdetail.do?hotelName=<%=vh.getHotelName() %>"><%=vh.getHotelName() %></a></h4>
              <p><span class="intro1"><%=vh.getAddress() %></span></p>
              <span class="intro2"><%=vh.getPoint() %></span>
            </div>
            <div class="homePrice">
              <%for(Room ml:minlist){
                   if(ml.getHotelName().equals(vh.getHotelName())) {
                     if(ml.getPrice()!=null){
               %>
              <span>￥</span><span class="price"><%=ml.getPrice() %></span><span>起</span>
              <% } 
                }
              }%>
            </div>
          </div><!-- homeItem -->
          <%} %>
        </div><!-- homeList   -->
      </div><!-- homeStayWrapper结束 -->
</div><!-- vilDetailWraper结束 -->
    
    <div class="news_comment_title"><h3>用户评论</h3></div>
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
      <form action="${pageContext.request.contextPath}/commentslvillagesubmit.do?villageTitle=<%=village.getVillageTitle() %>&id=<%=village.getVillageId() %>"	method="post">
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
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=uWMxTbxqAG64MZBSQFXMXwidjGvwXT6x"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="plug/star/lib/jquery.raty.js"></script>
<script type="text/javascript">
var map = new BMap.Map("villigeMap");
 var a="<%=village.getVillagePoint()%>";
 console.log(a);
 var p1=a.split(',')[0];
 var p2=a.split(',')[1];
  console.log(p1);
   console.log(p2);
  var point = new BMap.Point(p1,p2);
  map.centerAndZoom(point, 12);
  var marker= new BMap.Marker(point);
   map.addOverlay(marker);
   marker.setAnimation(BMAP_ANIMATION_BOUNCE); 
   var label = new BMap.Label("<%=village.getVillageTitle()%>", { offset: new BMap.Size(20, -10) });
   marker.setLabel(label);
   
     var params = {};  
    //params.XX必须与Spring Mvc controller中的参数名称一致    
    //否则在controller中使用@RequestParam绑定  
    params.ida = "<%=village.getVillageId()%>";  
    params.idb = "<%=ids%>";
    params.classt="village";
   $(document).ready(function(){
   $('.news_comment_p').val('1');
   
   var geolocation = new BMap.Geolocation();
  geolocation.getCurrentPosition(function(r){
    if(this.getStatus() == BMAP_STATUS_SUCCESS){
      var d=map.getDistance(r.point,point);
      var rd=parseInt(d/1000);
      $('.MapText span').text(rd);
    }
    else {
      alert('failed'+this.getStatus());
    }        
  },{enableHighAccuracy: true})
  
  $.ajax({  
        async:false,  
        type: "POST",  
        url: "good1.do",//注意路径  
        data:params,  
        dataType:"json",  
        success:function(data){  
            if(data.result=='SUCCESS'){  
             
             $(".goodOn").css("display","block");
            $(".goodOff").css("display","none");    
        }else{  
            $(".goodOn").css("display","none");
             $(".goodOff").css("display","block"); 
            }
         },  
        error:function(data){  
            alert(data.result);  
        }  
    });
    $.ajax({  
        async:false,  
        type: "POST",  
        url: "collect1.do",//注意路径  
        data:params,  
        dataType:"json",  
        success:function(data){  
            if(data.result=='SUCCESS'){  
             
            $(".collectionOn").css("display","block");
         $(".collectionOff").css("display","none"); 
        }else{  
            $(".collectionOn").css("display","none");
         $(".collectionOff").css("display","block"); 
            }
         },  
        error:function(data){  
            alert(data.result);  
        }  
    });
});


  $("#goodBtn").click(function(){
      if($(".goodOn").css("display")=="none"){
        $(".goodOn").css("display","block");
         $(".goodOff").css("display","none");
         $.ajax({  
        async:false,  
        type: "POST",  
        url: "good.do",//注意路径  
        data:params,  
        dataType:"json",  
        success:function(data){  
            if(data.result=='SUCCESS'){   
            $('#count1').text(data.count);
            }else{  
                alert("请登录！");  
            }  
        },  
        error:function(data){  
            alert(data.result);  
        }  
    });
      }
      else{
         $(".goodOn").css("display","none");
         $(".goodOff").css("display","block");
         $.ajax({  
        async:false,  
        type: "POST",  
        url: "gooda.do",//注意路径  
        data:params,  
        dataType:"json",  
        success:function(data){  
            if(data.result=='SUCCESS'){   
            $('#count1').text(data.count);
            }else{  
                alert("请登录！");  
            }  
        },  
        error:function(data){  
            alert(data.result);  
        }  
    });
      }
  });
   $("#collectionBtn").click(function(){
      if($(".collectionOn").css("display")=="none"){
        $(".collectionOn").css("display","block");
         $(".collectionOff").css("display","none");
          $.ajax({  
        async:false,  
        type: "POST",  
        url: "collectvillage.do",//注意路径  
        data:params,  
        dataType:"json",  
        success:function(data){  
            if(data.result=='SUCCESS'){   
                $('#count2').text(data.count);
            }else{  
                alert("请登录！");  
            }  
        },  
        error:function(data){  
            alert(data.result);  
        }  
    });
      }
      else{
         $(".collectionOn").css("display","none");
         $(".collectionOff").css("display","block");
         $.ajax({  
        async:false,  
        type: "POST",  
        url: "collectvillage1.do",//注意路径  
        data:params,  
        dataType:"json",  
        success:function(data){  
            if(data.result=='SUCCESS'){  
                $('#count2').text(data.count); 
                
            }else{  
                alert("请登录！");  
            }  
        },  
        error:function(data){  
            alert(data.result);  
        }  
    });
      }
  });
    
    
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



  </script>
  </div>
</body>
</html>