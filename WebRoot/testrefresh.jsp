<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%-- <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>

<div id="container"></div>
     <!-- document.getElementById("container").innerHTML = "list"; -->
	 <%-- <%=request.getSession().getAttribute("t")%>  --%>
	<%-- <%String longitude= (String)request.getSession().getAttribute("d");%>  --%> 
</body>
<head>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <title>点标记</title>
    <link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>
    <script src="http://webapi.amap.com/maps?v=1.4.1&key=您申请的key值"></script>
    

    <%-- <%String longitude="34.043537";String lattitude="119.401459";%>   --%>
    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script language="javascript" >
    
    //var arrayms = new Array(); 
    var arraylg = new Array(); 
    var arrayla = new Array(); 
    //var arrayst = new Array(); 
   <c:forEach items="${t}" var="d" >
	    //arrayms.push(${d.microSeconds})
	    arraylg.push(${d.longitude})
	    arrayla.push(${d.latitude})
	    //arrayst.push(${d.strength})
	</c:forEach>  
	
 	  var map = new AMap.Map("container", {
        resizeEnable: true,
        center: [119.40,34.04], 
        zoom: 11
      }); 
     
		var i = 0;	
		console.log(arraylg.length)
  		//for(var i=0;i<arraylg.length;i++){
  		// 实时的数据点添加
  		setInterval(function show2(){
  		map.setFitView();
	    		marker = new AMap.Marker({
					icon: "http://webapi.amap.com/theme/v1.3/markers/n/mark_b.png",
  					position:[arraylg[i],arrayla[i]],
  					map: map
  				});
   			  if(i < parseInt(arraylg.length)){
   			  	i = i + 1;
   			  };
		    console.log(i);
		    			  
		}, 5000); 
					
					
  			//};
	

</script> 
<script type="text/javascript" src="https://webapi.amap.com/demos/js/liteToolbar.js"></script>
<title>Insert title here</title>
</head>

</html>