<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bording Pass</title>
<script src="https://cdn.jsdelivr.net/npm/jsbarcode@3.11.0/dist/JsBarcode.all.min.js"></script>
</head>
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

    svgElement.setAttribute("width", "100");
    svgElement.setAttribute("height", "100");
    
    document.getElementById('barcode').appendChild(svgElement);

    JsBarcode(svgElement, barcodeValue, {
        format: "CODE128",
        displayValue: false,
        height:25,
        width:1
    });
}

function generateBarcode2() {
    let barcodeValue = document.getElementById('barcodeValue').value;
    
	document.getElementById('barcode2').innerHTML = "";
    let svgElement = document.createElementNS("http://www.w3.org/2000/svg", "svg");
    document.getElementById('barcode2').appendChild(svgElement);

    JsBarcode(svgElement, barcodeValue, {
        format: "CODE128",
        displayValue: false,
        height:25,
        width:1
    });
}

function show(){
	document.getElementById("box").style.visibility="visible";
	document.getElementById('db').style.display='block';
}

function hid(){
	document.getElementById("box").style.visibility="hidden";
	console.log("hello")
}

</script>
<style>
body{
  margin: 0;
  padding: 0;
  background-color: rgb(224, 255, 254);
}

#ticket:after{
  content: '';
  
}

.button-74 {
  background-color: #fbeee0;
  border: 2px solid #422800;
  border-radius: 30px;
  box-shadow: #422800 4px 4px 0 0;
  color: #422800;
  cursor: pointer;
  display: inline-block;
  font-weight: 600;
  font-size: 18px;
  padding: 0 18px;
  line-height: 50px;
  text-align: center;
  text-decoration: none;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
}

.button-74:hover {
  background-color: #fff;
}

.button-74:active {
  box-shadow: #422800 2px 2px 0 0;
  transform: translate(2px, 2px);
}

@media (min-width: 768px) {
  .button-74 {
    min-width: 120px;
    padding: 0 25px;
  }
}

</style>
<body onload="generateBarcode();generateBarcode2();">
<header>
<nav style="background-color: rgb(245 120 66);width:100%;position:absolute;top:0;left:0">
	<div style="text-align: left; font-size: 30px;color:white"><strong>AIRLINE RESERVATION</strong></div>
	<div style="text-align: right">
		<a style="text-decoration: none; color:black ;margin-right:80px" href="<%=request.getContextPath()%>/usermain.jsp">MAIN MENU</a>
		<a style="text-decoration: none; color:black ;margin-right:20px" href="<%=request.getContextPath()%>/logout">LOGOUT</a>
	</div>
</nav> 
</header>
<br><br><br><br>
<div style="text-align:center;">
<strong>Select the Passenger for Boarding Pass</strong>
<form action="<%=request.getContextPath()%>/showdetailpass">
<select name="passenger">
	<c:forEach var="pas" items="${passengerlist}">
		<option value="${pas}"><c:out value="${pas}"></c:out></option>
	</c:forEach>
