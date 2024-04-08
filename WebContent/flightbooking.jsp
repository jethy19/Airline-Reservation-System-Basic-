<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Booking</title>
<style>
*,*:before,*:after {
  box-sizing: border-box;
}
	html {
  	font-size: 16px;
	}
	
	.plane {
  margin: 100px auto;
  max-width: 300px;
}

.exit {
  position: relative;
  height: 50px;
  &:before,
  &:after {
    content: "EXIT";
    font-size: 14px;
    line-height: 18px;
    padding: 0px 2px;
    font-family: "Arial Narrow", Arial, sans-serif;
    display: block;
    position: absolute;
    background: red;
    color: white;
    top: 50%;
    transform: translate(0, -50%);
  }
   &:before {
    left: 0;
  }
  &:after {
    right: 0;
  }
}

.fuselage {
  border-right: 5px solid #d8d8d8;
  border-left: 5px solid #d8d8d8;
}
  
ol {
  list-style :none;
  padding: 0;
  margin: 0;
}

.seats {
  display: flex;
  flex-direction: row;
  flex-wrap: nowrap;
  justify-content: flex-start;  
}

.seat {
  display: flex;
  flex: 0 0 14.28571428571429%;
  padding: 5px;
  position: relative;  
  &:nth-child(3) {
    margin-right: 14.28571428571429%;
  }
  input[type=checkbox] {
    position: absolute;
    opacity: 0;
  }
  input[type=checkbox]:checked {
    + label {
     	background: green;      
      -webkit-animation-name: rubberBand;
          animation-name: rubberBand;
      animation-duration: 300ms;
      animation-fill-mode: both;
    }
  }
  input[type=checkbox]:disabled {
    + label {
      background: black;
      text-indent: -9999px;
      overflow: hidden;
      &:after {
        content: "X";
        text-indent: 0;
        position: absolute;
        top: 4px;
        left: 50%;
        transform: translate(-50%, 0%);
      }
      &:hover {
        box-shadow: none;
        cursor: not-allowed;
      }
    }
  }
  label {    
    display: block;
    position: relative;    
    width: 100%;    
    text-align: center;
    font-size: 14px;
    font-weight: bold;
    line-height: 1.5rem;
    padding: 4px 0;
    background: rgb(10, 49, 245);
    color: white;
    border-radius: 5px;
    animation-duration: 300ms;
    animation-fill-mode: both;
    

    &:hover {
      cursor: pointer;
      box-shadow: 0 0 0px 2px #5C6AFF;
    }
    
  }
}

@-webkit-keyframes rubberBand {
  0% {
    -webkit-transform: scale3d(1, 1, 1);
            transform: scale3d(1, 1, 1);
  }

  30% {
    -webkit-transform: scale3d(1.25, 0.75, 1);
            transform: scale3d(1.25, 0.75, 1);
  }

  40% {
    -webkit-transform: scale3d(0.75, 1.25, 1);
            transform: scale3d(0.75, 1.25, 1);
  }

  50% {
    -webkit-transform: scale3d(1.15, 0.85, 1);
            transform: scale3d(1.15, 0.85, 1);
  }

  65% {
    -webkit-transform: scale3d(.95, 1.05, 1);
            transform: scale3d(.95, 1.05, 1);
  }

  75% {
    -webkit-transform: scale3d(1.05, .95, 1);
            transform: scale3d(1.05, .95, 1);
  }

  100% {
    -webkit-transform: scale3d(1, 1, 1);
            transform: scale3d(1, 1, 1);
  }
}

@keyframes rubberBand {
  0% {
    -webkit-transform: scale3d(1, 1, 1);
            transform: scale3d(1, 1, 1);
  }

  30% {
    -webkit-transform: scale3d(1.25, 0.75, 1);
            transform: scale3d(1.25, 0.75, 1);
  }

  40% {
    -webkit-transform: scale3d(0.75, 1.25, 1);
            transform: scale3d(0.75, 1.25, 1);
  }

  50% {
    -webkit-transform: scale3d(1.15, 0.85, 1);
            transform: scale3d(1.15, 0.85, 1);
  }

  65% {
    -webkit-transform: scale3d(.95, 1.05, 1);
            transform: scale3d(.95, 1.05, 1);
  }

  75% {
    -webkit-transform: scale3d(1.05, .95, 1);
            transform: scale3d(1.05, .95, 1);
  }

  100% {
    -webkit-transform: scale3d(1, 1, 1);
            transform: scale3d(1, 1, 1);
  }
}

