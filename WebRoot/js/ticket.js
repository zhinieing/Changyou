//创建村庄集合
	   // var markerArr = [
    //                 { id:"1",title: "乌梅村", point: "113.958869,30.560149", address: "武汉市蔡甸区",href:"#", img: "img/villige/wumei.jpeg",introduce:"张湾街是武汉市新兴的都市农业生态旅游大街,享有武汉都市农业生态园的美誉,距市中心仅20公里。6公里长的蔡甸大街..."},
    //                 { id:"2",title: "童周岭村", point: "114.449306,30.294974", address: "湖北省武汉市江夏区梁子湖大道 ",href:"#", img: "img/villige/tongzhouling.jpeg",introduce:"童周岭村地属武汉市江夏区五里界街道，坐落于美丽的梁子湖畔。全村共有13个自然湾，风景都十分优美..." },
    //                 { id:"3",title: "东港村", point: "114.180934,30.191342", address: "武汉市江夏区法花路",href:"#", img: "img/villige/donggao.jpeg",introduce:"东港村位于江夏区南部的法泗街，毗邻咸宁嘉鱼县，周边河塘密布，一马平川。风景秀丽,人勤物丰,天蓝水清..." },
    //                 { id:"4",title: "丁湾村", point: "113.92852,30.56367", address: "武汉市蔡甸区",href:"#", img: "img/villige/dingwan.jpeg",introduce:"蔡甸区索河镇丁湾村坐落在六神山下，金龙湖畔，省道汉马路穿村而过。这里湖光山色，交相辉映，环境优美，景色宜人..."},
    //                 { id:"5",title: "蔡院村", point: "114.870849,30.853494", address: "武汉市新洲区",href:"#", img: "img/villige/caiyuan.jpeg",introduce:"辛冲镇位于新洲区东南部，是全国重点示范镇，素有“建筑之乡”的美誉，“鲁班镇”..."},
    //                 { id:"6",title: "杨岔村", point: "114.681765,30.919176", address: "武汉市新洲区",href:"#", img: "img/villige/yangcha.jpeg",introduce:"仓埠街道，目前，已形成以服装、建材业为龙头，机械、制造、铸造、五金、塑料制品、棉制品、粮油加工、化工为主体的工业经济发展格局..."},
    //                 { id:"7",title: "上岗村", point: "114.649271,30.917519", address: "武汉市新洲区",href:"#", img: "img/villige/shanggang.jpeg",introduce:"新洲区仓埠街上岗村地处丘陵，北靠红安，西邻黄陂。十里飘香的仓埠桂花大道花果山景区，就坐落于美丽的上岗村，市级桂花产业园旅游观光路穿越了上岗村..."},
    //                 { id:"8",title: "街团上村", point: "114.945177,30.81449", address: "武汉市新洲区",href:"#", img: "img/villige/jietuanshang.jpeg",introduce:"旧街街团上村位于新洲区旧街街东北部山区，东与黄冈团风县相邻，西与烽火山相连，南至冯岗村，北低姚河村..."},
    //                 { id:"9",title: "杨家石桥村", point: "114.585051,30.944286", address: "武汉市新洲区",href:"#", img: "img/villige/shiqiao.jpeg",introduce:"蔡家榨街位于武汉市黄陂区，史称黄陂东乡。是历史文化名镇，辛亥革命第一村..."},
    //                 { id:"10",title: "芦子河村", point: "114.585051,30.944286", address: "武汉市黄陂区",href:"#", img: "img/villige/shiqiao.jpeg",introduce:"木兰乡位于武汉市黄陂区东北部，东与红安县交界、南与王家河街接壤、西与长轩岭街毗邻、北与姚集街相连。是木兰故里，境内有国家级木兰湖旅游度假区..."},
    //                 { id:"11",title: "黄庙村", point: "114.278266,30.945843", address: "武汉市黄陂区",href:"#", img: "img/villige/huangmiao.jpeg",introduce:"　罗汉寺街位于黄陂区中部偏西，是黄陂区北部生态旅游区南大门，东界王家河街，北接长轩岭街，西连李家集街..."},
    //                 { id:"12",title: "火庙村", point: "114.40684,30.860316", address: "武汉市黄陂区",href:"#", img: "img/villige/huomiao.jpeg",introduce:"云淡风轻近午天，傍花随柳过前川。前川街道为黄陂区党政机关驻地，位于区境腹部偏南，东邻六指街..."},

    //             ];

     var btn=$('.mapBtn');
    btn.click(function(){
       var xy=$(this).attr('title');
       console.log(xy);
       $('#gj').attr('title',xy);
////////////新代码
	// var id=this.id;
	var mapBox=$('.mapBox');
    // var mapHeight=($(window).height())/2+$(document).scrollTop()-mapBox.css('height')/2;
    mapBox.center();
    mapBox.css('display','block');
    // mapBox.css('top',mapHeight);
    var map = new BMap.Map("villigeMap");
 	// var item=markerArr[id-1];
     // var xy="113.958869,30.560149";
     var p0 = xy.split(",")[0]; //
     var p1 = xy.split(",")[1]; //按照原数组的point格式将地图点坐标的经纬度分别提出来
     var poi= new BMap.Point(p0, p1); //循环生成新的地图点 
       map.centerAndZoom(poi, 10);
     var marker = new BMap.Marker(poi); //按照地图点坐标生成标记
     map.addOverlay(marker);
     marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
     // var label = new BMap.Label(item.title, { offset: new BMap.Size(20, -10) });
     // marker.setLabel(label);

 

    // map.enableScrollWheelZoom();
    // var k=id-1;
    // var content = "<h4 style='margin:0 0 5px 0;padding:0.2em 0'><a href='"+markerArr[k].href+"'>"+markerArr[k].title+"</a></h4>" + 
				// 					"<img style='float:right;margin:4px' id='"+markerArr[k].id+"' src='"+markerArr[k].img+"' width='139' height='104' title='"+markerArr[k].title+"'/>" + 
				// 					"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>"+markerArr[k].address+"</p>" + 
				// 					"</div>"; 

    //创建检索信息窗口对象
  //   var searchInfoWindow = null;
  // searchInfoWindow = new BMapLib.SearchInfoWindow(map, content, {
  //     title  :markerArr[k].title,      //标题
  //     width  : 290,             //宽度
  //     height : 105,              //高度
  //     panel  : "panel",         //检索结果面板
  //     enableAutoPan : true,     //自动平移
  //     searchTypes   :[
  //       BMAPLIB_TAB_TO_HERE,  //到这里去
  //       BMAPLIB_TAB_FROM_HERE //从这里出发
  //     ]
  //   });

    // marker.addEventListener("click", function(e){
    //   searchInfoWindow.open(marker);
    // })
   



}); // function结束
                    
function closeMap(){
  var mapBox=$('.mapBox');
  mapBox.css('display','none');
}