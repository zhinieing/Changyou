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
	<title>游记</title>
	<meta charset="utf-8">
	 <link rel="stylesheet" type="text/css" href="css/frame1.css">
   <link rel="stylesheet" type="text/css" href="css/manage1.css">
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
<%String total="";
String func=(String)request.getAttribute("func");
if(user.getDel()==2&&func.equals("a")){ %>
  <h3>审查路线</h3>
  <hr>
  <%List<Route> list =(List<Route>)request.getAttribute("products");
  int []a=new int[6];
  int s=0;
  %>
  <ul>
  <% for(Route tl:list)
         {
         a[s]=tl.getRouteId();
         
         if(a[s]!=0){total=total+a[s]+",";}
         if(tl.getDel()==1){%>
    <li><a href="routedetail.do?title=<%=tl.getRouteTitle()%>" class="item"><%=tl.getRouteTitle() %></a> <span><%=tl.getUpdateTime() %></span><div id="<%=a[s]%>" class="imgBox"><img class="ticked" src="img/ticked.png"></div></li>
    <%}else{ %>
    <li><a href="routedetail.do?title=<%=tl.getRouteTitle()%>" class="item"><%=tl.getRouteTitle() %></a> <span><%=tl.getUpdateTime() %></span><div id="<%=a[s]%>" class="imgBox"><img class="tick" src="img/tick.png"></div></li>
    <%}s++;} %>
  </ul>
</div>
<!-- 分页功能 start -->  
    <div align="center">  
        <font size="2">共 ${page.totalPageCount} 页</font> <font size="2">第  
            ${page.pageNow} 页</font> <a href="${pageContext.request.contextPath}/routeexam.do?func=a&pageNow=1">首页</a>  
        <c:choose>  
            <c:when test="${page.pageNow - 1 > 0}">  
                <a href="${pageContext.request.contextPath}/routeexam.do?func=a&pageNow=${page.pageNow - 1}">上一页</a>  
            </c:when>  
            <c:when test="${page.pageNow - 1 <= 0}">  
                <a href="${pageContext.request.contextPath}/routeexam.do?func=a&pageNow=1">上一页</a>  
            </c:when>  
        </c:choose>  
        <c:choose>  
            <c:when test="${page.totalPageCount==0}">  
                <a href="${pageContext.request.contextPath}/routeexam.do?func=a&pageNow=${page.pageNow}">下一页</a>  
            </c:when>  
            <c:when test="${page.pageNow + 1 < page.totalPageCount}">  
                <a href="${pageContext.request.contextPath}/routeexam.do?func=a&pageNow=${page.pageNow + 1}">下一页</a>  
            </c:when>  
            <c:when test="${page.pageNow + 1 >= page.totalPageCount}">  
                <a href="${pageContext.request.contextPath}/routeexam.do?func=a&pageNow=${page.totalPageCount}">下一页</a>  
            </c:when>  
        </c:choose>  
        <c:choose>  
            <c:when test="${page.totalPageCount==0}">  
                <a href="${pageContext.request.contextPath}/routeexam.do?func=a&pageNow=${page.pageNow}">尾页</a>  
            </c:when>  
            <c:otherwise>  
                <a href="${pageContext.request.contextPath}/routeexam.do?func=a&pageNow=${page.totalPageCount}">尾页</a>  
            </c:otherwise>  
        </c:choose>  
    </div>  
    <!-- 分页功能 End -->
    <%} %>
    
