<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Profile</title>
</head>
<style>
.formcard{
		background: rgb(255, 214, 92);
		padding-top:10px;
		padding-bottom:10px;
        padding-left: 200px;
        padding-right:200px;
        border-radius: 4px;
        box-shadow: 0 2px 3px #C8D0D8;
        display: inline-block;
        margin: 0 auto;
}



.button-7 {
  background-color: #0095ff;
  border: 1px solid transparent;
  border-radius: 3px;
  box-shadow: rgba(255, 255, 255, .4) 0 1px 0 0 inset;
  box-sizing: border-box;
  color: #fff;
  cursor: pointer;
  display: inline-block;
  font-family: -apple-system,system-ui,"Segoe UI","Liberation Sans",sans-serif;
  font-size: 15px;
  font-weight: 400;
  line-height: 1.15385;
  margin: 0;
  outline: none;
  padding: 8px .8em;
  position: relative;
  text-align: center;
  text-decoration: none;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
  vertical-align: baseline;
  white-space: nowrap;
}

.button-7:hover,
.button-7:focus {
  background-color: #07c;
}

.button-7:focus {
  box-shadow: 0 0 0 4px rgba(0, 149, 255, .15);
}

.button-7:active {
  background-color: #0064bd;
  box-shadow: none;
}

</style>
<body style="background-color:rgb(224, 255, 254)">
<header>
<nav style="background-color: rgb(245 120 66);width:100%;position:absolute;top:0;left:0">
	<div style="text-align: left; font-size: 30px;color:white"><strong>AIRLINE RESERVATION</strong></div>
	<div style="text-align: right">
		<a style="text-decoration: none; color:black ;margin-right:80px" href="<%=request.getContextPath()%>/usermain.jsp">MAIN MENU</a>
		<a style="text-decoration: none; color:black ;margin-right:20px" href="<%=request.getContextPath()%>/logout">LOGOUT</a>
	</div>
</nav> 
</header>
<br><br>
<div style="text-align:center">
	<h2>User Profile</h2>
	<div class="formcard">
		<div>
			<img src="user.png" title="user icons" alt="loading" style="width:80px;height:80px">
		</div><br><br>
		<form action="userdetails.jsp" style="text-align:left;font-size:18px">
			<label>FirstName</label><br>
			<input type="text" name="firstn" value=<%=request.getAttribute("firstname")%> readonly><br><br>
			<label>Last Name</label><br>
			<input type="text" name="lastn" value=<%=request.getAttribute("lastname")%> readonly><br><br>
			<label>UserName</label><br>
			<input type="text" name="usern" value=<%=session.getAttribute("uname")%> readonly><br><br>
			<label>Password</label><br>
			<input type="password" name="passn" value=<%=request.getAttribute("password")%> readonly><br><br>
			<label>Address</label><br>
			<input type="text" name="addrn" value=<%=request.getAttribute("address")%> readonly><br><br>
			<label>Mobile No</label><br>
			<input type="text" name="phonen" value=<%=request.getAttribute("phoneno")%> readonly><br><br>
			<div style="text-align:center">
				<button class ="button-7" type="submit">EDIT</button>
			</div>
		</form>
	</div>
</div>
</body>
</html>