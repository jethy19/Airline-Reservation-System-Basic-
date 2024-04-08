<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cancel</title>
</head>
<body>
<script>
if(confirm("Are you sure to cancel"))
{
	window.location = "usermain.jsp";	
}
else{
	history.back();
}
</script>
</body>
</html>