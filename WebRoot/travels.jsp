<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="cn.it.model.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>游记</title>
	<meta charset="utf-8">
	<base href="<%=basePath%>">
	 <link rel="stylesheet" type="text/css" href="css/frame1.css">
	 <link rel="stylesheet" type="text/css" href="css/travelNote.css">
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
	<div class="titleBody">
		<div class="name"><h2>游记列表</h2></div>
    <div class="choice">
      <select id="sel" name="sel">
      <%String select = (String)request.getAttribute("select");%>
      <%if(select.equals("a")){ %>
        <option value ="a" selected="selected">按时间排序</option>
        <option value ="b">按赞数排序</option>
        <option value="c">按收藏排序</option>
        <option value="d">按评论数排序</option>
        <%} %>
       <%if(select.equals("b")){ %>
        <option value ="a">按时间排序</option>
        <option value ="b" selected="selected">按赞数排序</option>
        <option value="c">按收藏排序</option>
        <option value="d">按评论数排序</option>
        <%} %>
        <%if(select.equals("c")){ %>
        <option value ="a">按时间排序</option>
        <option value ="b" >按赞数排序</option>
        <option value="c" selected="selected">按收藏排序</option>
        <option value="d">按评论数排序</option>
        <%} %>
        <%if(select.equals("d")){ %>
        <option value ="a">按时间排序</option>
        <option value ="b" >按赞数排序</option>
        <option value="c" >按收藏排序</option>
        <option value="d" selected="selected">按评论数排序</option>
        <%} %>
      </select>
    </div>
    <div class="search"><input type="text" id="title" name="title" placeholder="关键字"></div>
    <div class="searchBtn" onclick="location.href='travels.do?title='+document.getElementById('title').value+'&sel='+document.getElementById('sel').value"><button>搜索</button></div>
	</div>
	<div class="mainBody">	
		<ul>
		<%List<Travels> list =(List<Travels>)request.getAttribute("products");
      for(Travels tl:list){
      if(tl.getDel()==1){
      String str =tl.getTravelsContent();
      String a=null;
      String b=null;
        Matcher m1 = Pattern.compile("<p.*?>(.*?)</p>").matcher(str);
		Matcher m2 = Pattern.compile("<img.+?src=\"(.+?)\".+?/?>").matcher(str);
	    while(m1.find()){
	     a = m1.group(1);
	     if(a.length()<20){
	     a=a;}else{
	     a=a.substring(0,20);}
	        break;
	    }	
	    while(m2.find()){
	       b=m2.group(1);
	        break;
	    }	
	    if(b==null){
	    b="img/wallpaper-2441105.jpg";} %>
			<li>
				<div class="imgBox">
					<img src="<%=b%>">
				</div>
				<div class="txtBox">
					<div class="titleBox"><a href="detail.do?id=<%=tl.getTravelsId() %>"><%=tl.getTravelsTitle()%></a><span><%=tl.getUpdateTime().substring(0,19)%></span></div>
					<div class="introBox"><p><%=a%>...</p></div>
					<div class="flagBox">
						<div class="goodBox flagChild"><div class="imgBox"><img src="img/good/ic_vote_normal.png"></div><span><%=tl.getTravelsCount() %></span></div>
						<div class="collectionBox flagChild"><div class="imgBox"><img src="img/good/ic_thank.png"></div><span><%=tl.getTravelsCollect() %></span></div>
						<div class="commentBox flagChild"><div class="imgBox"><img src="img/good/pen.png"></div><span><%=tl.getTravelsComment() %></span></div>
					</div>
				</div>
			</li><!-- li结束 -->
         <%}} %>
		</ul>	
	</div>
	
	<!-- 分页功能 start -->  
    <div align="center">  
        <font size="2">共 ${page.totalPageCount} 页</font> <font size="2">第  
            ${page.pageNow} 页</font> <a href="${pageContext.request.contextPath}/travels.do?title=<%=request.getAttribute("title") %>&sel=<%=select%>&pageNow=1">首页</a>  
        <c:choose>  
            <c:when test="${page.pageNow - 1 > 0}">  
                <a href="${pageContext.request.contextPath}/travels.do?title=<%=request.getAttribute("title") %>&sel=<%=select%>&pageNow=${page.pageNow - 1}">上一页</a>  
            </c:when>  
            <c:when test="${page.pageNow - 1 <= 0}">  
                <a href="${pageContext.request.contextPath}/travels.do?title=<%=request.getAttribute("title") %>&sel=<%=select%>&pageNow=1">上一页</a>  
            </c:when>  
        </c:choose>  
        <c:choose>  
            <c:when test="${page.totalPageCount==0}">  
                <a href="${pageContext.request.contextPath}/travels.do?title=<%=request.getAttribute("title") %>&sel=<%=select%>&pageNow=${page.pageNow}">下一页</a>  
            </c:when>  
            <c:when test="${page.pageNow + 1 < page.totalPageCount}">  
                <a href="${pageContext.request.contextPath}/travels.do?title=<%=request.getAttribute("title") %>&sel=<%=select%>&pageNow=${page.pageNow + 1}">下一页</a>  
            </c:when>  
            <c:when test="${page.pageNow + 1 >= page.totalPageCount}">  
                <a href="${pageContext.request.contextPath}/travels.do?title=<%=request.getAttribute("title") %>&sel=<%=select%>&pageNow=${page.totalPageCount}">下一页</a>  
            </c:when>  
        </c:choose>  
        <c:choose>  
            <c:when test="${page.totalPageCount==0}">  
                <a href="${pageContext.request.contextPath}/travels.do?title=<%=request.getAttribute("title") %>&sel=<%=select%>&pageNow=${page.pageNow}">尾页</a>  
            </c:when>  
            <c:otherwise>  
                <a href="${pageContext.request.contextPath}/travels.do?title=<%=request.getAttribute("title") %>&sel=<%=select%>&pageNow=${page.totalPageCount}">尾页</a>  
            </c:otherwise>  
        </c:choose>  
    </div>  
    <!-- 分页功能 End -->
</div>

<div class="footer" id="footer">
  <div class="foot">
    <div class="follow_box">
      <p class="txt_follow">联系大村网</p>
      <div class="follow_list">
        <a href="javascript:void(0)" class="wechat hide_txt">官方微信
          <span class="code_box"><i class="ic_arr"></i><img src="./迅雷产品中心_files/code.jpg" alt="官方微信"></span>
        </a>
        <a target="_blank" href="http://weibo.com/xunleigf?from=myfollow_all&amp;is_all=1" class="sina hide_txt">新浪微博</a>
        <a target="_blank" href="http://bbs.xunlei.com/forum.php" class="forum hide_txt">论坛</a>
        <a target="_blank" href="http://tieba.baidu.com/f?ie=utf-8&amp;kw=%E8%BF%85%E9%9B%B7&amp;fr=search" class="post hide_txt">帖吧</a>
      </div>
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