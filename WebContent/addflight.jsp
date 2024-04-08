<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Flight Add</title>
</head>
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
<div style="text-align:center">
	<h2>Add Flight Details</h2>
	<div id="inside" style="text-align:left;position:absolute;left:500px;top:150px">
	
	<form action="<%=request.getContextPath()%>/addflightdetails">
	<label>FlightNo </label>
	<input type="text" name = "fno" placeholder="enter flight number "><br><br>
	<label>Flight Company </label>
	<select name = "fc" >
		<option value="indigo">indigo</option>
		<option value="airindia">airindia</option>
		<option value="vistara">vistara</option>
		<option value="akasaair">akasa</option>
		<option value="spicejet">spicejet</option>
		<option value="jetairways">jetairways</option>
		<option value="airasia">airasia</option>
		<option value="goair">goair</option>
	</select><br><br>
	<label>Flight Departure </label>
	<input type="text" name = "fsource" placeholder="enter flight departure location" ><br><br>
	<label>Flight Arrival </label>
	<input type="text" name = "fdest" placeholder="enter flight arrival location" ><br><br>
	<label>Flight Date </label>
	<input type="date" name = "fdate" ><br><br>
	<label>Flight Time </label>
	<input type="text" name = "ftime" placeholder="enter flight time" ><br><br>
	<label>Flight Price</label>
	<input type="text" name = "fprice" placeholder="enter flight price" ><br><br>
	<button type="submit" style="position:absolute;top:270px;left:120px">SAVE</button>
	</form>
	</div>
</div>
</body>
</html>