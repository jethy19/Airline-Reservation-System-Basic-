<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Flights</title>
<style>
#f{
	background-color:rgb(131, 108, 235);
	padding:5px;
	border-radius:5px;
}
label{
	font-size:20px;
	color:white;
}
	th,td{
		 padding: 15px;
  		text-align: center;	
  		border-bottom: 1px solid #ddd;
	}
         
        table.tab {            
            width:100%;
       }
	#booklink{
		display: block;
    	width: 50px;
    	height: 20px;
    	padding: 5px;
    	font-size:15px;
    	text-align: center;
    	border-radius: 5px;
    	color:white;
    	background:rgb(240, 9, 5);
    	text-decoration: none;
    	font-weight: bold;
	}
</style>
<script>
function show(){
	document.getElementById("center").style.visibility="visible";
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
<div>
	<br><br>
	<h3 style="text-align:center">Search for Flights</h3>
	<div>
	<form id = "f" action="<%=request.getContextPath()%>/searchflights" style="text-align:center;margin-top:50px">
		<div style="display:inline-block;margin-right:50px">
		<label>Departure </label>
		<input type="text" name ="source" required>
		</div>
		<div style="display:inline-block;margin-right:50px">
		<label>  Arrival </label>
		<input type="text" name="dest" required>
		</div>
		<div style="display:inline-block;margin-right:50px">
		<label>  Date  </label>
		<input type="date" name="dt" required>
		</div>
		<div style="display:inline-block;">
		<label>Adults</label>
		<input type="number" name="people" min="1" max="9" required>
		</div>
		<br><br>
		<button type="submit">SEARCH</button>		
	</form>
	</div>
	
	<div style="margin-top:100px;text-align:center">
		<c:if test="${value == true}">Sorry no flights found !</c:if>
		<table id ="center" class="tab" style="visibility:hidden">
			<thead>
				<tr>
					<th> Flight </th>
					<th> Flight No</th>
					<th> Departure </th>
					<th> Arrival </th>
					<th> Flight Time </th>
					<th> Price</th>	
					<th> <th>			
				</tr>
			</thead>
			<tbody>
				<c:forEach var ="flightlist" items="${flightList}">
				<tr>
					<td><img style="width: 150px;height: 130px;object-fit: contain;" src="${flightlist.fcompany}.svg" alt="Loading"></td>
					<td><c:out value="${flightlist.fnumber}"></c:out></td>
					<td><c:out value="${flightlist.fsource}"></c:out></td>
					<td><c:out value="${flightlist.fdest}"></c:out></td>
					<td><c:out value="${flightlist.ftime}"></c:out></td>
					<td><c:out value="${flightlist.price}"></c:out></td>
					<td><a id="booklink" href="<%=request.getContextPath()%>/bookingpage?bprice=<c:out value='${flightlist.price}'/>&count=<c:out value='${flightpeople}'/>&fnumber=<c:out value='${flightlist.fnumber}'/>">BOOK</a></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<c:if test="${value == false}"><script>show();</script></c:if>
</div>
</body>
</html>