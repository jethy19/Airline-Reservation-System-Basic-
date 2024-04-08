<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Main</title>
</head>
<style>
	.btn{
		display: block;
    	width: 125px;
    	height: 30px;
    	padding: 10px;
    	font-size:20px;
    	text-align: center;
    	border-radius: 5px;
    	color:white;
    	background: rgb(204, 80, 123);
    	text-decoration: none;
    	font-weight: bold;
    	line-height: 25px;
    	box-shadow: 5px 5px 10px 2px rgba(0,0,0,.8);
    	
	}
	h2{
		color:rgb(179, 122, 37);
		text-align:center;
	}
</style>
<body style="background-color:rgb(224, 255, 254)">
<header>
<nav style="background-color: rgb(245 120 66);width:100%;position:absolute;top:0;left:0">
	<div style="text-align: left; font-size: 30px;color:white"><strong>AIRLINE RESERVATION</strong></div>
	<div style="text-align: right">
		<a style="text-decoration: none; color:black ;margin-right:80px" href="<%=request.getContextPath()%>/adminmain.jsp">MAIN MENU</a>
		<a style="text-decoration: none; color:black ;margin-right:20px" href="<%=request.getContextPath()%>/logout">LOGOUT</a>
	</div>
</nav> 
</header>
<br><br><br>
<h2 style="text-align:center">Welcome <%=session.getAttribute("Name")%> </h2>
<div style="position:fixed;top:200px;left:400px">
	<div style="display:inline-block;margin-right:100px">
		<a class="btn" href="<%=request.getContextPath()%>/adminflightshow">Show Flights</a>
	</div>	
	<div style="display:inline-block;margin-left:100px;margin-right:100px">
		<a class="btn" href="<%=request.getContextPath()%>/adminshowuser">Show Users</a>
	</div>
</div>
</body>
</html>