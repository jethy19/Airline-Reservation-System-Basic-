<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ticket</title>
<script src="https://cdn.jsdelivr.net/npm/jsbarcode@3.11.0/dist/JsBarcode.all.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/0.9.0rc1/jspdf.min.js"></script>
<script type="text/javascript">

var doc = new jsPDF();

function printDiv(divId, title){
 let mywindow = window.open('', 'PRINT', 'height=650,width=900,top=100,left=150');

 mywindow.document.write(`<html><head><title>${title}</title>`);
 mywindow.document.write('</head><body >');
 mywindow.document.write(document.getElementById(divId).innerHTML);
 mywindow.document.write('</body></html>');

 mywindow.document.close(); // necessary for IE >= 10
 mywindow.focus(); // necessary for IE >= 10*/

 mywindow.print();
 mywindow.close();

 return true;
}


function generateBarcode() {
    let barcodeValue = document.getElementById('barcodeValue').value;

    document.getElementById('barcode').innerHTML = "";

    let svgElement = document.createElementNS("http://www.w3.org/2000/svg", "svg");
    document.getElementById('barcode').appendChild(svgElement);

    JsBarcode(svgElement, barcodeValue, {
        format: "CODE128",
        displayValue: true
    });
}


</script>
<style type="text/css">


#details th, #details td {
  padding: 15px;
  border-bottom: 1px solid #ddd;
}

#passenger tr:nth-child(even){background-color: #f2f2f2;}

#passenger tr:hover {background-color: #ddd;}

.button-71 {
  background-color: #0078d0;
  border: 0;
  border-radius: 56px;
  color: #fff;
  cursor: pointer;
  display: inline-block;
  font-family: system-ui,-apple-system,system-ui,"Segoe UI",Roboto,Ubuntu,"Helvetica Neue",sans-serif;
  font-size: 18px;
  font-weight: 600;
  outline: 0;
  padding: 16px 21px;
  position: relative;
  text-align: center;
  text-decoration: none;
  transition: all .3s;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
}

