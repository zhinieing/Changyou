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
	<title>乡村</title>
	<meta charset="utf-8">
	 <link rel="stylesheet" type="text/css" href="css/frame1.css">
   <link rel="stylesheet" type="text/css" href="css/route.css">
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
<h3>路线推荐</h3>
<hr>
<div class="container">
<div class="leftBox">
  <div class="btn" id="choice1"><a href="#">路线一</a></div>
  <div class="btn" id="choice2"><a href="#">路线二</a></div>
  <div class="btn" id="choice3"><a href="#">路线三</a></div>
  <div class="btn" id="choice4"><a href="#">路线四</a></div>
</div>
<div class="middleBox">
  <div id="villigeMap">
</div>
</div>
<div class="rightBox">
   <div class="routeIntroduce  intro1">
   <h2>蔡甸乡村一日游</h2> 
   <p>蔡甸区有美丽的乌梅村与丁湾村，两村各具特色，相距半小时车程，推荐一并游玩。</p>
  </div>
  <div class="routeIntroduce  intro2" style='display:none' >
   <h2>江夏乡村一日游</h2> 
   <p>江夏区有各具特色的童周岭村和东港村，童周岭村有各具风味的自然湾，东港村有河塘密布、一马平川的自然风光，辆村相距一小时车程，可以在一日内游完。</p>
  </div>
  <div class="routeIntroduce  intro3  " style='display:none'>
   <h2>新洲乡村两日游</h2> 
   <p>新洲区有众多美丽的乡村，这些村庄各具特色，可以玩两天。</p>
  </div>
  <div class="routeIntroduce  intro4  " style='display:none'>
   <h2>黄陂乡村一日游</h2> 
   <p>黄陂区有美丽的芦子河村、黄庙村与火庙村，这些乡村各具特色，且相距不远，推荐一并游玩。</p>
  </div>
</div>
</div><!-- container结束 -->
 
<div class="userRoute">
 <div class="guideBox">
    <h2>畅友路线分享</h2>
    <div class="logIn"><a href="javascript:openLogin1();">我要分享</a></div>
  </div>
  


 <div id="wing">
  <div class="x">
          <a href="javascript:closeLogin1();"><img src="img/x.png"></a>
         </div>
  <div class="wingWrap">
  <div class="wingTitle">创建新游记</div>
  <div class="tripTitle">游记名称</div>
  <form action="routesubmit1.do">
  <div class="wingInput"><input type="text" name="title"></div>
  <div class="wingBtn"><button>下一步</button></div>
  </form>
  </div>
</div>
 
  <hr>
        <div class="con">

    <ul>
    <%List<Route> list =(List<Route>)request.getAttribute("products");
      for(Route tl:list)
         {if(tl.getDel()==1){
           %>

      <li>

        <img style="width:100%;height:100%;"src="./<%=tl.getRouteImg()%>"/>

        <div class="txt">

          <h3><a href="routedetail.do?title=<%=tl.getRouteTitle()%>"><%=tl.getRouteTitle()%></a></h3>
          <P>作者：<%=tl.getRouteWriter() %></P>
        </div>

      </li>
      <%}} %>

    </ul>

  </div>
</div>
</div>
<!-- 分页功能 start -->  
    <div align="center">  
        <font size="2">共 ${page.totalPageCount} 页</font> <font size="2">第  
            ${page.pageNow} 页</font> <a href="${pageContext.request.contextPath}/routeshow.do?pageNow=1">首页</a>  
        <c:choose>  
            <c:when test="${page.pageNow - 1 > 0}">  
                <a href="${pageContext.request.contextPath}/routeshow.do?pageNow=${page.pageNow - 1}">上一页</a>  
            </c:when>  
            <c:when test="${page.pageNow - 1 <= 0}">  
                <a href="${pageContext.request.contextPath}/routeshow.do?pageNow=1">上一页</a>  
            </c:when>  
        </c:choose>  
        <c:choose>  
            <c:when test="${page.totalPageCount==0}">  
                <a href="${pageContext.request.contextPath}/routeshow.do?pageNow=${page.pageNow}">下一页</a>  
            </c:when>  
            <c:when test="${page.pageNow + 1 < page.totalPageCount}">  
                <a href="${pageContext.request.contextPath}/routeshow.do?pageNow=${page.pageNow + 1}">下一页</a>  
            </c:when>  
            <c:when test="${page.pageNow + 1 >= page.totalPageCount}">  
                <a href="${pageContext.request.contextPath}/routeshow.do?pageNow=${page.totalPageCount}">下一页</a>  
            </c:when>  
        </c:choose>  
        <c:choose>  
            <c:when test="${page.totalPageCount==0}">  
                <a href="${pageContext.request.contextPath}/routeshow.do?pageNow=${page.pageNow}">尾页</a>  
            </c:when>  
            <c:otherwise>  
                <a href="${pageContext.request.contextPath}/routeshow.do?pageNow=${page.totalPageCount}">尾页</a>  
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
    <p>Copyright ? 2003-2017 XUNLEI.COM All Rights Reserved</p>
  </div>
