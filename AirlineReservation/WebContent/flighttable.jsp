<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Flight List</title>
</head>
<style>
#editb{
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
	
#deleteb{
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
th,td{
		 padding: 15px;
  		text-align: center;	
  		border-bottom: 1px solid #ddd;
	}
         
        table{            
            width:100%;
       }
       
.button-19 {
  appearance: button;
  background-color: #1899D6;
  border: solid transparent;
  border-radius: 16px;
  border-width: 0 0 4px;
  box-sizing: border-box;
  color: #FFFFFF;
  cursor: pointer;
  display: inline-block;
  font-family: din-round,sans-serif;
  font-size: 15px;
  font-weight: 700;
  letter-spacing: .8px;
  line-height: 20px;
  margin: 0;
  outline: none;
  overflow: visible;
  padding: 13px 16px;
  text-align: center;
  text-transform: uppercase;
  touch-action: manipulation;
  transform: translateZ(0);
  transition: filter .2s;
  user-select: none;
  -webkit-user-select: none;
  vertical-align: middle;
  white-space: nowrap;
  width: 150px;
  text-decoration:none;
}

.button-19:after {
  background-clip: padding-box;
  background-color: #1CB0F6;
  border: solid transparent;
  border-radius: 16px;
  border-width: 0 0 4px;
  bottom: -4px;
  content: "";
  left: 0;
  position: absolute;
  right: 0;
  top: 0;
  z-index: -1;
}

.button-19:main,
.button-19:focus {
  user-select: auto;
}

.button-19:hover:not(:disabled) {
  filter: brightness(1.1);
  -webkit-filter: brightness(1.1);
}

.button-19:disabled {
  cursor: auto;
}

.button-19:active {
  border-width: 4px 0 0;
  background: none;
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
<h2 style="text-align:center">All Flights</h2><br><br>
<div>
	<table>
		<thead>
			<th>Flight NO</th>
			<th>Flight Company</th>
			<th>Flight Departure</th>
			<th>Flight Arrival</th>
			<th>Flight Date</th>
			<th>Flight Time</th>
			<th>Flight Price</th>
			<th></th>
			<th></th>
		</thead>
		<tbody>
			<c:forEach var="f" items="${flist}">
			<tr>
				<td> <c:out value="${f.flightno}"></c:out> </td>
				<td><c:out value="${f.flightcomp}"></c:out></td>
				<td><c:out value="${f.flights}"></c:out></td>
				<td><c:out value="${f.fligthd}"></c:out></td>
				<td><c:out value="${f.flightdate}"></c:out></td>
				<td><c:out value="${f.flighttime}"></c:out></td>
				<td><c:out value="${f.fligthprice}"></c:out></td>
				<td><a id="editb" href="<%=request.getContextPath()%>/editflight?fid=<c:out value="${f.flightno}"/>">EDIT</a></td>
				<td><a id="deleteb" href="<%=request.getContextPath()%>/deleteflight?fid=<c:out value="${f.flightno}"/>">DELETE</a></td>			
			</tr>			
			</c:forEach>		
		</tbody>
	</table>
<br><br>
<div style="text-align:center">
	<a class="button-19" href="<%=request.getContextPath()%>/addflight.jsp">ADD FLIGHT</a>
</div>
</div>
</body>
</html>