.rubberBand {
  -webkit-animation-name: rubberBand;
          animation-name: rubberBand;
}

#pay{
	margin:50px;
	background:rgb(245, 182, 10);
	height:40px;
	width:200px;	
	box-shadow: 0px 0px 2px 2px rgb(0,0,0);
	cursor: pointer;
} 

#cancel{
	background:rgb(245, 182, 10);
	box-shadow: 0px 0px 2px 2px rgb(0,0,0);
	height:40px;
	width:100px;
}

</style>
<script type="text/javascript">
function discheckbox(id){
	document.getElementById(id).disabled =true;
}


var total = parseInt(<%=request.getParameter("count")%>);
function chkcontrol(id){
	var remember = document.getElementById(id);
	if(remember.checked){
		total = total-1;
	}else{
		total = total+1;
	}
	if(total < 0){
		alert("Select upto <%=request.getParameter("count")%>");
		total = total+1;
		document.getElementById(id).checked=false;
	}
} 
</script>
</head>
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
	<div>
	<br><br><br><hr>
	<h3 style="text-align:center">Enter passenger details</h3>
	<form action="<%=request.getContextPath()%>/processing">
	<input type="hidden" name="count" value="${count}" />
	<input type="hidden" name="bprice" value="${bprice}" />
	<input type="hidden" name="fnumber" value="${fnumber}" />
	<%int c = Integer.parseInt(request.getParameter("count"));
		for(int i=1;i<=c;i++)
		{			
		%>
		<br><br><br>
		<label>Passenger <%=i%> Name </label>
		<input type="text" name="passenger<%=i%>" placeholder="enter name" required><br><br>
		<label>Contact Number </label>
		<input type="text" maxlength="10" name="contact<%=i%>" placeholder="enter number" required><br><br>
		<label>EmailId </label>
		<input type="email" name="email<%=i%>" placeholder="enter email" required><br><br>
		<label>Age </label>
		<input type="number" name="age<%=i%>" placeholder="enter age" required><br><br>
		<label>Gender </label>
		<select name="gender<%=i%>" required>
			<option value="male">MALE</option>
			<option value="female">FEMALE</option>
		</select><br><br>
	<%} %>
		<br><hr>
		<h3 style="text-align:center">Select Seats</h3>
	<div class="plane">
  		<div class="exit exit--front fuselage">    
		</div>
  		<ol class="cabin fuselage">
    		<li class="row row--1">
      		<ol class="seats" type="A">
        	<li class="seat">
          	<input type="checkbox" id="1A" name="ckb" value="1A" onclick='chkcontrol(this.id)'>
          	<label for="1A">1A</label>
        	</li>
        	<li class="seat">
          <input type="checkbox" id="1B" name="ckb" value="1B" onclick='chkcontrol(this.id)'/>
          <label for="1B">1B</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="1C" name="ckb" value="1C" onclick='chkcontrol(this.id)'/>
          <label for="1C">1C</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="1D" name="ckb" value="1D" onclick='chkcontrol(this.id)'/>
          <label for="1D">1D</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="1E" name="ckb" value="1E" onclick='chkcontrol(this.id)'/>
          <label for="1E">1E</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="1F" name="ckb" value="1F" onclick='chkcontrol(this.id)'/>
          <label for="1F">1F</label>
        </li>
      </ol>
    </li>
    <li class="row row--2">
      <ol class="seats" type="A">
        <li class="seat">
          <input type="checkbox" id="2A" name="ckb" value="2A" onclick='chkcontrol(this.id)'/>
          <label for="2A">2A</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="2B" name="ckb" value="2B" onclick='chkcontrol(this.id)'/>
          <label for="2B">2B</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="2C" name="ckb" value="2C" onclick='chkcontrol(this.id)'/>
          <label for="2C">2C</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="2D" name="ckb" value="2D" onclick='chkcontrol(this.id)'/>
          <label for="2D">2D</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="2E" name="ckb" value="2E" onclick='chkcontrol(this.id)'/>
          <label for="2E">2E</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="2F" name="ckb" value="2F" onclick='chkcontrol(this.id)'/>
          <label for="2F">2F</label>
        </li>
      </ol>
    </li>
    <li class="row row--3">
      <ol class="seats" type="A">
        <li class="seat">
          <input type="checkbox" id="3A" name="ckb" value="3A" onclick='chkcontrol(this.id)'/>
          <label for="3A">3A</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="3B" name="ckb" value="3B" onclick='chkcontrol(this.id)'/>
          <label for="3B">3B</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="3C" name="ckb" value="3C" onclick='chkcontrol(this.id)'/>
          <label for="3C">3C</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="3D" name="ckb" value="3D" onclick='chkcontrol(this.id)'/>
          <label for="3D">3D</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="3E" name="ckb" value="3E" onclick='chkcontrol(this.id)'/>
          <label for="3E">3E</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="3F" name="ckb" value="3F" onclick='chkcontrol(this.id)'/>
          <label for="3F">3F</label>
        </li>
      </ol>
    </li>
    <li class="row row--4">
      <ol class="seats" type="A">
        <li class="seat">
          <input type="checkbox" id="4A" name="ckb" value="4A" onclick='chkcontrol(this.id)'/>
          <label for="4A">4A</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="4B" name="ckb" value="4B" onclick='chkcontrol(this.id)'/>
          <label for="4B">4B</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="4C" name="ckb" value="4C" onclick='chkcontrol(this.id)'/>
          <label for="4C">4C</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="4D" name="ckb" value="4D" onclick='chkcontrol(this.id)'/>
          <label for="4D">4D</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="4E" name="ckb" value="4E" onclick='chkcontrol(this.id)'/>
          <label for="4E">4E</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="4F" name="ckb" value="4F" onclick='chkcontrol(this.id)'/>
          <label for="4F">4F</label>
        </li>
      </ol>
    </li>
    <li class="row row--5">
      <ol class="seats" type="A">
        <li class="seat">
          <input type="checkbox" id="5A" name="ckb" value="5A" onclick='chkcontrol(this.id)'/>
          <label for="5A">5A</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="5B" name="ckb" value="5B" onclick='chkcontrol(this.id)'/>
          <label for="5B">5B</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="5C" name="ckb" value="5C" onclick='chkcontrol(this.id)'/>
          <label for="5C">5C</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="5D" name="ckb" value="5D" onclick='chkcontrol(this.id)'/>
          <label for="5D">5D</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="5E" name="ckb" value="5E" onclick='chkcontrol(this.id)'/>
          <label for="5E">5E</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="5F" name="ckb" value="5F" onclick='chkcontrol(this.id)'/>
          <label for="5F">5F</label>
        </li>
      </ol>
    </li>
    <li class="row row--6">
      <ol class="seats" type="A">
        <li class="seat">
          <input type="checkbox" id="6A" name="ckb" value="6A" onclick='chkcontrol(this.id)'/>
          <label for="6A">6A</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="6B" name="ckb" value="6B" onclick='chkcontrol(this.id)'/>
          <label for="6B">6B</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="6C" name="ckb" value="6C" onclick='chkcontrol(this.id)'/>
          <label for="6C">6C</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="6D" name="ckb" value="6D" onclick='chkcontrol(this.id)'/>
          <label for="6D">6D</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="6E" name="ckb" value="6E" onclick='chkcontrol(this.id)'/>
          <label for="6E">6E</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="6F" name="ckb" value="6F" onclick='chkcontrol(this.id)'/>
          <label for="6F">6F</label>
        </li>
      </ol>
    </li>
    <li class="row row--7">
      <ol class="seats" type="A">
        <li class="seat">
          <input type="checkbox" id="7A" name="ckb" value="7A" onclick='chkcontrol(this.id)'/>
          <label for="7A">7A</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="7B" name="ckb" value="7B" onclick='chkcontrol(this.id)'/>
          <label for="7B">7B</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="7C" name="ckb" value="7C" onclick='chkcontrol(this.id)'/>
          <label for="7C">7C</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="7D" name="ckb" value="7D" onclick='chkcontrol(this.id)'/>
          <label for="7D">7D</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="7E" name="ckb" value="7E" onclick='chkcontrol(this.id)'/>
          <label for="7E">7E</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="7F" name="ckb" value="7F" onclick='chkcontrol(this.id)'/>
          <label for="7F">7F</label>
        </li>
      </ol>
    </li>
    <li class="row row--8">
      <ol class="seats" type="A">
        <li class="seat">
          <input type="checkbox" id="8A" name="ckb" value="8A" onclick='chkcontrol(this.id)'/>
          <label for="8A">8A</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="8B" name="ckb" value="8B" onclick='chkcontrol(this.id)'/>
          <label for="8B">8B</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="8C" name="ckb" value="8C" onclick='chkcontrol(this.id)'/>
          <label for="8C">8C</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="8D" name="ckb" value="8D" onclick='chkcontrol(this.id)'/>
          <label for="8D">8D</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="8E" name="ckb" value="8E" onclick='chkcontrol(this.id)'/>
          <label for="8E">8E</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="8F" name="ckb" value="8F" onclick='chkcontrol(this.id)'/>
          <label for="8F">8F</label>
        </li>
      </ol>
    </li>
    <li class="row row--9">
      <ol class="seats" type="A">
        <li class="seat">
          <input type="checkbox" id="9A" name="ckb" value="9A" onclick='chkcontrol(this.id)'/>
          <label for="9A">9A</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="9B" name="ckb" value="9B" onclick='chkcontrol(this.id)'/>
          <label for="9B">9B</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="9C" name="ckb" value="9C" onclick='chkcontrol(this.id)'/>
          <label for="9C">9C</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="9D" name="ckb" value="9D" onclick='chkcontrol(this.id)'/>
          <label for="9D">9D</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="9E" name="ckb" value="9E" onclick='chkcontrol(this.id)'/>
          <label for="9E">9E</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="9F" name="ckb" value="9F" onclick='chkcontrol(this.id)'/>
          <label for="9F">9F</label>
        </li>
      </ol>
    </li>
    <li class="row row--10">
      <ol class="seats" type="A">
        <li class="seat">
          <input type="checkbox" id="10A" name="ckb" value="10A" onclick='chkcontrol(this.id)'/>
          <label for="10A">10A</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="10B" name="ckb" value="10B" onclick='chkcontrol(this.id)'/>
          <label for="10B">10B</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="10C" name="ckb" value="10C" onclick='chkcontrol(this.id)'/>
          <label for="10C">10C</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="10D" name="ckb" value="10D" onclick='chkcontrol(this.id)'/>
          <label for="10D">10D</label>
        </li>
        <li class="seat">
          <input type="checkbox"  id="10E" name="ckb" value="10E" onclick='chkcontrol(this.id)'/>
          <label for="10E">10E</label>
        </li>
        <li class="seat">
          <input type="checkbox" id="10F" name="ckb" value="10F" onclick='chkcontrol(this.id)'/>
          <label for="10F">10F</label>
        </li>
      </ol>
    </li>
  </ol>
  	<div class="exit exit--back fuselage">
    </div>
	</div>
	<div style="display:flex;justify-content:center">
	<div style="display:inline-block;display:flex;align-items: center;justify-content: center;">
		<div id = "cancel" style="text-align:center;display:flex;align-items: center;justify-content: center;">
			<a  style="text-decoration: none; color:black;" href="<%=request.getContextPath()%>/cancel.jsp"><strong>CANCEL</strong></a>
		</div>
	</div>
	<div style="display:inline-block">
		<button id="pay" type="submit"><strong>PROCEED TO PAYMENT</strong></button>
	</div>	
	</div>	
</form>
	</div>
	<c:if test="${emp == false}">
	<c:forEach var ="disablelist" items="${DisableList}">
		<script> discheckbox("${disablelist}") </script>
	</c:forEach>
	</c:if>
</body>
</html>