.button-71:before {
  background-color: initial;
  background-image: linear-gradient(#fff 0, rgba(255, 255, 255, 0) 100%);
  border-radius: 125px;
  content: "";
  height: 50%;
  left: 4%;
  opacity: .5;
  position: absolute;
  top: 0;
  transition: all .3s;
  width: 92%;
}

.button-71:hover {
  box-shadow: rgba(255, 255, 255, .2) 0 3px 15px inset, rgba(0, 0, 0, .1) 0 3px 5px, rgba(0, 0, 0, .1) 0 10px 13px;
  transform: scale(1.05);
}

@media (min-width: 768px) {
  .button-71 {
    padding: 16px 48px;
  }


</style>
</head>
<body onload="generateBarcode();">
<header>
<nav style="background-color: rgb(245 120 66);width:100%;position:absolute;top:0;left:0">
	<div style="text-align: left; font-size: 30px;color:white"><strong>AIRLINE RESERVATION</strong></div>
	<div style="text-align: right">
		<a style="text-decoration: none; color:black ;margin-right:80px" href="<%=request.getContextPath()%>/usermain.jsp">MAIN MENU</a>
		<a style="text-decoration: none; color:black ;margin-right:20px" href="<%=request.getContextPath()%>/logout">LOGOUT</a>
	</div>
</nav> 
</header>
<br><br><br>
<div id="ticket">
	<div style="text-align:center;">
			<h1>AIRLINE TICKET</h1>
            <input id="barcodeValue" type="hidden" value="${pnrno}"/>        
            <div id="barcode" style="text-align:right;"></div>
            <div id="image" style="display:inline-block;font-size:20px;position: absolute;top: 15px;left: 25px;">
            	<img width="100%" height="250px" src="${airlinecomp}.svg" alt="Loading">
            </div>    
    </div>	
    <hr><hr>
    <div id="arlinedetails">
    	<h2 style="color:rgb(115, 114, 114)">Flight Details</h2>
    	<table id="details" style="text-align:center;width:100%;border-style: dotted;">
    		<tr>
    			<th style="padding: 15px;border-bottom: 1px solid #ddd;">Flight No</th>
    			<th style="padding: 15px;border-bottom: 1px solid #ddd;">Departure</th>
    			<th style="padding: 15px;border-bottom: 1px solid #ddd;">Arrival</th>
    			<th style="padding: 15px;border-bottom: 1px solid #ddd;">Date</th>
    			<th style="padding: 15px;border-bottom: 1px solid #ddd;">Time</th>
    		</tr>
    		
    		<tr>
    			<td style="padding: 15px;border-bottom: 1px solid #ddd;"><c:out value="${flightno}"></c:out></td>
    			<td style="padding: 15px;border-bottom: 1px solid #ddd;"><c:out value="${flightsource}"></c:out></td>
    			<td style="padding: 15px;border-bottom: 1px solid #ddd;"><c:out value="${flightdesti}"></c:out></td>
    			<td style="padding: 15px;border-bottom: 1px solid #ddd;"><c:out value="${flightd}"></c:out></td>
    			<td style="padding: 15px;border-bottom: 1px solid #ddd;"><c:out value="${flightt}"></c:out></td>
    		</tr>
    	</table>
    </div>
    <br><br><br><hr><hr>
    <div>
    	<h2 style="color:rgb(115, 114, 114)">Passenger Details</h2>
    	<table id="passenger" style="text-align:center;width:100%;">
    		<tr>
    			<th style="border: 1px solid #ddd;padding: 8px;padding-top: 12px;padding-bottom: 12px;text-align: center;font-size:18px;">Passenger Name</th>
    			<th style="border: 1px solid #ddd;padding: 8px;padding-top: 12px;padding-bottom: 12px;text-align: center;font-size:18px;">PNR No</th>
    			<th style="border: 1px solid #ddd;padding: 8px;padding-top: 12px;padding-bottom: 12px;text-align: center;font-size:18px;">Seat No</th>
    			<th style="border: 1px solid #ddd;padding: 8px;padding-top: 12px;padding-bottom: 12px;text-align: center;font-size:18px;">Age</th>
    			<th style="border: 1px solid #ddd;padding: 8px;padding-top: 12px;padding-bottom: 12px;text-align: center;font-size:18px;">Contact No</th>
    			<th style="border: 1px solid #ddd;padding: 8px;padding-top: 12px;padding-bottom: 12px;text-align: center;font-size:18px;">Email Id</th>
    		</tr>
    		<c:forEach var="passenger" items="${plist}">
    			<tr>
    				<td style="border: 1px solid #ddd;"><c:out value="${passenger.pname}"></c:out></td>
    				<td style="border: 1px solid #ddd;"><c:out value="${passenger.pnrno}"></c:out></td>
    				<td style="border: 1px solid #ddd;"><c:out value="${passenger.seatno}"></c:out></td> 
    				<td style="border: 1px solid #ddd;"><c:out value="${passenger.age}"></c:out></td>
    				<td style="border: 1px solid #ddd;"><c:out value="${passenger.cno}"></c:out></td>  		
    				<td style="border: 1px solid #ddd;"><c:out value="${passenger.emailid}"></c:out></td>
    			</tr>    		
    		</c:forEach>    		
    	</table>
    </div>
    <br><br><br><hr><hr>
    <div style="text-align:right">
    	<div style="display:inline-block;font-size:20px"><strong>Total Fare : </strong></div>
    	<div style="display:inline-block;font-size:25x;margin-right:40px"><c:out value="${flightfare}"></c:out></div>
    </div>
    <br><hr><hr>
    <div>
    	<h3 style="color:rgb(115, 114, 114)">Baggage Allowance</h3>
    	<hr>
    	<p><strong>Cabin Baggage</strong></p>
    	 A. The Government of India regulations currently permit only one piece of cabin baggage per adult/child passenger on board.The weight of the cabin baggage should not exceed 7 kgs.
    	 <br><br>B. Passengers are permitted to carry one laptop over and above one piece of hand luggage as cabin baggage.
    	<p><strong>Check-in Baggage</strong></p>
    	<table id="bag" style="text-align:center;border: 1px solid;border-collapse:collapse;width:40%;">
    		<tr>
    			<th style="border: 1px solid;">Airline</th>
    			<th style="border: 1px solid;">Baggage Limit</th>
    		</tr>
    		<tr>
    			<td style="border: 1px solid;"><c:out value="${capson}"></c:out> </td>
    			<td style="border: 1px solid;">15 kgs</td>
    		</tr>
    	</table>    	
    </div>
    <br><br><hr><hr>
    <div>
    	<h3 style="color:rgb(115, 114, 114)">Important Information</h3>
    	<hr>
    	<ul style="list-style-type:square;">
    		<li>A printed copy of this e-ticket or e-ticket display on laptop, tablet or phone must be presented at the time of check in.</li>
    		<br>
    		<li>Check-in starts 2 hours before scheduled departure, and closes60 minutes prior to the departure time.We recommend you report at the check-in counter at least 2 hours prior to departure time.</li>
    		<br>
    		<li>It is mandatory to carry Government recognised photo identification (ID) along with your E-Ticket.This can include: Driving License, Passport, PAN Card, Voter ID Card or any other ID issued by theGovernment of India. For infant passengers, it is mandatory to carry the Date of Birth certificate.</li>
		</ul>
    </div>
</div><br><br>
<div id = "editor" style="text-align:center">
	<button class="button-71" onclick="printDiv('ticket','Ticket')"> DOWNLOAD E-TICKET </button>
</div>
</body>
</html>