<%
if(user.getDel()==2&&func.equals("b")){ %>
  <h3>审查游记</h3>
  <hr>
  <%List<Travels> list =(List<Travels>)request.getAttribute("products");
  int []a=new int[6];
  int s=0;
  %>
  <ul>
  <% for(Travels tl:list)
         {
         a[s]=tl.getTravelsId();
         
         if(a[s]!=0){total=total+a[s]+",";}
         if(tl.getDel()==1){%>
    <li><a href="detail.do?id=<%=tl.getTravelsId()%>" class="item"><%=tl.getTravelsTitle() %></a> <span><%=tl.getUpdateTime() %></span><div id="<%=a[s]%>" class="imgBox"><img class="ticked" src="img/ticked.png"></div></li>
    <%}else{ %>
    <li><a href="detail.do?id=<%=tl.getTravelsId()%>" class="item"><%=tl.getTravelsTitle() %></a> <span><%=tl.getUpdateTime() %></span><div id="<%=a[s]%>" class="imgBox"><img class="tick" src="img/tick.png"></div></li>
    <%}s++;} %>
  </ul>
</div>
<!-- 分页功能 start -->  
    <div align="center">  
        <font size="2">共 ${page.totalPageCount} 页</font> <font size="2">第  
            ${page.pageNow} 页</font> <a href="${pageContext.request.contextPath}/travelsexam.do?func=b&pageNow=1">首页</a>  
        <c:choose>  
            <c:when test="${page.pageNow - 1 > 0}">  
                <a href="${pageContext.request.contextPath}/travelsexam.do?func=b&pageNow=${page.pageNow - 1}">上一页</a>  
            </c:when>  
            <c:when test="${page.pageNow - 1 <= 0}">  
                <a href="${pageContext.request.contextPath}/travelsexam.do?func=b&pageNow=1">上一页</a>  
            </c:when>  
        </c:choose>  
        <c:choose>  
            <c:when test="${page.totalPageCount==0}">  
                <a href="${pageContext.request.contextPath}/travelsexam.do?func=b&pageNow=${page.pageNow}">下一页</a>  
            </c:when>  
            <c:when test="${page.pageNow + 1 < page.totalPageCount}">  
                <a href="${pageContext.request.contextPath}/travelsexam.do?func=b&pageNow=${page.pageNow + 1}">下一页</a>  
            </c:when>  
            <c:when test="${page.pageNow + 1 >= page.totalPageCount}">  
                <a href="${pageContext.request.contextPath}/travelsexam.do?func=b&pageNow=${page.totalPageCount}">下一页</a>  
            </c:when>  
        </c:choose>  
        <c:choose>  
            <c:when test="${page.totalPageCount==0}">  
                <a href="${pageContext.request.contextPath}/travelsexam.do?func=b&pageNow=${page.pageNow}">尾页</a>  
            </c:when>  
            <c:otherwise>  
                <a href="${pageContext.request.contextPath}/travelsexam.do?func=b&pageNow=${page.totalPageCount}">尾页</a>  
            </c:otherwise>  
        </c:choose>  
    </div>  
    <!-- 分页功能 End -->
    <%} %>
    <%
