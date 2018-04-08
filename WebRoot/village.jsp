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
   <link rel="stylesheet" type="text/css" href="css/villige.css">
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
<div class="topBox">
  <h3>定制您的偏爱乡村</h3>
  <hr>
</div>
<div class="middleBox">
  <div class="leftBox">
  <div class="subjectTable">
    <div class="title">
      <img src="img/subject.png">
      <h3>主题</h3>
    </div>
    <div class="content" id="ch1">
      <ul>
        <li><a href="javascript:void(0);" class="Selected">不限</a></li>
         <li><a href="javascript:void(0);" class="notSelect">登山</a></li>
          <li><a href="javascript:void(0);" class="notSelect">划水</a></li>
           <li><a href="javascript:void(0);" class="notSelect">赏花</a></li>
            <li><a href="javascript:void(0);" class="notSelect">猜灯</a></li>
             <li><a href="javascript:void(0);" class="notSelect">游市</a></li>
              <li><a href="javascript:void(0);" class="notSelect">斗鸡</a></li>
               <li><a href="javascript:void(0);" class="notSelect">赛马</a></li>
                <li><a href="javascript:void(0);" class="notSelect">宴会</a></li>
                 <li><a href="javascript:void(0);" class="notSelect">踏青</a></li>
                  <li><a href="javascript:void(0);" class="notSelect">访古</a></li>
                   <li><a href="javascript:void(0);" class="notSelect">采摘</a></li>
      </ul>
    </div>
  </div>

   <div class="subjectTable season" id="ch2">
    <div class="title">
      <img src="img/maple.png">
      <h3>时令</h3>
    </div>
    <div class="content">
      <ul>
         <li><a href="javascript:void(0);" class="Selected">不限</a></li>
         <li><a href="javascript:void(0);" class="notSelect">春天</a></li>
         <li><a href="javascript:void(0);" class="notSelect">夏天</a></li>
         <li><a href="javascript:void(0);" class="notSelect">秋天</a></li>
         <li><a href="javascript:void(0);" class="notSelect">冬天</a></li>
      </ul>
    </div>
  </div>

  </div>
  <div id="villigeMap"></div>
  </div>
  <div class="villigeList">
    <h3>推荐<span id="time"></span><span id="subject">游玩</span>的乡村</h3>
    <hr>
      <div class="con">

    <ul>
    <%List<Village> list =(List<Village>)request.getAttribute("products");
     String point = null;
      for(Village tl:list)
         {
           if(point==null){
           point=tl.getVillagePoint()+"|";
           }else{
           point=point+tl.getVillagePoint()+"|";
           }
           %>

      <li>

        <img style="width:100%;height:100%;"src="<%=tl.getVillageImg()%>"/>

        <div class="txt">

          <h3><a href="villagedetail.do?id=<%=tl.getVillageId()%>"><%=tl.getVillageTitle() %></a></h3>

          <p><%=tl.getVillageInt() %></p>

        </div>

      </li>
      <%} point=point.substring(0,point.length()-1);%>

    </ul>

  </div>
  </div>
