<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="cn.it.model.*"%>
<%@page import="java.util.List"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="stylesheet" type="text/css" href="css/frame.css">
	<link rel="stylesheet" type="text/css" href="css/form.css">

	<title>畅游</title>
</head>
<body>
<div class="wrap">
	<div class="first">
		<div class="nav">
		<ul> 
		    <li class="current">
				        <a href="${pageContext.request.contextPath}/welcome.do">首页</a>
				      </li>
				      <li>
				        <a href="${pageContext.request.contextPath}/village.do?villageSeason=<%=""%>&villageSpecial=<%=""%>">乡村</a>
				      </li>
				      <li>
				        <a href="${pageContext.request.contextPath}/routeshow.do">路线</a>
				      </li>
				      <li>
				        <a href="${pageContext.request.contextPath}/spot.do">景点</a>
				      </li>
				      <li>
				        <a href="${pageContext.request.contextPath}/living.do">民宿</a>
				      </li>
				      <li>
				        <a href="${pageContext.request.contextPath}/travels.do?title=<%=""%>&sel=<%="a"%>">游记</a>
				      </li>
		</ul>
		 </div>
		<div class="slideshow">
		  <div class="slideshow-image" style="background-image: url('img/wallpaper-2441105.jpg')"></div>
		  <div class="slideshow-image" style="background-image: url('img/1325.jpg')"></div>
		  <div class="slideshow-image" style="background-image: url('img/117.jpg')"></div>
		  <div class="slideshow-image" style="background-image: url('img/599.jpg')"></div>
		</div>
		<div class="logo"><img src="img/logo2.png"></div>
		<%User user = (User)session.getAttribute("userses");
        if(user != null){%>
		   <%if(user.getDel()==2){ %>
		<div class="logIn"><a href="${pageContext.request.contextPath}/admin.jsp">个人中心</a></div>
		<%}else if(user.getDel()==3){ %>
		<div class="logIn"><a href="${pageContext.request.contextPath}/hotelexam.do">个人中心</a></div>
		<%}else{ %>
		<div class="logIn"><a href="${pageContext.request.contextPath}/individual.do?func=a">个人中心</a></div>
		<%} %>
		<%}else{ %>
        <a style="position:absolute;left:50%;top:50%;margin-left:-3px;z-index:10;">${requestScope.error}</a>
		<div class="logIn"><a href="javascript:openLogin();">立即登录</a></div>
		<%} %>
		 <div id="hidebg"></div><!--遮罩层-->
		  <div class="login-wrap" id="win">
		 	 <div class="x">
		 	 	<a href="javascript:closeLogin();"><img src="img/x.png"></a>
		 	 </div>
			  <h2>Login</h2>
			  
			   <div class="form">
			  <form action="${pageContext.request.contextPath}/login.do"
			method="post">
			    <input type="text" placeholder="Username" name="username" />
			    <input type="password" placeholder="Password" name="password" />
			    <button> Sign in </button>
			    <a href="javascript:openRegister();"> <p> Don't have an account? Register </p></a>
			    </form>
			  </div>
		</div>

		<div class="login-wrap" id="register">
		 	 <div class="x">
		 	 	<a href="javascript:closeRegister();"><img src="img/x.png"></a>
		 	 </div>
			  <h2>Login</h2>
			  
			  <div class="form">
			  <form action="${pageContext.request.contextPath}/register.do"
			method="post">
			    <input type="text" placeholder="Username" name="username" />
			    <input type="password" placeholder="Password" name="password" />
			    <input type="password" placeholder="Repassword" name="passwordre" />
			    <input type="text" placeholder="Nickname" name="nickname" />
			    <button> Register! </button>
			 </form>
			  </div>
		</div>
	</div>
	<div class="second">
	<%List<Village> list =(List<Village>) request.getAttribute("villagelist");
      for(Village tl:list) {%>
		<div class="villageBox">
			<div class="shade">	
			</div>
			 <h1><a href="villagedetail.do?id=<%=tl.getVillageId()%>"><%=tl.getVillageTitle() %> <small>welcome</small></a></h1>
			<img src="<%=tl.getVillageImg() %>">
		</div>
		<%} %>
		
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
<script src="js/city.js"></script>
<script src="js/jquery.js"></script>
<script>
  (function(){
     //弹出登陆框
 
    
//城市选择控件
      var pHtmlStr = '';  
            for(var name in pc){  
                pHtmlStr = pHtmlStr + '<option>'+name+'</option>';  
            }  
            $("#province").html(pHtmlStr);  
            $("#province").change(function(){  
                var pname = $("#province option:selected").text();  
                var pHtmlStr = '';  
                var cityList = pc[pname];  
                for(var index in cityList){  
                    pHtmlStr = pHtmlStr + '<option style="background:transparent">'+cityList[index]+'</option>';  
                }  
                $("#city").html(pHtmlStr);  
            });  
            $("#province").change(); 
  })()

   function openLogin(){
   document.getElementById("win").style.display="block";
   var hideobj=document.getElementById("hidebg");
   hidebg.style.display="block";  //显示隐藏层
   hidebg.style.height=document.body.clientHeight+"px";  //设置隐藏层的高度为当前页面高度
}
function closeLogin(){
	 document.getElementById("hidebg").style.display="none";
   document.getElementById("win").style.display="none";
}

	function openRegister(){
		document.getElementById("win").style.display="none";
		document.getElementById("register").style.display="block";
	}
	function closeRegister(){
		 document.getElementById("hidebg").style.display="none";
   document.getElementById("register").style.display="none";
}
</script>

</body>
</html>