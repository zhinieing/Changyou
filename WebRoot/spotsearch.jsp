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
  <title>景点</title>
  <meta charset="utf-8">
   <link rel="stylesheet" type="text/css" href="css/frame1.css">
   
   <link href="plug/slider/css/jquery.slideBox.css" rel="stylesheet" type="text/css" />
   <link rel="stylesheet" type="text/css" href="css/ticket.css">
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
<!-- 地图 -->
<div class="mapBox">
<div class="x">
    <a href="javascript:closeMap();"><img src="img/x.png"></a>
</div>
<div id="villigeMap"></div>
</div>
<!-- 地图结束 -->
  <div class="headBox"> 
  <div class="leftBox">
   <div class="titleBox"><h1>景点</h1></div>
  <form style="display: flex;" action="${pageContext.request.contextPath}/spotsearch.do"
      method="post"> 
    <div class="searchBox">
      <div class="addressBox">
        <div class="name"><span>景点特色</span></div>
        <div class="put"><input type="text" name="theme" placeholder="主题" id="villageIpt"  ></div>
      </div>
      <div class="keyBox">
        <div class="name"><span>关键字</span></div>
        <div class="put"><input type="text" name="spotName" placeholder="景点名"></div>
      </div>
      <div class="searchBtn"><button>搜索</button></div>
    </div><!-- searchBox结束 -->
    </form>
    </div><!-- leftBox结束 -->
    <div class="hotelTable" id="hotelTableId" onblur="closehotelTable()">
        <ul>
          <li><a href="javascript:void(0);" onclick="document.getElementById('villageIpt').value=this.innerHTML;">山水</a></li>
          <li><a href="javascript:void(0);"onclick="document.getElementById('villageIpt').value=this.innerHTML;">田园</a></li>
          <li><a href="javascript:void(0);" onclick="document.getElementById('villageIpt').value=this.innerHTML;">漂流</a></li>
          <li><a href="javascript:void(0);" onclick="document.getElementById('villageIpt').value=this.innerHTML;">风光</a></li>
          <li><a href="javascript:void(0);" onclick="document.getElementById('villageIpt').value=this.innerHTML;">文化</a></li>
          <li><a href="javascript:void(0);" onclick="document.getElementById('villageIpt').value=this.innerHTML;">农家</a></li>
          <li><a href="javascript:void(0);" onclick="document.getElementById('villageIpt').value=this.innerHTML;">亲子</a></li>
          <li><a href="javascript:void(0);" onclick="document.getElementById('villageIpt').value=this.innerHTML;">花卉</a></li>
          <li><a href="javascript:void(0);" onclick="document.getElementById('villageIpt').value=this.innerHTML;">氧吧</a></li>
          <li><a href="javascript:void(0);" onclick="document.getElementById('villageIpt').value=this.innerHTML;">观光</a></li>
          <li><a href="javascript:void(0);" onclick="document.getElementById('villageIpt').value=this.innerHTML;">休闲</a></li>
          <li><a href="javascript:void(0);" onclick="document.getElementById('villageIpt').value=this.innerHTML;">生态</a></li>
        </ul>
      </div>
    <!-- <img src="img/taiwan-72.jpg">  -->
    <div class="rightBox">
    <div id="demo1" class="slideBox">
    
      <ul class="items">
        <%List<Spot> list =(List<Spot>)request.getAttribute("products");
          List<Ticket> tllist = (List<Ticket>)request.getAttribute("ticketlist");
          List<Ticket> minList = (List<Ticket>)request.getAttribute("minpricelist");
          List<Comments> commentscount = (List<Comments>)request.getAttribute("commentscount");
          List<Spot> maxspotpoint = (List<Spot>)request.getAttribute("maxspotpoint");
            for(Spot maxspot:maxspotpoint){%>
        <li><a href="${pageContext.request.contextPath}/spotdetail.do?spotName=<%=maxspot.getSpotName() %>" title="<%=maxspot.getSpotName() %>"><img src="<%=maxspot.getImage() %>" style="idth:600px;height:300px;"></a></li>
        <%}%>
      </ul>

    </div><!-- demo4结束 -->
   </div>
  </div>
    <div class="mainBody">  
    <ul>
      <%
          for(Spot sl:list)
      {%>
      <li class="pointLi">
      <div class="baseBox">
        <div class="imgBox">
          <img src="<%=sl.getImage() %>">
        </div>
        <div class="txtBox">
          <a href="${pageContext.request.contextPath}/spotdetail.do?spotName=<%=sl.getSpotName() %>"><div class="titleBox"><h2><%=sl.getSpotName() %></h2></div></a>
          <div class="introBox"><p>特色：<%=sl.getTheme() %></p></div>
          <div class="addressBox">位置：<span><%=sl.getAddress() %></span><a class="mapBtn" id="1" href="javascript:void(0)">点击在地图中显示</a></div>
        </div>
        <div class="priceBox">
          <%for(Comments cl:commentscount){
             if(cl.getCommentsName().equals(sl.getSpotName())){
               if(cl.getTotal()!=0){%>
          <div class="commentBox">用户评价<span><%=cl.getTotal() %></span>条</div>
          <% }
            }
           }%>
          <%for(Ticket ml:minList){
             if(ml.getSpotName().equals(sl.getSpotName())){ 
               if(ml.getPriceofticket()!=null){%>
          <div class="pBox">￥<span><%=ml.getPriceofticket() %></span><span class="word">起</span></div>
          <% }
            }
           }%>
        </div>
        </div>
        <div class="ticketBox">
          <div class="ticketName">
            <div class="ticketTypeName name">门票类型</div>
            <div class="ticketPriceName name">门票价格</div>
            <div class="ticketMethodName name">政策</div>
          </div>
        </div>
        <div class="ticketList">
        <%
          for(Ticket tl:tllist){
            if(tl.getSpotName().equals(sl.getSpotName())){
              if(tl.getPriceofticket()!=null){
        %>
          <ul>
            <li>
            <div class="ticketType item"><span><%=tl.getTypeofticket() %></span></div>
            <div class="ticketPrice item">￥<span><%=tl.getPriceofticket() %></span></div>
            <div class="ticketMethod item"><span><%=tl.getPolicy() %></span></div>
            <!--  <div class="ticketBtn item"><button><span>预</span><span>定</span><tton></div> -->
            <%if(user == null){%>
              <a href="javascript:openLogin();"><div class="List8"><div class="orderBtn"><div class="BtnTop">预定</div><div class="BtnBottom">在线付</div></div></div></a>
              <%}else{ %>
              <a href="${pageContext.request.contextPath}/spotorder.do?orderName=<%=sl.getSpotName() %>&theme=<%=sl.getTheme() %>&address=<%=sl.getAddress() %>&type=<%=tl.getTypeofticket() %>&price=<%=tl.getPriceofticket() %>&wayofpayment=<%=tl.getWayofpayment() %>"><div class="List8"><div class="orderBtn"><div class="BtnTop">预定</div><div class="BtnBottom">在线付</div></div></div></a><!-- 按钮 -->
            <%} %>
            </li>
          </ul>
        <%} 
         }
        }%>
        </div>
      </li><!-- li结束 -->
      <%} %>
    </ul> 
  </div>
