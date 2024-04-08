<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>All Bookings</title>
<style>
	th,td{
		 padding: 15px;
  		text-align: center;	
  		border-bottom: 1px solid #ddd;
	}
	
	table{
		width:100%;
	}
	
	#ticketlink{
		display: block;
    	width: 60px;
    	height: 20px;
    	padding: 5px;
    	font-size:15px;
    	text-align: center;
    	border-radius: 5px;
    	color:white;
    	background:rgb(21, 176, 21);
    	text-decoration: none;
    	font-weight: bold;
	}
	
	#passlink{
		display: block;
    	width: 80px;
    	height: 30px;
    	padding: 5px;
    	font-size:15px;
    	text-align: center;
    	border-radius: 5px;
    	color:white;
    	background:rgb(66, 84, 245);
    	text-decoration: none;
    	font-weight: bold;
	}
	
	#cancellink{
		display: block;
    	width: 60px;
    	height: 20px;
    	padding: 5px;
    	font-size:15px;
    	text-align: center;
    	border-radius: 5px;
    	color:white;
    	background:rgb(245, 66, 66);
    	text-decoration: none;
    	font-weight: bold;
	}
</style>
<script>
function show(){
	document.getElementById("recordtable").style.visibility="visible";
}
</script>
</head>
<body style="background-color:rgb(224, 255, 254)">
<header>
<nav style="background-color: rgb(245 120 66);width:100%;position:fixed;top:0;left:0">
	<div style="text-align: left; font-size: 30px;color:white"><strong>AIRLINE RESERVATION</strong></div>
	<div style="text-align: right">
		<a style="text-decoration: none; color:black ;margin-right:80px" href="<%=request.getContextPath()%>/usermain.jsp">MAIN MENU</a>
		<a style="text-decoration: none; color:black ;margin-right:20px" href="<%=request.getContextPath()%>/logout">LOGOUT</a>
	</div>
</nav> 
</header>
<br><br><br>
<div><h3 style="text-align:center">All Bookings</h3></div>
<div style="text-align:center">
	<c:if test="${r == true}">Sorry no bookings found !</c:if>
	<table id="recordtable" style="visibility:hidden">
		<thead>
		<tr>
			<th>PNR No</th>
			<th>Flight No</th>
			<th>Departure</th>
			<th>Arrival</th>
			<th>Flight Date</th>
			<th>Flight Time</th>
			<th></th>
			<th></th>
			<th></th>
		</tr>
		</thead>
		<tbody>
			<c:forEach var="rec" items="${recordlist}">
			<tr>
				<td><c:out value="${rec.pnr}"></c:out></td>
				<td><c:out value="${rec.flightnumber}"></c:out></td>
				<td><c:out value="${rec.flightdep}"></c:out></td>
				<td><c:out value="${rec.flightarr}"></c:out></td>
				<td><c:out value="${rec.ld}"></c:out></td>
				<td><c:out value="${rec.flighttime}"></c:out></td>
				<td><a id="ticketlink" href="<%=request.getContextPath()%>/showticket?p=<c:out value="${rec.pnr}"/>">TICKET</a></td>
				<td><a id="passlink" href="<%=request.getContextPath()%>/showpass?p=<c:out value="${rec.pnr}"/>">BOARDING PASS</a></td>
				<td><a id="cancellink" href="<%=request.getContextPath()%>/ticketcancel.jsp?p=<c:out value="${rec.pnr}"/>">CANCEL</a></td>				
			</tr>			
			</c:forEach>
		</tbody>
	</table>
	<c:if test="${r == false}"><script>show();</script></c:if>
</div>
</body>
</html>