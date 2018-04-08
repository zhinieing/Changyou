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
	<title>路线详情</title>
	<meta charset="utf-8">
	 <link rel="stylesheet" type="text/css" href="css/frame1.css">
   <link rel="stylesheet" type="text/css" href="css/routeDetail.css">
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
    int ids=0;
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
<%List<Route> list =(List<Route>) request.getAttribute("route");
  String title =(String) request.getAttribute("title");
  int a=0;Route route=list.get(0);%>

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
  <div class="titleBox1">
    <div class="imgBox">
      <img src="img/max.png">
    </div>
    <div class="titleDetailBox">
      <h3><%=route.getRouteTitle()%></h3>
    </div>
    <div class="goodBox">
      <div class="goodItem agreeBox">
        <div class="IconBox"  id="goodBtn">
          <img class="goodOn" src="img/good/ic_vote_checked.png">
          <img class="goodOff" src="img/good/ic_vote_normal.png">
        </div>
        <div id="count1" class="NumberBox"><%=route.getRouteCount()%></div>
      </div>
      <div class="goodItem collection">
        <div class="IconBox"  id="collectionBtn">
           <img class="collectionOn" src="img/good/ic_thanked.png">
           <img class="collectionOff" src="img/good/ic_thank.png">
        </div>
        <div id="count2" class="NumberBox"><%=route.getRouteCollect() %></div>
      </div>
    </div>
  </div><!-- titleBox结束 -->

  <div class="contentBox">
   <div class="anchorWrap">
    <div class="anchor">
      <ul>
       <li class="selected"><a href="#001">地图</a></li>
        <%for(Route tl:list) {
        String t ="#"+tl.getRouteId();
        a++;%>
        <li><a href="<%=t%>">P<%=a%></a></li>
        <%} %>
      </ul><!-- ul结束 -->
    </div><!-- anchor结束 -->
    </div>
    <div class="contentList">
      <ul>
      <li class="Item mapItem">
          <div name="001" id="001" class="mapBox">
            <div id="villigeMap"></div>
          </div>
        </li><!-- li结束 -->
      <%for(Route tl:list) {%>
        <li name="<%=tl.getRouteId()%>" id="<%=tl.getRouteId()%>" class="Item">
          <div class="titleBox"><h4><%=tl.getRouteTitles()%></h4></div>
          <div class="ItemContentBox">
          <div class="imgBox">
            <img src="./<%=tl.getRouteImg() %>">
          </div>
          <div class="txtBox">
            <p><%=tl.getRouteContent() %></p>
          </div>
          <div class="footerBox">
            <span class="time"><%=tl.getUpdateTime() %></span>
            <span class="address"><%=tl.getRoutePlace() %></span>
          </div>
          </div>
        </li>
         <%} %>
      </ul><!-- ul结束 -->
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
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=uWMxTbxqAG64MZBSQFXMXwidjGvwXT6x"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/routeDetail.js"></script>

<script type="text/javascript">
 getPoints="<%=route.getRoutePass()%>"
   var myPoints=getPoints.split("|");
  
   var myPointsArray=[];
   for(var i=0;i<(myPoints.length-1);i++){

        var xy=myPoints[i].split(",");
        var x=xy[0];
        var y=xy[1];
        var myPt = new BMap.Point(x,y);
        myPointsArray.push(myPt);
   }
   var startP=myPointsArray[0];
   var  myIcon = new BMap.Icon("img/flag.png", new BMap.Size(30,30), new BMap.Size(100,100));
   var marker2 = new BMap.Marker(startP,{icon:myIcon});  // 创建标注
   map.addOverlay(marker2);              // 将标注添加到地图中
   

    curve = new BMap.Polyline( myPointsArray, {strokeColor:"red", strokeWeight:3, strokeOpacity:0.5});
    map.addOverlay(curve); //添加到地图中
    // curve.enableEditing(); 
    addArrow(curve,10,Math.PI/7); 

