<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Payment</title>
<style type="text/css">

body {
  background-image: linear-gradient(-90deg, #E6E2AF 0%, #002F2F 100%);
}

.component {
  position: relative;
  width: 30%;
  margin: 5rem auto;
  padding: 1rem;

  box-shadow: 2px 2px 10px #454545;
  background-color: #FFFFFF;
  
  text-align: center;
}

.payment h2 {
  color: rgba(4,99,128,1);
}


.valid-button {
	border: 0;
	padding: 1rem 2rem;
	background-color: rgba(4,99,128,0.9);
	color: #EFECCA;
	font-weight:bold;
	margin-top:2rem;
  box-shadow: 1px 1px 1px black;
}

.valid-button:hover {
  background-color: rgba(4,99,128,1);
  box-shadow: none;
}
</style>
</head>
<body>
	<section class="component">
  	<%	Integer c = Integer.parseInt(request.getParameter("count"));
  		Integer p = Integer.parseInt(request.getParameter("totalfare"));
  		Integer val = p/c;
  	%>
  	<div class="payment">
    <h2>PAYMENT DETAILS</h2>
    <form action="<%=request.getContextPath()%>/paymentsuccess.jsp">
    <label>Flight Price : <%=val%> </label>
    <br><br>
    <label>Total Person : <%=request.getParameter("count")%> </label>
    <br><br><hr>
    <label>Total Amount : <%=request.getParameter("totalfare")%> </label>
     <br><br>
      <button type="submit" class="valid-button">PAY</button>
    </form>
  </div>
</section>
</body>
</html>