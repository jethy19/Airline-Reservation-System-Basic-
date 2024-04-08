<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv = "refresh" content = "5; url = http://localhost:8080/AirlineReservation/usermain.jsp"/>
<title>Refund</title>
<link href="https://fonts.googleapis.com/css?family=Nunito+Sans:400,400i,700,900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style>
body {
        text-align: center;
        padding: 40px 0;
        background: #C6C8C4;
      }
        h2{
          color: rgb(47, 115, 204);;
          font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
          font-weight: 900;
          font-size: 30px;
          margin-bottom: 10px;
        }
        p {
          color: #404F5E;
          font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
          font-size:20px;
          margin: 0;
        }
i {
		color:rgb(47, 115, 204);
      }

.card {
        background: white;
        padding: 60px;
        border-radius: 4px;
        box-shadow: 0 2px 3px #C8D0D8;
        display: inline-block;
        margin: 0 auto;
      }

      @-webkit-keyframes fadeOut {
    0% {
        opacity: 1;
    }
    50% {
        opacity: 1;
    }
    100% {
        opacity: 0;
    }
}
@keyframes fadeOut {
    0% {
        opacity: 1;
    }
    50% {
        opacity: 1;
    }
    100% {
        opacity: 0;
    }
}
      
      #websiteOverlay{
  text-align:center;
  position: fixed;
  top: 0;
  left:0;
  right:0;
  bottom:0;
  background-color:black;
  color:white;
  opacity: 0;
  -webkit-animation: fadeOut 5s;
  animation: fadeOut 5s;      
      

</style>
<body>
	<div id="websiteOverlay">
  		<div style="display:flex;justify-content:center;align-items: center;font-size:30px">..Please Wait..</div>
  	</div>
	 <div class="card">
      <div style="border-radius:200px; height:200px; width:200px; background:white; margin:0 auto;">
        <i class="fa fa-telegram" style="font-size: 200px;border-radius:200px;margin:0 auto;"></i>
      </div>
        <h2>Refund Initiated</h2> 
        <p>Your Tickets Cancelled Successfully<br/>You will get your Refund soon.</p>
      </div>
</body>
</html>