if(user.getDel()==2&&func.equals("c")){ %>
  <h3>审查游记</h3>
  <hr>
  <%List<Comment> list =(List<Comment>)request.getAttribute("products");
  int []a=new int[6];
  int s=0;
  %>
  <ul>
  <% for(Comment tl:list)
         {
         a[s]=tl.getCommentId();
         
         if(a[s]!=0){total=total+a[s]+",";}
         if(tl.getDel()==1){%>
    <li><a href="#" class="item"><%=tl.getContent() %></a> <span><%=tl.getUpdateTime() %></span><div id="<%=a[s]%>" class="imgBox"><img class="ticked" src="img/ticked.png"></div></li>
    <%}else{ %>
    <li><a href="#" class="item"><%=tl.getContent() %></a> <span><%=tl.getUpdateTime() %></span><div id="<%=a[s]%>" class="imgBox"><img class="tick" src="img/tick.png"></div></li>
    <%}s++;} %>
  </ul>
</div>
<!-- 分页功能 start -->  
    <div align="center">  
        <font size="2">共 ${page.totalPageCount} 页</font> <font size="2">第  
            ${page.pageNow} 页</font> <a href="${pageContext.request.contextPath}/commentexam.do?func=c&pageNow=1">首页</a>  
        <c:choose>  
            <c:when test="${page.pageNow - 1 > 0}">  
                <a href="${pageContext.request.contextPath}/commentexam.do?func=c&pageNow=${page.pageNow - 1}">上一页</a>  
            </c:when>  
            <c:when test="${page.pageNow - 1 <= 0}">  
                <a href="${pageContext.request.contextPath}/commentexam.do?func=c&pageNow=1">上一页</a>  
            </c:when>  
        </c:choose>  
        <c:choose>  
            <c:when test="${page.totalPageCount==0}">  
                <a href="${pageContext.request.contextPath}/commentexam.do?func=c&pageNow=${page.pageNow}">下一页</a>  
            </c:when>  
            <c:when test="${page.pageNow + 1 < page.totalPageCount}">  
                <a href="${pageContext.request.contextPath}/commentexam.do?func=c&pageNow=${page.pageNow + 1}">下一页</a>  
            </c:when>  
            <c:when test="${page.pageNow + 1 >= page.totalPageCount}">  
                <a href="${pageContext.request.contextPath}/commentexam.do?func=c&pageNow=${page.totalPageCount}">下一页</a>  
            </c:when>  
        </c:choose>  
        <c:choose>  
            <c:when test="${page.totalPageCount==0}">  
                <a href="${pageContext.request.contextPath}/commentexam.do?func=c&pageNow=${page.pageNow}">尾页</a>  
            </c:when>  
            <c:otherwise>  
                <a href="${pageContext.request.contextPath}/commentexam.do?func=c&pageNow=${page.totalPageCount}">尾页</a>  
            </c:otherwise>  
        </c:choose>  
    </div>  
    <!-- 分页功能 End -->
    <%} %>
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
 <script type="text/javascript">
 var func = "<%=func%>"
 if(func=="a"){
  getPoints="<%=total%>"
  var params = {};
  var idArray=getPoints.split(",");

 for(let j=1;j<=6;j++){
  $("#"+j).attr('id',idArray[j-1]);
 }

 for(let i=0;i<6;i++){
 if(idArray[i]!=0){
   $("#"+idArray[i]).click(function(){
      params.id=idArray[i];
      var a="#"+idArray[i]+" "+"img";
      if($(a).hasClass("tick")){
      $(a).attr("class","ticked")
      $(a).attr("src","img/ticked.png");
      $.ajax({  
        async:false,  
        type: "POST",  
        url: "routeexam2.do",//注意路径  
        data:params,  
        dataType:"json",  
        success:function(data){  
            if(data.result=='SUCCESS'){ 
            alert("恢复成功");  
            }else{  
                alert("恢复失败");  
            }  
        },  
        error:function(data){  
            alert(data.result);  
        }  
    });
    }
      else if($(a).hasClass("ticked")){
      $(a).attr("class","tick")
      $(a).attr("src","img/tick.png");
      $.ajax({  
        async:false,  
        type: "POST",  
        url: "routeexam1.do",//注意路径  
        data:params,  
        dataType:"json",  
        success:function(data){  
            if(data.result=='SUCCESS'){ 
            alert("撤销成功");  
            }else{  
                alert("撤销失败");  
            }  
        },  
        error:function(data){  
            alert(data.result);  
        }  
    });
    }
 });
 }
 }}
 
 if(func=="b"){
  getPoints="<%=total%>"
  var params = {};
  var idArray=getPoints.split(",");

 for(let j=1;j<=6;j++){
  $("#"+j).attr('id',idArray[j-1]);
 }

 for(let i=0;i<6;i++){
 if(idArray[i]!=0){
   $("#"+idArray[i]).click(function(){
      params.id=idArray[i];
      var a="#"+idArray[i]+" "+"img";
      if($(a).hasClass("tick")){
      $(a).attr("class","ticked")
      $(a).attr("src","img/ticked.png");
      $.ajax({  
        async:false,  
        type: "POST",  
        url: "travelsexam2.do",//注意路径  
        data:params,  
        dataType:"json",  
        success:function(data){  
            if(data.result=='SUCCESS'){ 
            alert("恢复成功");  
            }else{  
                alert("恢复失败");  
            }  
        },  
        error:function(data){  
            alert(data.result);  
        }  
    });
    }
      else if($(a).hasClass("ticked")){
      $(a).attr("class","tick")
      $(a).attr("src","img/tick.png");
      $.ajax({  
        async:false,  
        type: "POST",  
        url: "travelsexam1.do",//注意路径  
        data:params,  
        dataType:"json",  
        success:function(data){  
            if(data.result=='SUCCESS'){ 
            alert("撤销成功");  
            }else{  
                alert("撤销失败");  
            }  
        },  
        error:function(data){  
            alert(data.result);  
        }  
    });
    }
 });
 }
 }}


if(func=="c"){
  getPoints="<%=total%>"
  var params = {};
  var idArray=getPoints.split(",");

 for(let j=1;j<=6;j++){
  $("#"+j).attr('id',idArray[j-1]);
 }

 for(let i=0;i<6;i++){
 if(idArray[i]!=0){
   $("#"+idArray[i]).click(function(){
      params.id=idArray[i];
      var a="#"+idArray[i]+" "+"img";
      if($(a).hasClass("tick")){
      $(a).attr("class","ticked")
      $(a).attr("src","img/ticked.png");
      $.ajax({  
        async:false,  
        type: "POST",  
        url: "commentexam2.do",//注意路径  
        data:params,  
        dataType:"json",  
        success:function(data){  
            if(data.result=='SUCCESS'){ 
            alert("恢复成功");  
            }else{  
                alert("恢复失败");  
            }  
        },  
        error:function(data){  
            alert(data.result);  
        }  
    });
    }
      else if($(a).hasClass("ticked")){
      $(a).attr("class","tick")
      $(a).attr("src","img/tick.png");
      $.ajax({  
        async:false,  
        type: "POST",  
        url: "commentexam1.do",//注意路径  
        data:params,  
        dataType:"json",  
        success:function(data){  
            if(data.result=='SUCCESS'){ 
            alert("撤销成功");  
            }else{  
                alert("撤销失败");  
            }  
        },  
        error:function(data){  
            alert(data.result);  
        }  
    });
    }
 });
 }
 }}
 </script>
</body>
</html>