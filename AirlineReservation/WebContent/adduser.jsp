<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add User</title>
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
	<h2>Add User Details</h2>
	<div id="inside" style="text-align:left;position:absolute;left:500px;top:150px">	
	<form action="<%=request.getContextPath()%>/adminadduser">	
		<label>Firstname </label>
		<input type="text" name="fname" placeholder="enter firstname" required>
		<br><br>
		<label>Lastname </label>
		<input type="text" name="lname" placeholder="enter lastname" required>
		<br><br>
		<label>Username </label>
		<input type="text" name="uname" placeholder="enter username" required>
		<br><br>
		<label>Password </label>
		<input type="password" name="pass" placeholder="enter password" required>
		<br><br>
		<label>Address </label>
		<input type="text" name="addr" placeholder="enter address" required>
		<br><br>
		<label>PhoneNo </label>
		<input type="tel" name="phone" maxlength="10" placeholder="enter phone number" required>
		<br><br>
		<label>User Type</label>
		<select name="ty">
			<option value=1>Admin</option>
			<option value=0>User</option>
		</select><br><br>
		<button type="submit" style="position:absolute;top:300px;left:100px">SAVE</button>
	</form>
	</div>
</div>
</body>
</html>