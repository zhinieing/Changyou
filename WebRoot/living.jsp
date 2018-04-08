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
  <title>民宿</title>
  <meta charset="utf-8">
   <link rel="stylesheet" type="text/css" href="css/frame1.css">
   <link rel="stylesheet" type="text/css" href="css/minsu.css">
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
  <div class="headBox"> 
    <div class="searchBox" >
      <form style="display: flex;" action="${pageContext.request.contextPath}/livingsearch.do"
			method="post"> 
      <div class="addressBox">
        <div class="name"><span>地点</span></div>
        <div class="put"><input type="text" name="theme" placeholder="主题" id="villageIpt"  ></div>
      </div>
      <div class="IntimeBox">
        <div class="name"><span>时间</span></div>
        <div class="put"><input type="text" name="inDate" placeholder="入店时间" id="J-xl-1"></div>
      </div>
      <div class="OuttimeBox">
        <div class="name"><span></span></div>
        <div class="put"><input type="text" name="outDate" placeholder="离店时间" id="J-xl-2"></div>
      </div>
      <div class="keyBox">
        <div class="name"><span>关键字</span></div>
        <div class="put"><input type="text" name="hotelName" placeholder="民宿名"></div>
      </div>
      <div class="searchBtn"><button>搜索</button></div>
      </form>
    </div><!-- searchBox结束 -->
    <div class="hotelTable" id="hotelTableId" onblur="closehotelTable()">
        <ul>
          <li><a href="javascript:void(0);" onclick="document.getElementById('villageIpt').value=this.innerHTML;">休闲</a></li>
          <li><a href="javascript:void(0);"onclick="document.getElementById('villageIpt').value=this.innerHTML;">度假</a></li>
          <li><a href="javascript:void(0);" onclick="document.getElementById('villageIpt').value=this.innerHTML;">观光</a></li>
          <li><a href="javascript:void(0);" onclick="document.getElementById('villageIpt').value=this.innerHTML;">生态</a></li>
          <li><a href="javascript:void(0);" onclick="document.getElementById('villageIpt').value=this.innerHTML;">田园</a></li>
          <li><a href="javascript:void(0);" onclick="document.getElementById('villageIpt').value=this.innerHTML;">农家</a></li>
          <li><a href="javascript:void(0);" onclick="document.getElementById('villageIpt').value=this.innerHTML;">垂钓</a></li>
          <li><a href="javascript:void(0);" onclick="document.getElementById('villageIpt').value=this.innerHTML;">风景</a></li>
        </ul>
      </div>
    <img src="img/taiwan-72.jpg"> 
  </div>
  <div class="contentBox">
      <h3>热门民宿</h3>
      <!-- <hr> -->
      <div class="hotel">
        <ul>
        <%List<Hotel> list = (List<Hotel>)request.getAttribute("products");
          List<Room> minlist = (List<Room>)request.getAttribute("minpricelist");
          //List<Comments> avgpoint = (List<Comments>)request.getAttribute("avgpoint");
          for(Hotel hl:list)
          {%>
          <li>
            <div class="imgBox">
              <img src="<%=hl.getImage() %>">
            </div>
            <div class="txtBox">
             <%for(Room ml:minlist){
                if(ml.getHotelName().equals(hl.getHotelName())) {
                  if(ml.getPrice()!=null){
             %>
              <p class="row1">￥<span class="Hprice"><%=ml.getPrice() %></span><a href="${pageContext.request.contextPath}/livingdetail.do?hotelName=<%=hl.getHotelName() %>"><span class="Hname"><%=hl.getHotelName() %></span></a></p>
              <p class="row2"><span class="Haddress"><%=hl.getAddress() %></span>评分<span class="Hscore"><%=hl.getPoint() %></span>分</p>
            </div>
            <% } 
              }
             }%>
          </li><!-- li结束 -->
          <%} %>
        </ul>
      </div>
  </div>
</div>

<!-- 分页功能 start -->  
    <div align="center">  
        <font size="2">共 ${page.totalPageCount} 页</font> <font size="2">第  
            ${page.pageNow} 页</font> <a href="${pageContext.request.contextPath}/living.do?pageNow=1">首页</a>  
        <c:choose>  
            <c:when test="${page.pageNow - 1 > 0}">  
                <a href="${pageContext.request.contextPath}/living.do?pageNow=${page.pageNow - 1}">上一页</a>  
            </c:when>  
            <c:when test="${page.pageNow - 1 <= 0}">  
                <a href="${pageContext.request.contextPath}/living.do?pageNow=1">上一页</a>  
            </c:when>  
        </c:choose>  
        <c:choose>  
            <c:when test="${page.totalPageCount==0}">  
                <a href="${pageContext.request.contextPath}/living.do?pageNow=${page.pageNow}">下一页</a>  
            </c:when>  
            <c:when test="${page.pageNow + 1 < page.totalPageCount}">  
                <a href="${pageContext.request.contextPath}/living.do?pageNow=${page.pageNow + 1}">下一页</a>  
            </c:when>  
            <c:when test="${page.pageNow + 1 >= page.totalPageCount}">  
                <a href="${pageContext.request.contextPath}/living.do?pageNow=${page.totalPageCount}">下一页</a>  
            </c:when>  
        </c:choose>  
        <c:choose>  
            <c:when test="${page.totalPageCount==0}">  
                <a href="${pageContext.request.contextPath}/living.do?pageNow=${page.pageNow}">尾页</a>  
            </c:when>  
            <c:otherwise>  
                <a href="${pageContext.request.contextPath}/living.do?pageNow=${page.totalPageCount}">尾页</a>  
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
<script type="text/javascript" src="plug/laydate-master/laydate.dev.js"></script>
<script type="text/javascript">
    document.getElementById('J-xl-1').onclick = function(){

            laydate({

                elem: '#J-xl-1'

            });

        }

         document.getElementById('J-xl-2').onclick = function(){

            laydate({

                elem: '#J-xl-2'

            });

        }

       function openhotelTable(){
      var hotelTable=document.getElementById('hotelTableId');
     hotelTable.style.display="block";
    } 
     function closehotelTable(){
      var hotelTable=document.getElementById('hotelTableId');
     hotelTable.style.display="none";
    } 

    $(document).bind("click",function(event){
        var e = event || window.event; 
        var elem = e.srcElement||e.target; 
        while(elem) 
        { 
           if(elem.id == "villageIpt") 
            { 
                openhotelTable();
                return; 
            } 

            else if(elem.id == "hotelTableId") 
            { 
                return; 
            } 
            elem = elem.parentNode;      
        } 
     
       $('#hotelTableId').hide();
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
  
  Date.prototype.Format = function (fmt) { //author: meizz 
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}

$(document).ready(
  function(){
  var indate =  $('#J-xl-1');
  var outdate =  $('#J-xl-2');
  var enterDate=new Date().Format("yyyy-MM-dd");
  var curDate = new Date(); 
  // console.log(curDate);
   var leaveDate=new Date(curDate.getTime() + 24*60*60*1000).Format("yyyy-MM-dd");
  // indate.attr('value',enterDate);
  // console.log(indate.attr('placeholder'));
  indate.val(enterDate);
  outdate.val(leaveDate);

}
);

</script>
</body>
</html>