var params = {};  
    //params.XX必须与Spring Mvc controller中的参数名称一致    
    //否则在controller中使用@RequestParam绑定  
    params.ida = "<%=route.getRouteId()%>";  
    params.idb = "<%=ids%>";
    params.classt="route";
  $("#goodBtn").click(function(){
      if($(".goodOn").css("display")=="none"){
        $(".goodOn").css("display","block");
         $(".goodOff").css("display","none");
         $.ajax({  
        async:false,  
        type: "POST",  
        url: "goodroute.do",//注意路径  
        data:params,  
        dataType:"json",  
        success:function(data){  
            if(data.result=='SUCCESS'){   
            $('#count1').text(data.count);
            }else{  
                alert("修改失败，失败原因【" + data + "】");  
            }  
        },  
        error:function(data){  
            alert(data.result);  
        }  
    });
      }
      else{
         $(".goodOn").css("display","none");
         $(".goodOff").css("display","block");
         $.ajax({  
        async:false,  
        type: "POST",  
        url: "goodroute1.do",//注意路径  
        data:params,  
        dataType:"json",  
        success:function(data){  
            if(data.result=='SUCCESS'){   
            $('#count1').text(data.count);
            }else{  
                alert("修改失败，失败原因【" + data + "】");  
            }  
        },  
        error:function(data){  
            alert(data.result);  
        }  
    });
      }
  });
   $("#collectionBtn").click(function(){
      if($(".collectionOn").css("display")=="none"){
        $(".collectionOn").css("display","block");
         $(".collectionOff").css("display","none");
         $.ajax({  
        async:false,  
        type: "POST",  
        url: "collectroute.do",//注意路径  
        data:params,  
        dataType:"json",  
        success:function(data){  
            if(data.result=='SUCCESS'){   
                $('#count2').text(data.count);
                alert("成功！");
            }else{  
                alert("修改失败，失败原因【" + data + "】");  
            }  
        },  
        error:function(data){  
            alert(data.result);  
        }  
    });
      }
      else{
         $(".collectionOn").css("display","none");
         $(".collectionOff").css("display","block");
         $.ajax({  
        async:false,  
        type: "POST",  
        url: "collectroute1.do",//注意路径  
        data:params,  
        dataType:"json",  
        success:function(data){  
            if(data.result=='SUCCESS'){  
                $('#count2').text(data.count); 
                alert("成功！");
            }else{  
                alert("修改失败，失败原因【" + data + "】");  
            }  
        },  
        error:function(data){  
            alert(data.result);  
        }  
    });
      }
  });
  
  
  $(document).ready(function(){
 $.ajax({  
        async:false,  
        type: "POST",  
        url: "good1.do",//注意路径  
        data:params,  
        dataType:"json",  
        success:function(data){  
            if(data.result=='SUCCESS'){  
             
             $(".goodOn").css("display","block");
            $(".goodOff").css("display","none");    
        }else{  
            $(".goodOn").css("display","none");
             $(".goodOff").css("display","block"); 
            }
         },  
        error:function(data){  
            alert(data.result);  
        }  
    });
    
     $.ajax({  
        async:false,  
        type: "POST",  
        url: "collect1.do",//注意路径  
        data:params,  
        dataType:"json",  
        success:function(data){  
            if(data.result=='SUCCESS'){  
             
            $(".collectionOn").css("display","block");
         $(".collectionOff").css("display","none"); 
        }else{  
            $(".collectionOn").css("display","none");
         $(".collectionOff").css("display","block"); 
            }
         },  
        error:function(data){  
            alert(data.result);  
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
  
  $(document).scroll(function(){
      var anchor=$('.anchor');
      if($(document).scrollTop()>288)
      anchor.css("top",($(this).scrollTop()-288));
      else{
       anchor.css("top",0);
    }
      
    });
  
</script>
</div>
</body>
</html>