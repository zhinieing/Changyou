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
   <link rel="stylesheet" type="text/css" href="css/order.css">
   <style type="text/css">
     .iptBox{
      margin-left:10px;
      border:none;
      font-size: 16px;
     }
   </style>
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
  <div class="titleBox">
    <h1>订单支付</h1>
  </div>
  <div class="contentBox">
  <%Order order = (Order)request.getAttribute("order");
    String fun=(String)request.getAttribute("fun"); %>
  <form>
      <ul>
        <li>景点名称:<span><%=order.getOrderName() %></span></li>
        <li>特色:<span><%=order.getTheme() %></span></li>
        <li>位置:<span><%=order.getAddress() %></span></li>
        <li>门票类型:<span><%=order.getType() %></span></li>
        <li>门票价格:<span class="singlePrice"><%=order.getPrice() %></span></li>
        <li>支付方式:<span><%=order.getWayofpayment() %></span></li>
        <li>购买数目:<input class="iptBox" type="text" value='<%=order.getNumber() %>' readonly="readonly"></li>
        <li>总价:<input class="iptBox" type="text" value='<%=order.getTotal() %>' readonly="readonly"></li>
        <%if(fun==null){ %>
        <li><a href="orderdel1.do?id=<%=order.getOrderId() %>">支付</a><a href="orderdel1.do?id=0">稍后支付</a></li>
        <%} %>
      </ul>
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
</body>
</html>