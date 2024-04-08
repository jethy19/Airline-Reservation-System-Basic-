<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Edit</title>
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
	<h2>Edit User Details</h2>
	<form action="<%=request.getContextPath()%>/saveuser">
	<input type="hidden" name = "userid" value=<%=request.getAttribute("uid")%>>
		<label>Firstname </label>
		<input type="text" name="fname" value=<%=request.getAttribute("fname")%>>
		<br><br>
		<label>Lastname </label>
		<input type="text" name="lname" value=<%=request.getAttribute("lname")%>>
		<br><br>
		<label>Username </label>
		<input type="text" name="uname" value=<%=request.getAttribute("username")%>>
		<br><br>
		<label>Password </label>
		<input type="text" name="pass" value=<%=request.getAttribute("pass")%>>
		<br><br>
		<label>Address </label>
		<input type="text" name="addr" value=<%=request.getAttribute("addr")%>>
		<br><br>
		<label>PhoneNo </label>
		<input type="tel" name="phone" maxlength="10" value=<%=request.getAttribute("mobile")%>>
		<br><br>
		<label>User Type</label>
		<select name="ty">
			<option value="${aadmin}">${aadmin}</option>
			<option value="${opp}">${opp}</option>
		</select><br><br>
	<button type="submit">SAVE</button>
	</form>
</div>
</body>
</html>