</select>
<button type="submit">SHOW</button>
</form>
</div>
<div id="box" class="box" style="visibility:hidden;position: absolute;top: calc(50% - 125px);top: -webkit-calc(50% - 125px);left: calc(50% - 300px);left: -webkit-calc(50% - 300px);">
	<div id = "ticket" class="ticket" style="position:absolute;width: 600px;height: 260px;background-color: #FFB300;border-radius: 3px;box-shadow: 0 0 100px #aaa;border-top: 1px solid #E89F3D;border-bottom: 1px solid #E89F3D;">
  	<div style="position: absolute;right: 200px;top: 0px;width: 2px;height: 250px;box-shadow: inset 0 0 0 #FFB300,inset 0 -10px 0 #B56E0A,inset 0 -20px 0 #FFB300,inset 0 -30px 0 #B56E0A,inset 0 -40px 0 #FFB300,inset 0 -50px 0 #999999,inset 0 -60px 0 #E5E5E5,inset 0 -70px 0 #999999,inset 0 -80px 0 #E5E5E5,inset 0 -90px 0 #999999,inset 0 -100px 0 #E5E5E5,inset 0 -110px 0 #999999,inset 0 -120px 0 #E5E5E5,inset 0 -130px 0 #999999,inset 0 -140px 0 #E5E5E5,inset 0 -150px 0 #B0B0B0,inset 0 -160px 0 #EEEEEE,inset 0 -170px 0 #B0B0B0,inset 0 -180px 0 #EEEEEE,inset 0 -190px 0 #B0B0B0,inset 0 -200px 0 #EEEEEE,inset 0 -210px 0 #B0B0B0,inset 0 -220px 0 #FFB300,inset 0 -230px 0 #B56E0A,inset 0 -240px 0 #FFB300,inset 0 -250px 0 #B56E0A;"></div>
    <span class="airline" style="position: absolute;top: 10px;left: 10px;font-family: Arial;font-size: 20px;font-weight: bold;color: rgba(0,0,102,1);"> ${airlinecompany} </span>
    <span class="airline airlineslip" style="position: absolute;top: 10px;left: 455px;font-family: Arial;font-size: 20px;font-weight: bold;color: rgba(0,0,102,1);"> ${airlinecompany} </span>
    <span class="boarding" style="position: absolute;top: 10px;right: 220px;font-family: sans-serif;font-size: 18px;color: white;"><strong>Boarding pass</strong></span>
    <div class="content" style="position: absolute;top: 40px;width: 100%;height: 170px;background: #eee;">
    	<div style="position: absolute;right: 200px;top: 0px;width: 2px;height: 200px;box-shadow: inset 0 0 0 #FFB300,inset 0 -10px 0 #B56E0A,inset 0 -20px 0 #FFB300,inset 0 -30px 0 #B56E0A,inset 0 -40px 0 #FFB300,inset 0 -50px 0 #999999,inset 0 -60px 0 #E5E5E5,inset 0 -70px 0 #999999,inset 0 -80px 0 #E5E5E5,inset 0 -90px 0 #999999,inset 0 -100px 0 #E5E5E5,inset 0 -110px 0 #999999,inset 0 -120px 0 #E5E5E5,inset 0 -130px 0 #999999,inset 0 -140px 0 #E5E5E5,inset 0 -150px 0 #B0B0B0,inset 0 -160px 0 #EEEEEE,inset 0 -170px 0 #B0B0B0,inset 0 -180px 0 #EEEEEE,inset 0 -190px 0 #B0B0B0,inset 0 -200px 0 #EEEEEE "></div>
      <span class="jfk" style="position: absolute;top: 20px;left: 5px;font-family: Arial;font-size: 18px;color: #222;"> ${fdepart} </span>
      <span class="plane" style="position: absolute;left: 178px;top: 16px;"><?xml version="1.0" ?><svg clip-rule="evenodd" fill-rule="evenodd" height="30" width="30" image-rendering="optimizeQuality" shape-rendering="geometricPrecision" text-rendering="geometricPrecision" viewBox="0 0 500 500" xmlns="http://www.w3.org/2000/svg"><g stroke="#222"><line fill="none" stroke-linecap="round" stroke-width="30" x1="300" x2="55" y1="390" y2="390"/><path d="M98 325c-9 10 10 16 25 6l311-156c24-17 35-25 42-50 2-15-46-11-78-7-15 1-34 10-42 16l-56 35 1-1-169-31c-14-3-24-5-37-1-10 5-18 10-27 18l122 72c4 3 5 7 1 9l-44 27-75-15c-10-2-18-4-28 0-8 4-14 9-20 15l74 63z" fill="#222" stroke-linejoin="round" stroke-width="10"/></g></svg></span>
      <span class="sfo" style="position: absolute;top: 20px;left: 240px;font-family: Arial;font-size: 18px;color: #222;"> ${farrv} </span>
      <span class="jfk jfkslip" style="position: absolute;font-size: 15px;top: 3px;left: 440px;font-family: Arial;color: #222;"> ${fdepart} </span>
      <span class="plane planeslip" style="position: absolute;top: 20px;left: 475px;"><?xml version="1.0" ?><svg clip-rule="evenodd" fill-rule="evenodd" height="30" width="30" image-rendering="optimizeQuality" shape-rendering="geometricPrecision" text-rendering="geometricPrecision" viewBox="0 0 500 500" xmlns="http://www.w3.org/2000/svg"><g stroke="#222"><line fill="none" stroke-linecap="round" stroke-width="30" x1="300" x2="55" y1="390" y2="390"/><path d="M98 325c-9 10 10 16 25 6l311-156c24-17 35-25 42-50 2-15-46-11-78-7-15 1-34 10-42 16l-56 35 1-1-169-31c-14-3-24-5-37-1-10 5-18 10-27 18l122 72c4 3 5 7 1 9l-44 27-75-15c-10-2-18-4-28 0-8 4-14 9-20 15l74 63z" fill="#222" stroke-linejoin="round" stroke-width="10"/></g></svg></span>
      <span class="sfo sfoslip" style="position: absolute;font-size: 15px;top: 50px;left: 450px;font-family: Arial;color: #222;"> ${farrv} </span>
      <div class="sub-content" style=" background: #e5e5e5;width: 100%;height: 100px;position: absolute;top: 70px;">
      	<div style="position: absolute;right: 200px;top: 0px;width: 2px;height: 100px;box-shadow: inset 0 0 0 #FFB300,inset 0 -10px 0 #B56E0A,inset 0 -20px 0 #FFB300,inset 0 -30px 0 #B56E0A,inset 0 -40px 0 #FFB300,inset 0 -50px 0 #999999,inset 0 -60px 0 #E5E5E5,inset 0 -70px 0 #999999,inset 0 -80px 0 #E5E5E5,inset 0 -90px 0 #999999,inset 0 -100px 0 #E5E5E5"></div>
        <span class="watermark" style="position: absolute;left: 50px;top: -40px;font-family: Arial;font-size: 150px;font-weight: bold;color: rgba(255,255,255,0.2);"> ${airlinecompany} </span>
        <span class="name" style="position: absolute;top: 10px;left: 10px;font-family: Arial Narrow, Arial;font-weight: bold;font-size: 14px;color: #999;">PASSENGER NAME<br><span style="color: #555;font-size: 17px;"> ${passn} </span></span>
        <span class="flight" style="position: absolute;top: 10px;left: 250px;font-family: Arial Narrow, Arial;font-weight: bold;font-size: 14px;color: #999;">FLIGHT NO<br><span style="color: #555;font-size: 17px;"> ${flightn} </span></span>
        <span class="seat" style="position:absolute;top: 10px;left: 350px;font-family: Arial Narrow, Arial;font-weight: bold;font-size: 14px;color: #999;">SEAT<br><span style="color: #555;font-size: 17px;"> ${fseat} </span></span>
        <span class="boardingtime" style="position: absolute;top: 60px;left: 10px;font-family: Arial Narrow, Arial;font-weight: bold;font-size: 14px;color: #999;">BOARDING TIME<br><span style="color: #555;font-size: 17px;"> ${ftime} </span></span>
            
         <span class="flight flightslip" style="position: absolute;top: 10px;left: 410px;font-family: Arial Narrow, Arial;font-weight: bold;font-size: 14px;color: #999;">FLIGHT NO<br><span style="color: #555;font-size: 17px;"> ${flightn} </span></span>
          <span class="seat seatslip" style="position:absolute;top: 10px;left: 540px;font-family: Arial Narrow, Arial;font-weight: bold;font-size: 14px;color: #999;">SEAT<br><span style="color: #555;font-size: 17px;"> ${fseat} </span></span>
         <span class="name nameslip" style="position: absolute; top: 60px;left: 410px;font-family: Arial Narrow, Arial;font-weight: bold;font-size: 14px;color: #999;">PASSENGER NAME<br><span style="color: #555;font-size: 17px;"> ${passn} </span></span>
      </div>
    </div>
    <input id="barcodeValue" type="hidden" value= "${fpnrno}" />
    <div id="barcode" class="barcode" style="position: absolute;left: 20px;bottom: 19px;height: 30px;width: 90px;"></div>
    <div id="barcode2" class="barcodeslip" style="position: absolute;left: 440px;bottom: 19px;height: 30px;width: 90px;"></div>
  </div>
</div>
<br><br>
<div id ="editor" style="text-align:center;position:absolute;top:520px;left:600px">
	<button id="db" class="button-74" style="display:none" onclick="printDiv('box','Ticket')"> DOWNLOAD</button>
</div>

<c:if test="${condition == false}"><script>show();</script></c:if>
</body>
</html>