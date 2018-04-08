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
   <link rel="stylesheet" href="plug/imgUpload/dist/css/dropify.min.css">
   <link rel="stylesheet" href="css/homestayEdi.css">
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
     <div class="homeIntroName">基本信息</div>
     <form action="upload2.do" method="post" enctype="multipart/form-data">
    <div class="BigBox">
      <div class="c1"><div class="c1Name">名称:</div><textarea name="hotelName" maxlength="20"></textarea></div>
      <div class="c1"><div class="c1Name">电话:</div><textarea name="tel" maxlength="11"></textarea></div>
      <div class="c1"><div class="c1Name">坐标:</div><textarea name="pos" maxlength="25" style="width:200px;"></textarea><a href="http://api.map.baidu.com/lbsapi/getpoint/index.html" target="_blank">点击查找</a></div>
      <div class="c1"><div class="c1Name">地址:</div><textarea name="address" maxlength="50"></textarea></div>
      <div class="c1"><div class="c1Name">乡村:</div>
          <select name="villageTitle">
         <option value="乌梅村">乌梅村</option>
         <option value="童周岭村">童周岭村</option>
         <option value="东港村">东港村</option>
         <option value="丁湾村">丁湾村</option>
         <option value="蔡院村">蔡院村</option>
         <option value="杨岔村">杨岔村</option>
         <option value="上岗村">上岗村</option>
         <option value="街团上村">街团上村</option>
         <option value="杨家石桥村">杨家石桥村</option>
         <option value="芦子河村">芦子河村</option>
         <option value="黄庙村">黄庙村</option>
         <option value="火庙村">火庙村</option>
      </select>
      </div>

       <div class="c1" style="height:80px;"><div class="c1Name">特色:</div>
       <div class="c1List">
      <label><input name="Fruit" type="checkbox" value="休闲" id="cb1"/>休闲  </label>
      <label><input name="Fruit" type="checkbox" value="度假" id="cb2"/>度假 </label>
      <label><input name="Fruit" type="checkbox" value="观光" id="cb3"/>观光 </label>
      <label><input name="Fruit" type="checkbox" value="生态" id="cb4"/>生态 </label>
        <label><input name="Fruit" type="checkbox" value="田园" id="cb5"/>田园 </label>
      <label><input name="Fruit" type="checkbox" value="农家" id="cb6"/>农家  </label>
      <label><input name="Fruit" type="checkbox" value="垂钓" id="cb7"/>垂钓  </label>
      <label><input name="Fruit" type="checkbox" value="风景" id="cb8" />风景  </label>
      <input class="getStyle" name="theme" />
      </div>
       </div>
    </div>

    <div class="homeIntroName">上传图片</div>
    <!-- 上传图片 -->
    <div class="picBox">
      <div class="picImgBox">
         <input type="file" name="file" id="input-file-now-custom-1" class="dropify" data-height="200" data-default-file="loadImg"/>
    </div>
    <div class="picImgBox">
         <input type="file" name="file" id="input-file-now-custom-2" class="dropify" data-height="200" data-default-file="loadImg" />
    </div>
    <div class="picImgBox">
         <input type="file" name="file" id="input-file-now-custom-3" class="dropify" data-height="200" data-default-file="loadImg" />
    </div>
    <div class="picImgBox">
         <input type="file" name="file" id="input-file-now-custom-4" class="dropify" data-height="200" data-default-file="loadImg" />
    </div>
    </div>
    <!-- 上传图片结束 -->
     <div class="homeIntroName">民宿介绍</div>
    <div class="homeIntroContent"><textarea name="introduce" id="" cols="100" rows="10"></textarea></div>

    <div class="homeIntroName">预定须知</div>
    <div class="homeIntroContent"><textarea name="issue" id="" cols="100" rows="10"></textarea></div>
    <button class="theBtn" onclick="giveA()">创建民宿</button>
    </form>
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
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script src="plug/imgUpload/dist/js/dropify.min.js"></script>
<script> 
    $(document).ready(function(){ 
        //<tr/>居中 
        $("#tab tr").attr("align","center"); 
        
        //增加<tr/> 
        $("#but").click(function(){ 
            var _len = $("#tab tr").length;        
            $("#tab").append("<tr id="+_len+" align='center'>" 
                                +"<td><input type='text' name='desc"+_len+"' id='desc"+_len+"' /></td>" 
                                +"<td><input type='text' name='desc"+_len+"' id='desc"+_len+"' /></td>" 
                                +"<td><input type='text' name='desc"+_len+"' id='desc"+_len+"' /></td>" 
                                 +"<td><input type='text' name='desc"+_len+"' id='desc"+_len+"' /></td>" 
                                +"<td><a href=\'#\' onclick=\'deltr("+_len+")\'>删除</a></td>" 
                            +"</tr>");            
        })    
    }) 
    
    //删除<tr/> 
   var deltr =function(index) 
    { 
        var _len = $("#tab tr").length; 
        $("tr[id='"+index+"']").remove();//删除当前行 
        for(var i=index+1,j=_len;i<j;i++) 
        { 
            var nextTxtVal = $("#desc"+i).val(); 
            $("tr[id=\'"+i+"\']") 
                .replaceWith("<tr id="+(i-1)+" align='center'>" 
                                +"<td>"+(i-1)+"</td>" 
                                +"<td>Dynamic TR"+(i-1)+"</td>" 
                                +"<td><input type='text' name='desc"+(i-1)+"' value='"+nextTxtVal+"' id='desc"+(i-1)+"'/></td>" 
                                +"<td><a href=\'#\' onclick=\'deltr("+(i-1)+")\'>删除</a></td>" 
                            +"</tr>"); 
        }    
        
    } 



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

     function giveA(){
        var a='';
        for(let i=1;i<=8;i++){
          if($("#cb"+i).prop("checked")){
            a+=$("#cb"+i).val();
          }
        }
        $('.getStyle').val(a);
        console.log($('.getStyle').val());
    }

    $(".c1List input").click(giveA);

</script> 
</body>
</html>