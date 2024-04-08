<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registration</title>
</head>
<body style="background-color:rgb(224, 255, 254)">
	<header>
	<nav style="background-color: rgb(245 120 66);padding:5px;color:white;position:fixed;top:0;left:0;width:100%">
		<div style="text-align:center;font-size:30px;">
		<strong>AIRLINE RESERVATION</strong>
		</div>
		<div>
		<a style="margin-right: 50px;text-decoration:none;color:black"href= "<%=request.getContextPath()%>/login.jsp">LOGIN</a>
		<a style="text-decoration:none;color:black" href= "<%=request.getContextPath()%>/registration.jsp">SIGNUP</a>
		</div>
	</nav>
	</header>
	<br><br><br><br>
	<div style="text-align:center;">
	<h3>SignUp</h3>
	<form action="<%=request.getContextPath()%>/usersignup">
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
		<button type="submit">SIGNUP</button>
	</form>
	</div>
</body>
</html>