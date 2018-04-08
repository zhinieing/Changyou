<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="cn.it.model.*"%>
<%@page import="java.util.List"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>



<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <title>按起终点经纬度规划路线</title>
    <link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>
    <style type="text/css">
        #panel {
            position: absolute;
            background-color: white;
            max-height: 80%;
            overflow-y: auto;
            top: 10px;
            right: 10px;
            width: 250px;
            border: solid 1px silver;
        }
    </style>
    <script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=58200d5f9917a99a7e8dc0149d4fdfea&plugin=AMap.Transfer"></script>
    <!-- <script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=您申请的key值&plugin=AMap.Transfer"></script> -->
    <script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
</head>
<body>
<%String xy=(String) request.getParameter("xy"); %>
<div id="container"></div>
<div id="panel"></div>
<script type="text/javascript">
    var xy='<%=xy%>';
    var x=xy.split(',')[0];
    var y=xy.split(',')[1];
    var map = new AMap.Map("container", {
        resizeEnable: true,
        center: [116.397428, 39.90923],
        zoom: 13 //地图显示的缩放级别
    });
    var transOptions = {
        map: map,
        city: '北京市',
        panel: 'panel',                            
        //cityd:'乌鲁木齐',
        policy: AMap.TransferPolicy.LEAST_TIME
    };
    //构造公交换乘类
    var transfer = new AMap.Transfer(transOptions);
    //根据起、终点坐标查询公交换乘路线
    transfer.search(new AMap.LngLat(114.419826,30.518754), new AMap.LngLat(x,y));
</script>
</body>
</html>