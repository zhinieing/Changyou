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
      <link rel="stylesheet" type="text/css" href="css/form.css">
    <script type="text/javascript" src="js/jquery.js"></script>
    <script src="js/form.js"></script>
    <style type="text/css">
     .iptBox{
      margin-left:10px;
      border:none;
      font-size: 16px;
      width:20px;
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
  <div class="titleBox">
    <h1>确认订单</h1>
  </div>
  <%String orderName = new String(request.getParameter("orderName").getBytes("ISO-8859-1"),"UTF-8");
    String theme = new String(request.getParameter("theme").getBytes("ISO-8859-1"),"UTF-8");
    String address = new String(request.getParameter("address").getBytes("ISO-8859-1"),"UTF-8");
    String type = new String(request.getParameter("type").getBytes("ISO-8859-1"),"UTF-8");
    int price = Integer.parseInt(request.getParameter("price"));
    int userId = Integer.parseInt(request.getParameter("userId"));
    String wayofpayment = new String(request.getParameter("wayofpayment").getBytes("ISO-8859-1"),"UTF-8");%>
  <div class="contentBox">
    <form action="${pageContext.request.contextPath}/ordersubmit.do?userId=<%=userId %>&orderName=<%=orderName %>&theme=<%=theme %>&address=<%=address %>&type=<%=type %>&price=<%=price %>&wayofpayment=<%=wayofpayment %>"
			method="post">                           
      <ul>
        <li>民宿名称:<span><%=orderName %></span></li>
        <li>特色:<span><%=theme %></span></li>
        <li>位置:<span><%=address %></span></li>
        <li>房间类型:<span><%=type %></span></li>
        <li>房间价格:<span class="singlePrice"><%=price %></span></li>
        <li>支付方式:<span><%=wayofpayment %></span></li>
        <li>购买数目:<a style="margin-left:20px;" id="purchaseMinus" href="javascript:void(0);">-</a><input class="iptBox" type="text" name="number" value='0'  id="purchaseAmount"  readonly="readonly"><a id="purchasePlus" href="javascript:void(0);">+</a></li>
        <li>总价:<input style="width:100px" class="iptBox sumPrice" name="total" type="text" value='0'  readonly="readonly"></li>
        <li><button>确认</button></li>
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
<script type="text/javascript">
  var plusBtn=$('#purchasePlus');
  var minusBtn=$('#purchaseMinus');
  plusBtn.click(function(){
    var number=$('#purchaseAmount').val();
    number=parseInt(number)+1;
    var singlePrice=$('.singlePrice').text();
    singlePrice=parseInt(singlePrice);
    var sumPrice=number* singlePrice;
    console.log(sumPrice);
    $('#purchaseAmount').val(number);
    $('.sumPrice').val(sumPrice);
  });
   minusBtn.click(function(){
    var number=$('#purchaseAmount').val();
    number=parseInt(number)-1;
    if(number>=0){
    $('#purchaseAmount').val(number);
     var singlePrice=$('.singlePrice').text();
    singlePrice=parseInt(singlePrice);
    var sumPrice=number* singlePrice;
    $('#purchaseAmount').val(number);
    $('.sumPrice').val(sumPrice);
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
</script>
</body>
</html>