</div>

<!-- 分页功能 start -->  
    <div align="center">  
        <font size="2">共 ${page.totalPageCount} 页</font> <font size="2">第  
            ${page.pageNow} 页</font> <a href="${pageContext.request.contextPath}/spotsearch.do?pageNow=1&theme=<%=request.getAttribute("theme") %>&spotName=<%=request.getAttribute("spotName") %>">首页</a>  
        <c:choose>  
            <c:when test="${page.pageNow - 1 > 0}">  
                <a href="${pageContext.request.contextPath}/spotsearch.do?pageNow=${page.pageNow - 1}&theme=<%=request.getAttribute("theme") %>&spotName=<%=request.getAttribute("spotName") %>">上一页</a>  
            </c:when>  
            <c:when test="${page.pageNow - 1 <= 0}">  
                <a href="${pageContext.request.contextPath}/spotsearch.do?pageNow=1&theme=<%=request.getAttribute("theme") %>&spotName=<%=request.getAttribute("spotName") %>">上一页</a>  
            </c:when>  
        </c:choose>  
        <c:choose>  
            <c:when test="${page.totalPageCount==0}">  
                <a href="${pageContext.request.contextPath}/spotsearch.do?pageNow=${page.pageNow}&theme=<%=request.getAttribute("theme") %>&spotName=<%=request.getAttribute("spotName") %>">下一页</a>  
            </c:when>  
            <c:when test="${page.pageNow + 1 < page.totalPageCount}">  
                <a href="${pageContext.request.contextPath}/spotsearch.do?pageNow=${page.pageNow + 1}&theme=<%=request.getAttribute("theme") %>&spotName=<%=request.getAttribute("spotName") %>">下一页</a>  
            </c:when>  
            <c:when test="${page.pageNow + 1 >= page.totalPageCount}">  
                <a href="${pageContext.request.contextPath}/spotsearch.do?pageNow=${page.totalPageCount}&theme=<%=request.getAttribute("theme") %>&spotName=<%=request.getAttribute("spotName") %>">下一页</a>  
            </c:when>  
        </c:choose>  
        <c:choose>  
            <c:when test="${page.totalPageCount==0}">  
                <a href="${pageContext.request.contextPath}/spotsearch.do?pageNow=${page.pageNow}&theme=<%=request.getAttribute("theme") %>&spotName=<%=request.getAttribute("spotName") %>">尾页</a>  
            </c:when>  
            <c:otherwise>  
                <a href="${pageContext.request.contextPath}/spotsearch.do?pageNow=${page.totalPageCount}&theme=<%=request.getAttribute("theme") %>&spotName=<%=request.getAttribute("spotName") %>">尾页</a>  
            </c:otherwise>  
        </c:choose>  
    </div>  
    <!-- 分页功能 End -->  


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
<script type="text/javascript" src="plug/laydate-master/laydate.dev.js"></script>
<script src="plug/slider/js/jquery.slideBox.js" type="text/javascript"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=uWMxTbxqAG64MZBSQFXMXwidjGvwXT6x"></script>
 <script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.js"></script>
  <link rel="stylesheet" href="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.css" />
