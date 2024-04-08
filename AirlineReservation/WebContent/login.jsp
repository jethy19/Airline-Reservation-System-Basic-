<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<script>
function myFunction() {
	  var x = document.getElementById("myInput");
	  if (x.type === "password") {
	    x.type = "text";
	  } else {
	    x.type = "password";
	  }
}
</script>
<body style="background-color:rgb(224, 255, 254)">
<div>
	<header>
	<nav style="background-color: rgb(245 120 66);padding:5px;position:fixed;top:0;left:0;width:100%">
		<div style="text-align:center;font-size:30px;color:white">
		<strong>AIRLINE RESERVATION</strong>
		</div>
		<div>
		<a style="margin-right: 50px;text-decoration:none;color:black"href= "<%=request.getContextPath()%>/login.jsp">LOGIN</a>
		<a style="text-decoration:none;color:black" href= "<%=request.getContextPath()%>/registration.jsp">SIGNUP</a>
		</div>
	</nav>
	</header>
	<br><br><br><br>
	<div id="mainform" style="text-align:center">
		<h3>SignIn</h3>
		<form action="<%=request.getContextPath()%>/userlogin">
			<label>Username </label>
			<input type="text" name="username" placeholder="enter username" required>
			<br><br>
			<label>Password </label>
			<input id ="myInput" type="password" name="userpass" placeholder="enter password" required>
			<br><br>
			<input type="checkbox" onclick="myFunction()">Show Password
			<br><br>
			<button type="submit">LOGIN</button>
		</form>
	</div>
</div>
</body>
</html>