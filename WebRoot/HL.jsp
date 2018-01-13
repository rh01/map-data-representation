<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ page isELIgnored="false"%> --%>
<html lang="zh-CN">

<head>
    <!-- 原始地址：//webapi.amap.com/ui/1.0/ui/misc/PointSimplifier/examples/index.html -->
    <base href="//webapi.amap.com/ui/1.0/ui/misc/PointSimplifier/examples/" />
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <!-- <script type="text/javascript" src="js/createPoints.js"></script> -->
    <title>海量点展示</title>
    <style>
    html,
    body,
    #container {
        width: 100%;
        height: 100%;
        margin: 0px;
    }
    
    #loadingTip {
        position: absolute;
        z-index: 9999;
        top: 0;
        left: 0;
        padding: 3px 10px;
        background: red;
        color: #fff;
        font-size: 14px;
    }
    </style>
</head>

<body>
    <div id="container"></div>
    <!--引入高德地图JSAPI -->
    <script type="text/javascript" src='//webapi.amap.com/maps?v=1.4.2&key=您申请的key值'></script> 
	<!--引入UI组件库（1.0版本） -->
    <script src="//webapi.amap.com/ui/1.0/main.js?v=1.0.11"></script>
    <script type="text/javascript">
    var arraydt = new Array();  
    var arrayms = new Array(); 
    var arraylg = new Array(); 
    var arrayla = new Array(); 
    var arrayst = new Array(); 
	<c:forEach items="${t}" var="d" >
	   /*  arraydt.push(Interger.toString(${ d.flashTime})) */
	  /*  arraydt.push("\'" +${ d.flashTime}+ "\'") */
	    //arraydt.push(toString(${d.flashTime}))
	    arraydt.push(${d.flashTime})    
	    arrayms.push(${d.microSeconds}) 
	    arraylg.push(${d.longitude})
	    arrayla.push(${d.latitude})
	    arrayst.push(${d.strength})
	</c:forEach>  
	
    //创建地图
    var map = new AMap.Map('container', {
        zoom: 4
    });
    
    //$即为UI组件库最终使用的DomLibrary //调用$, PointSimplifier,继承可扩展该方法能力 http://lbs.amap.com/api/javascript-api/guide/amap-ui/advanced/
    AMapUI.load(['ui/misc/PointSimplifier', 'lib/$'], function(PointSimplifier, $) {
        if (!PointSimplifier.supportCanvas) {
            alert('当前环境不支持 Canvas！');
            return;  
        }
        
   /*     initPage(PointSimplifier); */
    /* function initPage(PointSimplifier) { */
    //创建组件实例
    var pointSimplifierIns = new PointSimplifier({
            map: map, //所属的地图实例
            getPosition: function(item) {
                if (!item) {
                    return null;
                }
                var parts = item.split(',');
                
                //返回经纬度
                return [parseFloat(parts[0]), parseFloat(parts[1])];
            },
            
            getHoverTitle: function(dataItem, idx) {
                return idx + ': ' + dataItem;
            },
            
            renderOptions: {
                //点的样式
                pointStyle: {
                    width: 6,
                    height: 6
                },
                //鼠标hover时的title信息
                hoverTitleStyle: {
                    position: 'top'
                }
            }
        });
/* } */     
            
         var data = createPoints(arraylg,arrayla);  
       /* var data= ['120.412618,36.382612',
           '113.370643,22.938827',
           '113.890205,22.798043']  */
         
          var count=0;
         
         if((data.length)%20==0){
           count=data.length/20;
          }
         else{
           count=(data.length/20)+1; 
         } 
         
         window.pointSimplifierIns = pointSimplifierIns;
         //for(var i=0;i<count;i++){
         //$('<div id="loadingTip">加载数据，请稍候...</div>').appendTo(document.body); 
         //pointSimplifierIns.setData(data);
         //for(var i=0;i<count;){
          
             // setTimeout('',1000);
            
             //alert('hello');
             //pointSimplifierIns.render();
             //pointSimplifierIns.setData();
             //pointSimplifierIns.renderLater(1000)
             //pointSimplifierIns.setData(data.slice(i*20,(i+1)*20));
             	
             	//pointSimplifierIns.setData(data.slice(i*20,(i+1)*20));
                
                  
             	/* function show2(){
	    			  pointSimplifierIns.setData(data.slice(i*20,(i+1)*20));
	    			  i = i + 1;
	    			  console.log(i);
	    			  var t;
	    			  //setInterval(show2,2000,i);
	    			  //t = setTimeout("show2()",10000)
	    			 
				}; 
				show2(); */
				// 分批次添加数据
				var i = 0; 
				console.log(count)
				setInterval(function show2(){
	    			 	pointSimplifierIns.setData(data.slice(i*20,(i+1)*20));
		    			  if(i < parseInt(count)){
		    			  	i = i + 1;
		    			  };
		    			  console.log(i);
		    			  
					}, 5000); //设置5秒
          //$('#loadingTip').remove();
        
      /*   });
         */
      pointSimplifierIns.on('pointClick pointMouseover pointMouseout', function(e, record) {
            //console.log(e.type, record);
            });       
      function createPoints(arraylg,arrayla) {
		    var list = [];
		    for(var i = 0; i< arraylg.length; i++) {
		        list.push(arraylg[i]+','+arrayla[i]+','+arraydt[i]+','+arrayms[i]+','+arrayst[i]);
		    }
		    return list;
		}   
	
	 
	   
         });
         
         
         
         
/* function myrefresh() 
{ 
       window.location.reload(); 
} 
setTimeout('myrefresh()',1000); //指定1秒刷新一次  */
             	  
    </script>
</body>

</html>