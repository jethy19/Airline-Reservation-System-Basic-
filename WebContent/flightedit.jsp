<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Flight Edit</title>
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
	<h2>Edit Flight Details</h2>
	<form action="<%=request.getContextPath()%>/saveflight">
	<input type="hidden" name = "flightno" value=<%=request.getAttribute("fno")%>>
	<label>FlightNo </label>
	<input type="text" name = "fno" value=<%=request.getAttribute("fno")%> disable><br><br>
	<label>Flight Company </label>
	<select name = "fc" >
		<option value="${fcomp}"> ${fcomp} </option>
		<c:forEach var="o" items="${optionlist}">
		<option value="${o}">${o}</option>
		</c:forEach>
	</select><br><br>
	<label>Flight Departure </label>
	<input type="text" name = "fsource" value=<%=request.getAttribute("source")%> ><br><br>
	<label>Flight Arrival </label>
	<input type="text" name = "fdest" value=<%=request.getAttribute("dest")%> ><br><br>
	<label>Flight Date </label>
	<input type="date" name = "fdate" value=<%=request.getAttribute("d")%> ><br><br>
	<label>Flight Time </label>
	<input type="text" name = "ftime" value=<%=request.getAttribute("ftime")%> ><br><br>
	<label>Flight Price</label>
	<input type="text" name = "fprice" value=<%=request.getAttribute("fprice")%> ><br><br>
	<button type="submit">SAVE</button>
	</form>
</div>
</body>
</html>