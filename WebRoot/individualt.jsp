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
	<title>个人中心</title>
	<meta charset="utf-8">
	 <link rel="stylesheet" type="text/css" href="css/frame1.css">
   <link rel="stylesheet" type="text/css" href="css/newIndividual.css">
    <link rel="stylesheet" href="plug/imgUpload/dist/css/dropify.min.css">
      <script type="text/javascript" src="plug/ueditor/third-party/jquery.min.js"></script>
      <link href="plug/ueditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="plug/ueditor/third-party/jquery.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="plug/ueditor/umeditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="plug/ueditor/umeditor.min.js"></script>
    <script type="text/javascript" src="plug/ueditor/lang/zh-cn/zh-cn.js"></script>
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
  <div class="leftBox">
    <div class="contentBox">
      <div class="imgBox">
        <img src="./<%=user.getImage() %>">
      </div>
         <div class="b1"><a href="individual.do?func=a">个人资料</a></div>
      <div class="b1"><a href="individual.do?func=b">我的订单</a></div>
      <div class="b1"><a href="javascript:void(0);">我的收藏</a></div>
      <div class="b2"><a href="individual.do?func=ca">乡村</a></div>
      <div class="b2"><a href="individual.do?func=cb">景点</a></div>
      <div class="b2"><a href="individual.do?func=cc">路线</a></div>
      <div class="b1"><a href="javascript:void(0);">我的发布</a></div>
      <div class="b2"><a href="individual.do?func=da">游记</a></div>
      <div class="b2"><a href="individual.do?func=db">路线</a></div>
      <div class="b1"><a href="individual.do?func=e">发布游记</a></div>


    </div>
  </div>
  <div class="rightBox">
    <%String func = (String)request.getAttribute("func");%>
    
    <% if(func.equals("a")){ %>
    
     <form action="upload.do" method="post" enctype="multipart/form-data">
    <div class="headImg1">
         <input type="file" name="file" id="input-file-now-custom-2" class="dropify" data-height="200" data-default-file="./<%=user.getImage() %>" data-max-file-size="1M"/>
    </div>
    <button class="infoBtn">修改头像</button><div style="color:red"><a>${requestScope.mess}</a></div>
    </form>
    <form action="imforupdate.do" method="post">
      <div class="c1"><div class="c1Name">昵称:</div><textarea maxlength="7" name="nickname"><%=user.getNickname() %></textarea></div>
      <div class="c1"><div class="c1Name">邮箱:</div><textarea maxlength="30" name="email"><%=user.getEmail() %></textarea></div>
      <div class="c1"><div class="c1Name">签名:</div><textarea maxlength="16" name="specials"><%=user.getSpecials() %></textarea></div>
      <button class="infoBtn">修改资料</button>
    </form>
    <%} %>
    <% if(func.equals("b")){ %>
    
    <ul class="tableTitlec2">
      <li>订单名称</li>
      <li>订单状态</li>
      <li>下单时间</li>
      <li>订单处理</li>
    </ul>
    <%List<Order> list =(List<Order>)request.getAttribute("products");
      for(Order tl:list)
         {%>
    <ul class="tableListc2">
      <li>
        <div class="listItem"><a href="orderdetail.do?id=<%=tl.getOrderId() %>"><%=tl.getOrderName() %></a></div>
        <%if(tl.getDel()==1){ %>
        <div class="listItem">未支付</div>
        <div class="listItem"><%=tl.getUpdateTime().substring(0,19) %></div>
        <div class="listItem"><a href="orderdel1.do?id=<%=tl.getOrderId()%>">支付</a><a href="orderdelete.do?id=<%=tl.getOrderId()%>">取消订单</a></div>
        <%}else if(tl.getDel()==2){ %>
        <div class="listItem">已支付</div>
        <div class="listItem"><%=tl.getUpdateTime().substring(0,19) %></div>
        <div class="listItem"><a href="orderdelete.do?id=<%=tl.getOrderId()%>">退款</a></div>
        <%}else if(tl.getDel()==3){ %>
        <div class="listItem">商家已接受</div>
        <div class="listItem"><%=tl.getUpdateTime().substring(0,19) %></div>
        <div class="listItem"><a href="orderdelete.do?id=<%=tl.getOrderId()%>">退款</a></div>
        <%}else if(tl.getDel()==4){ %>
        <div class="listItem">商家已拒绝</div>
        <div class="listItem"><%=tl.getUpdateTime().substring(0,19) %></div>
        <div class="listItem"><a href="orderdelete.do?id=<%=tl.getOrderId()%>">退款</a></div>
        <%}%>
        

      </li>
      <%} %>
    </ul>
    <!-- 分页功能 start -->  
    <div align="center">  
        <font size="2">共 ${page.totalPageCount} 页</font> <font size="2">第  
            ${page.pageNow} 页</font> <a href="${pageContext.request.contextPath}/individual.do?func=b&pageNow=1">首页</a>  
        <c:choose>  
            <c:when test="${page.pageNow - 1 > 0}">  
                <a href="${pageContext.request.contextPath}/individual.do?func=b&pageNow=${page.pageNow - 1}">上一页</a>  
            </c:when>  
            <c:when test="${page.pageNow - 1 <= 0}">  
                <a href="${pageContext.request.contextPath}/individual.do?func=b&pageNow=1">上一页</a>  
            </c:when>  
        </c:choose>  
        <c:choose>  
            <c:when test="${page.totalPageCount==0}">  
                <a href="${pageContext.request.contextPath}/individual.do?func=b&pageNow=${page.pageNow}">下一页</a>  
            </c:when>  
            <c:when test="${page.pageNow + 1 < page.totalPageCount}">  
                <a href="${pageContext.request.contextPath}/individual.do?func=b&pageNow=${page.pageNow + 1}">下一页</a>  
            </c:when>  
            <c:when test="${page.pageNow + 1 >= page.totalPageCount}">  
                <a href="${pageContext.request.contextPath}/individual.do?func=b&pageNow=${page.totalPageCount}">下一页</a>  
            </c:when>  
        </c:choose>  
        <c:choose>  
            <c:when test="${page.totalPageCount==0}">  
                <a href="${pageContext.request.contextPath}/individual.do?func=b&pageNow=${page.pageNow}">尾页</a>  
            </c:when>  
            <c:otherwise>  
                <a href="${pageContext.request.contextPath}/individual.do?func=b&pageNow=${page.totalPageCount}">尾页</a>  
            </c:otherwise>  
        </c:choose>  
    </div>  
    <!-- 分页功能 End -->
    <%} %>
    <% if(func.equals("ca")){ %>
    
    <ul class="tableTitlec3">
      <li class="first">名称</li>
      <li class="second"></li>
    </ul>
    <%List<Village> list =(List<Village>)request.getAttribute("products");
      for(Village tl:list)
         {%>
    <ul class="tableListc3">
      <li>
        <div class="listItem first"><a href="villagedetail.do?id=<%=tl.getVillageId()%>"><%=tl.getVillageTitle() %></a></div>
        <div class="listItem second" onclick="location.href='delete1.do?ida=<%=user.getId()%>&idb=<%=tl.getVillageId()%>'"><button>取消收藏</button></div>
      </li>
    </ul>
      <%}%>
      <!-- 分页功能 start -->  
    <div align="center">  
        <font size="2">共 ${page.totalPageCount} 页</font> <font size="2">第  
            ${page.pageNow} 页</font> <a href="${pageContext.request.contextPath}/individual.do?func=ca&pageNow=1">首页</a>  
        <c:choose>  
            <c:when test="${page.pageNow - 1 > 0}">  
                <a href="${pageContext.request.contextPath}/individual.do?func=ca&pageNow=${page.pageNow - 1}">上一页</a>  
            </c:when>  
            <c:when test="${page.pageNow - 1 <= 0}">  
                <a href="${pageContext.request.contextPath}/individual.do?func=ca&pageNow=1">上一页</a>  
            </c:when>  
        </c:choose>  
        <c:choose>  
            <c:when test="${page.totalPageCount==0}">  
                <a href="${pageContext.request.contextPath}/individual.do?func=ca&pageNow=${page.pageNow}">下一页</a>  
            </c:when>  
            <c:when test="${page.pageNow + 1 < page.totalPageCount}">  
                <a href="${pageContext.request.contextPath}/individual.do?func=ca&pageNow=${page.pageNow + 1}">下一页</a>  
            </c:when>  
            <c:when test="${page.pageNow + 1 >= page.totalPageCount}">  
                <a href="${pageContext.request.contextPath}/individual.do?func=ca&pageNow=${page.totalPageCount}">下一页</a>  
            </c:when>  
        </c:choose>  
        <c:choose>  
            <c:when test="${page.totalPageCount==0}">  
                <a href="${pageContext.request.contextPath}/individual.do?func=ca&pageNow=${page.pageNow}">尾页</a>  
            </c:when>  
            <c:otherwise>  
                <a href="${pageContext.request.contextPath}/individual.do?func=ca&pageNow=${page.totalPageCount}">尾页</a>  
            </c:otherwise>  
        </c:choose>  
    </div>  
    <!-- 分页功能 End -->
    <%} %>
    
    <% if(func.equals("cc")){ %>
    
    <ul class="tableTitlec3">
      <li class="first">名称</li>
      <li class="second"></li>
    </ul>
    <%List<Route> list =(List<Route>)request.getAttribute("products");
      for(Route tl:list)
         {%>
    <ul class="tableListc3">
      <li>
        <div class="listItem first"><a href="routedetail.do?title=<%=tl.getRouteTitle()%>"><%=tl.getRouteTitle()%></a></div>
        <div class="listItem second" onclick="location.href='delete2.do?ida=<%=user.getId()%>&idb=<%=tl.getRouteId()%>'"><button>取消收藏</button></div>
      </li>
    </ul>
      <%}%>
      <!-- 分页功能 start -->  
    <div align="center">  
        <font size="2">共 ${page.totalPageCount} 页</font> <font size="2">第  
            ${page.pageNow} 页</font> <a href="${pageContext.request.contextPath}/individual.do?func=cc&pageNow=1">首页</a>  
        <c:choose>  
            <c:when test="${page.pageNow - 1 > 0}">  
                <a href="${pageContext.request.contextPath}/individual.do?func=cc&pageNow=${page.pageNow - 1}">上一页</a>  
            </c:when>  
            <c:when test="${page.pageNow - 1 <= 0}">  
                <a href="${pageContext.request.contextPath}/individual.do?func=cc&pageNow=1">上一页</a>  
            </c:when>  
        </c:choose>  
        <c:choose>  
            <c:when test="${page.totalPageCount==0}">  
                <a href="${pageContext.request.contextPath}/individual.do?func=cc&pageNow=${page.pageNow}">下一页</a>  
            </c:when>  
            <c:when test="${page.pageNow + 1 < page.totalPageCount}">  
                <a href="${pageContext.request.contextPath}/individual.do?func=cc&pageNow=${page.pageNow + 1}">下一页</a>  
            </c:when>  
            <c:when test="${page.pageNow + 1 >= page.totalPageCount}">  
                <a href="${pageContext.request.contextPath}/individual.do?func=cc&pageNow=${page.totalPageCount}">下一页</a>  
            </c:when>  
        </c:choose>  
        <c:choose>  
            <c:when test="${page.totalPageCount==0}">  
                <a href="${pageContext.request.contextPath}/individual.do?func=cc&pageNow=${page.pageNow}">尾页</a>  
            </c:when>  
            <c:otherwise>  
                <a href="${pageContext.request.contextPath}/individual.do?func=cc&pageNow=${page.totalPageCount}">尾页</a>  
            </c:otherwise>  
        </c:choose>  
    </div>  
    <!-- 分页功能 End -->
    <%} %>
    
    <% if(func.equals("da")){ %>
    
    <ul class="tableTitlec3">
      <li class="first">名称</li>
      <li class="second"></li>
    </ul>
    <%List<Travels> list =(List<Travels>)request.getAttribute("products");
      for(Travels tl:list)
         {%>
    <ul class="tableListc3">
      <li>
        <div class="listItem first"><a href="detail.do?id=<%=tl.getTravelsId() %>"><%=tl.getTravelsTitle()%></a></div>
        <div class="listItem second" onclick="location.href='travelsdelete.do?id=<%=tl.getTravelsId()%>'"><button>删除发布</button></div>
      </li>
    </ul>
      <%}%>
      <!-- 分页功能 start -->  
    <div align="center">  
        <font size="2">共 ${page.totalPageCount} 页</font> <font size="2">第  
            ${page.pageNow} 页</font> <a href="${pageContext.request.contextPath}/individual.do?func=da&pageNow=1">首页</a>  
        <c:choose>  
            <c:when test="${page.pageNow - 1 > 0}">  
                <a href="${pageContext.request.contextPath}/individual.do?func=da&pageNow=${page.pageNow - 1}">上一页</a>  
            </c:when>  
            <c:when test="${page.pageNow - 1 <= 0}">  
                <a href="${pageContext.request.contextPath}/individual.do?func=da&pageNow=1">上一页</a>  
            </c:when>  
        </c:choose>  
        <c:choose>  
            <c:when test="${page.totalPageCount==0}">  
                <a href="${pageContext.request.contextPath}/individual.do?func=da&pageNow=${page.pageNow}">下一页</a>  
            </c:when>  
            <c:when test="${page.pageNow + 1 < page.totalPageCount}">  
                <a href="${pageContext.request.contextPath}/individual.do?func=da&pageNow=${page.pageNow + 1}">下一页</a>  
            </c:when>  
            <c:when test="${page.pageNow + 1 >= page.totalPageCount}">  
                <a href="${pageContext.request.contextPath}/individual.do?func=da&pageNow=${page.totalPageCount}">下一页</a>  
            </c:when>  
        </c:choose>  
        <c:choose>  
            <c:when test="${page.totalPageCount==0}">  
                <a href="${pageContext.request.contextPath}/individual.do?func=da&pageNow=${page.pageNow}">尾页</a>  
            </c:when>  
            <c:otherwise>  
                <a href="${pageContext.request.contextPath}/individual.do?func=da&pageNow=${page.totalPageCount}">尾页</a>  
            </c:otherwise>  
        </c:choose>  
    </div>  
    <!-- 分页功能 End -->
    <%} %>
    
    <% if(func.equals("db")){ %>
    
    <ul class="tableTitlec3">
      <li class="first">名称</li>
      <li class="second"></li>
    </ul>
    <%List<Route> list =(List<Route>)request.getAttribute("products");
      for(Route tl:list)
         {%>
    <ul class="tableListc3">
      <li>
        <div class="listItem first"><a href="routedetail.do?title=<%=tl.getRouteTitle()%>"><%=tl.getRouteTitle()%></a></div>
        <div class="listItem second" onclick="location.href='delete3.do?title=<%=tl.getRouteTitle()%>'"><button>删除发布</button></div>
      </li>
    </ul>
      <%}%>
      <!-- 分页功能 start -->  
    <div align="center">  
        <font size="2">共 ${page.totalPageCount} 页</font> <font size="2">第  
            ${page.pageNow} 页</font> <a href="${pageContext.request.contextPath}/individual.do?func=db&pageNow=1">首页</a>  
        <c:choose>  
            <c:when test="${page.pageNow - 1 > 0}">  
                <a href="${pageContext.request.contextPath}/individual.do?func=db&pageNow=${page.pageNow - 1}">上一页</a>  
            </c:when>  
            <c:when test="${page.pageNow - 1 <= 0}">  
                <a href="${pageContext.request.contextPath}/individual.do?func=db&pageNow=1">上一页</a>  
            </c:when>  
        </c:choose>  
        <c:choose>  
            <c:when test="${page.totalPageCount==0}">  
                <a href="${pageContext.request.contextPath}/individual.do?func=db&pageNow=${page.pageNow}">下一页</a>  
            </c:when>  
            <c:when test="${page.pageNow + 1 < page.totalPageCount}">  
                <a href="${pageContext.request.contextPath}/individual.do?func=db&pageNow=${page.pageNow + 1}">下一页</a>  
            </c:when>  
            <c:when test="${page.pageNow + 1 >= page.totalPageCount}">  
                <a href="${pageContext.request.contextPath}/individual.do?func=db&pageNow=${page.totalPageCount}">下一页</a>  
            </c:when>  
        </c:choose>  
        <c:choose>  
            <c:when test="${page.totalPageCount==0}">  
                <a href="${pageContext.request.contextPath}/individual.do?func=db&pageNow=${page.pageNow}">尾页</a>  
            </c:when>  
            <c:otherwise>  
                <a href="${pageContext.request.contextPath}/individual.do?func=db&pageNow=${page.totalPageCount}">尾页</a>  
            </c:otherwise>  
        </c:choose>  
    </div>  
    <!-- 分页功能 End -->
    <%} %>
    
    <%if(func.equals("e")){ %>
    <div class="wantRelease">
       <form action="travelssubmit.do" method="post">
        <div class="subHead">
          <div class="subTitle"><div class="subTitleLeft">标题:</div><div class="subTitleRight"><input type="text" name="travelsTitle"></div></div>
          <div class="subKey">
              <div class="subKeyLeft">
              <span>分类：</span>
              <select name="month">
                <option value="strategy">攻略</option>
                <option value="travels" rel="icon-temperature">游记</option>
              </select>
              </div>
              <div class="subKeyRight">
                <span>地点：</span>
                <input type="text" name="travelsPlace">
              </div>
          </div>
        </div>
        <!-- ueditor -->
        <script type="text/plain" name="travelsContent" id="myEditor" style="width:600px;height:240px;">
        </script>
        <button>发布游记</button>
        </form>
    </div>
    <%} %>
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
<script src="plug/imgUpload/dist/js/dropify.min.js"></script>
 <script>
  var um = UM.getEditor('myEditor');

            $(document).ready(function(){
                // Basic
                $('.dropify').dropify();

                // Translated
                $('.dropify-fr').dropify({
                    messages: {
                        default: 'Glissez-déposez un fichier ici ou cliquez',
                        replace: 'Glissez-déposez un fichier ou cliquez pour remplacer',
                        remove:  'Supprimer',
                        error:   'Désolé, le fichier trop volumineux'
                    }
                });

                // Used events
                var drEvent = $('#input-file-events').dropify();

                drEvent.on('dropify.beforeClear', function(event, element){
                    return confirm("Do you really want to delete \"" + element.file.name + "\" ?");
                });

                drEvent.on('dropify.afterClear', function(event, element){
                    alert('File deleted');
                });

                drEvent.on('dropify.errors', function(event, element){
                    console.log('Has Errors');
                });

                var drDestroy = $('#input-file-to-destroy').dropify();
                drDestroy = drDestroy.data('dropify')
                $('#toggleDropify').on('click', function(e){
                    e.preventDefault();
                    if (drDestroy.isDropified()) {
                        drDestroy.destroy();
                    } else {
                        drDestroy.init();
                    }
                })
            });
</script>
</body>
</html>