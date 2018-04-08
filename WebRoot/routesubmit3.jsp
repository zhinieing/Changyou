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
  <title>路线编辑页3</title>
  <meta charset="utf-8">
   <link rel="stylesheet" type="text/css" href="css/frame1.css">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,700,900|Roboto+Condensed:400,300,700' rel='stylesheet' type='text/css'>
   <!--  <link rel="stylesheet" href="plug/imgUpload/dist/css/demo.css"> -->
    <link rel="stylesheet" href="plug/imgUpload/dist/css/dropify.min.css">
    <link rel="stylesheet" type="text/css" href="css/routeEdi3.css">

    <link href="plug/ueditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="plug/ueditor/third-party/jquery.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="plug/ueditor/umeditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="plug/ueditor/umeditor.min.js"></script>
    <script type="text/javascript" src="plug/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<body>

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
<div class="promptBox">
    <div class="titleBox"><h2>恭喜您又为您的路线增添了珍贵的片段</h2></div>
    <div class="stepBox">   
      <div class="stepIcon"  ><span>1</span></div> 
      <div class="stepText"><span>制定路线</span></div>
      <div class="stepIcon" ><span>2</span></div> 
      <div class="stepText"><span>分享心得</span></div>
      <div class="stepIcon" style="background:#58a;"><span>3</span></div> 
      <div class="stepText"><span>上传审查</span></div>
    </div>
  </div><!-- promptBox结束 -->
  <hr>
<%Route route = (Route) request.getAttribute("route");%> 
 <div class="bgBox">
   <img src="img/stepBG.jpg">
<div class="hrefBox bgBtnBox1">
     <!-- <p>再写一篇</p> -->
     <a href="routesubmit4.do?id=<%=route.getRouteId()+1%>&title=<%=route.getRouteTitle()%>&pass=<%=route.getRoutePass()%>&writer=<%=route.getRouteWriter()%>">再写一篇</a>
   </div>
<div class="hrefBox bgBtnBox2">
     <a href="${pageContext.request.contextPath}/routeshow.do">完成上传</a>
   </div>
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
<!-- <script src="js/jquery.js"></script> -->
<script src="plug/imgUpload/dist/js/dropify.min.js"></script>
 <script>
  

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