</div>
<!-- 分页功能 start -->  
    <div align="center">  
        <font size="2">共 ${page.totalPageCount} 页</font> <font size="2">第  
            ${page.pageNow} 页</font> <a href="${pageContext.request.contextPath}/village.do?villageSeason=<%=request.getAttribute("villageSeason")%>&villageSpecial=<%=request.getAttribute("villageSpecial")%>&pageNow=1">首页</a>  
        <c:choose>  
            <c:when test="${page.pageNow - 1 > 0}">  
                <a href="${pageContext.request.contextPath}/village.do?villageSeason=<%=request.getAttribute("villageSeason")%>&villageSpecial=<%=request.getAttribute("villageSpecial")%>&pageNow=${page.pageNow - 1}">上一页</a>  
            </c:when>  
            <c:when test="${page.pageNow - 1 <= 0}">  
                <a href="${pageContext.request.contextPath}/village.do?villageSeason=<%=request.getAttribute("villageSeason")%>&villageSpecial=<%=request.getAttribute("villageSpecial")%>&pageNow=1">上一页</a>  
            </c:when>  
        </c:choose>  
        <c:choose>  
            <c:when test="${page.totalPageCount==0}">  
                <a href="${pageContext.request.contextPath}/village.do?villageSeason=<%=request.getAttribute("villageSeason")%>&villageSpecial=<%=request.getAttribute("villageSpecial")%>&pageNow=${page.pageNow}">下一页</a>  
            </c:when>  
            <c:when test="${page.pageNow + 1 < page.totalPageCount}">  
                <a href="${pageContext.request.contextPath}/village.do?villageSeason=<%=request.getAttribute("villageSeason")%>&villageSpecial=<%=request.getAttribute("villageSpecial")%>&pageNow=${page.pageNow + 1}">下一页</a>  
            </c:when>  
            <c:when test="${page.pageNow + 1 >= page.totalPageCount}">  
                <a href="${pageContext.request.contextPath}/village.do?villageSeason=<%=request.getAttribute("villageSeason")%>&villageSpecial=<%=request.getAttribute("villageSpecial")%>&pageNow=${page.totalPageCount}">下一页</a>  
            </c:when>  
        </c:choose>  
        <c:choose>  
            <c:when test="${page.totalPageCount==0}">  
                <a href="${pageContext.request.contextPath}/village.do?villageSeason=<%=request.getAttribute("villageSeason")%>&villageSpecial=<%=request.getAttribute("villageSpecial")%>&pageNow=${page.pageNow}">尾页</a>  
            </c:when>  
            <c:otherwise>  
                <a href="${pageContext.request.contextPath}/village.do?villageSeason=<%=request.getAttribute("villageSeason")%>&villageSpecial=<%=request.getAttribute("villageSpecial")%>&pageNow=${page.totalPageCount}">尾页</a>  
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
<script type="text/javascript">
  var xyStr='<%=point%>';
</script>
<script type="text/javascript" src="js/villige.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>

<script type="text/javascript">

$(".con ul li").hover(function(){

  $(this).find(".txt").stop().animate({height:"225px"},400);

  $(this).find(".txt h3").stop().animate({paddingTop:"60px"},400);

},function(){

  $(this).find(".txt").stop().animate({height:"45px"},400);

  $(this).find(".txt h3").stop().animate({paddingTop:"0px"},400);

})

$("#ch1 a").click(function(e){
    $("#ch1 a").attr("class","notSelect");
    $(e.target).attr("class","Selected");
    var text1=$("#ch1 .Selected").text();
    if((text1!='不限')){
      $("#subject").text(text1);
    }else{
      text1="";
      $("#subject").text("游玩");
    }
    window.location.href = "village.do?villageSeason=<%=request.getAttribute("villageSeason")%>&villageSpecial="+text1;
});

$("#ch2 a").click(function(e){
    $("#ch2 a").attr("class","notSelect");
    $(e.target).attr("class","Selected");
    var text2=$("#ch2 .Selected").text();
    if((text2!='不限')){
      $("#time").text(text2);
    }else{
      text2="";
      $("#time").text("");
    }
    window.location.href = "village.do?villageSeason="+text2+"&villageSpecial=<%=request.getAttribute("villageSpecial")%>";
});

<%String a=(String)request.getAttribute("villageSeason");
String b=(String)request.getAttribute("villageSpecial");
String[] array = {"登山", "划水", "赏花","猜灯","游市","斗鸡","赛马","宴会","踏青","访古","采摘"};
String[] array1 = {"春天", "夏天", "秋天","冬天"};
int k=1;
int w=1;
for(int i=0;i<11;i++)
{
if(array[i].equals(b))
{
k=1;break;
}
else
{
k=2;
}}
for(int i=0;i<4;i++){
if(array1[i].equals(a))
{
w=1;break;
}else
{
w=2;
}
}
if(w==2){a="不限";}
if(k==2){b="不限";}%>
$(document).ready(function(){
  $("#ch1 a").each(function(){
    if($(this).text()=="<%=b%>"){
        $(this).attr("class","Selected");
         if(($(this).text()!='不限')){
            $("#subject").text($(this).text());
          }else{
            $("#subject").text("游玩");
        }
    }else{
      $(this).attr("class","notSelect");
    }
  });

   $("#ch2 a").each(function(){
    if($(this).text()=="<%=a%>"){
        $(this).attr("class","Selected");
         if(($(this).text()!='不限')){
            $("#time").text($(this).text());
          }else{
            $("#time").text("");
          }
        
    }else{
      $(this).attr("class","notSelect");
    }
  });
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
</div>
</body>
</html>