</div>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=uWMxTbxqAG64MZBSQFXMXwidjGvwXT6x"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/CurveLine/1.5/src/CurveLine.min.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jQuery.center.js"></script>

<script type="text/javascript" src="js/route.js"></script>

<script type="text/javascript">
var wumeiPosition=new BMap.Point(113.958869,30.560149),
    caiyuanPosition=new BMap.Point(114.870849,30.853494),
    yangchaPosition=new BMap.Point(114.681765,30.919176),
    shanggangPosition=new BMap.Point(114.649271,30.917519),
    tuanshangjiePosition=new BMap.Point(114.945177,30.81449),
    yangjiashiPosition=new BMap.Point(114.585051,30.944286),
    luzihePosition=new BMap.Point(114.585051,30.944286),
    dingwanPosition=new BMap.Point(113.92852,30.56367),
    tongzhoulinPosition=new BMap.Point(114.449306,30.294974),
    donggangPosition=new BMap.Point(114.180934,30.191342);
    huangmiaoPosition=new BMap.Point(114.278266,30.945843);
    huomiaoPosition=new BMap.Point(114.40684,30.860316);
var points1 = [wumeiPosition, dingwanPosition];
var points2 = [tongzhoulinPosition, donggangPosition];
var points3 = [yangjiashiPosition,shanggangPosition,yangchaPosition, caiyuanPosition,tuanshangjiePosition];
var points4 = [ huangmiaoPosition,huomiaoPosition,luzihePosition];
var curve1 = new BMapLib.CurveLine(points1, {strokeColor:"blue", strokeWeight:3, strokeOpacity:0.5}); //创建弧线对象
var curve2 = new BMapLib.CurveLine(points2, {strokeColor:"blue", strokeWeight:3, strokeOpacity:0.5}); //创建弧线对象
var curve3 = new BMapLib.CurveLine(points3, {strokeColor:"blue", strokeWeight:3, strokeOpacity:0.5}); //创建弧线对象
var curve4 = new BMapLib.CurveLine(points4, {strokeColor:"blue", strokeWeight:3, strokeOpacity:0.5}); //创建弧线对象
 map.addOverlay(curve1);
 map.addOverlay(curve2);
 map.addOverlay(curve3);
 map.addOverlay(curve4);
 curve1.show();
 curve2.hide();
 curve3.hide();
 curve4.hide();
 var intro1=$('.intro1');
 var intro2=$('.intro2');
 var intro3=$('.intro3');
 var intro4=$('.intro4');
  document.getElementById('choice1').onmouseenter=function(e){
     curve1.show();
     curve2.hide();
     curve3.hide();
     curve4.hide();
     intro1.css('display','block');
     intro2.css('display','none');
     intro3.css('display','none');
     intro4.css('display','none');

  }
  // document.getElementById('choice1').onmouseout=function(e){
  //    curve1.hide();
  //    curve2.hide();
  //    curve3.hide();
  //    curve4.hide();
  // }
    document.getElementById('choice2').onmouseenter=function(e){
     curve1.hide();
     curve2.show();
     curve3.hide();
     curve4.hide();
     intro1.css('display','none');
     intro2.css('display','block');
     intro3.css('display','none');
     intro4.css('display','none');
  }
  //  document.getElementById('choice2').onmouseout=function(e){
  //    curve1.hide();
  //    curve2.hide();
  //    curve3.hide();
  //    curve4.hide();
  // }
    document.getElementById('choice3').onmouseenter=function(e){
     curve1.hide();
     curve2.hide();
     curve3.show();
     curve4.hide();
      intro1.css('display','none');
     intro2.css('display','none');
     intro3.css('display','block');
     intro4.css('display','none');
  }
  //    document.getElementById('choice3').onmouseout=function(e){
  //    curve1.hide();
  //    curve2.hide();
  //    curve3.hide();
  //    curve4.hide();
  // }
     document.getElementById('choice4').onmouseenter=function(e){
     curve1.hide();
     curve2.hide();
     curve3.hide();
     curve4.show();
      intro1.css('display','none');
     intro2.css('display','none');
     intro3.css('display','none');
     intro4.css('display','block');
  }
   $(".con ul li").hover(function(){

  $(this).find(".txt").stop().animate({height:"225px"},400);

  $(this).find(".txt h3").stop().animate({paddingTop:"60px"},400);

},function(){

  $(this).find(".txt").stop().animate({height:"45px"},400);

  $(this).find(".txt h3").stop().animate({paddingTop:"0px"},400);

})  


  function openLogin1(){
   // document.getElementById("wing").style.display="block";
   $('#wing').css('display','block');
   $('#wing').center();
   var hideobj=document.getElementById("hidebg");
   hidebg.style.display="block";  //显示隐藏层
   hidebg.style.height=document.body.clientHeight+"px";  //设置隐藏层的高度为当前页面高度
}
function closeLogin1(){
   document.getElementById("hidebg").style.display="none";
   document.getElementById("wing").style.display="none";
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
</div>
</body>
</html>