<script type="text/javascript" src="js/ticket.js"></script>
<script type="text/javascript">
    jQuery(function($){

  $('#demo1').slideBox();

  $('#demo2').slideBox({

    direction : 'top',//left,top#方向

    duration : 0.3,//滚动持续时间，单位：秒

    easing : 'linear',//swing,linear//滚动特效

    delay : 5,//滚动延迟时间，单位：秒

    startIndex : 1//初始焦点顺序

  });

  $('#demo3').slideBox({

    duration : 0.3,//滚动持续时间，单位：秒

    easing : 'linear',//swing,linear//滚动特效

    delay : 5,//滚动延迟时间，单位：秒

    hideClickBar : false,//不自动隐藏点选按键

    clickBarRadius : 10

  });

  $('#demo4').slideBox({

    hideBottomBar : true//隐藏底栏

  });

});

 

       function openhotelTable(){
      var hotelTable=document.getElementById('hotelTableId');
     hotelTable.style.display="block";
    } 
     function closehotelTable(){
      var hotelTable=document.getElementById('hotelTableId');
     hotelTable.style.display="none";
    } 

    $(document).bind("click",function(event){
        var e = event || window.event; 
        var elem = e.srcElement||e.target; 
        while(elem) 
        { 
           if(elem.id == "villageIpt") 
            { 
                openhotelTable();
                return; 
            } 

            else if(elem.id == "hotelTableId") 
            { 
                return; 
            } 
            elem = elem.parentNode;      
        } 
     
       $('#hotelTableId').hide();
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

</script>

</body>
</html>