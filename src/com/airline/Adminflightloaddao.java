package com.airline;

import java.time.LocalDate;

public class Adminflightloaddao {
	String flightno;
	String flightcomp;
	String flights;
	String fligthd;
	LocalDate flightdate;
	String flighttime;
	String fligthprice;
	public Adminflightloaddao(String flightno, String flightcomp, String flights, String fligthd, LocalDate flightdate,String flighttime, String fligthprice) {
		this.flightno = flightno;
		this.flightcomp = flightcomp;
		this.flights = flights;
		this.fligthd = fligthd;
		this.flightdate = flightdate;
		this.flighttime = flighttime;
		this.fligthprice = fligthprice;
	}
	
	public String getFlightno() {
		return flightno;
	}
	public void setFlightno(String flightno) {
		this.flightno = flightno;
	}
	public String getFlightcomp() {
		return flightcomp;
	}
	public void setFlightcomp(String flightcomp) {
		this.flightcomp = flightcomp;
	}
	public String getFlights() {
		return flights;
	}
	public void setFlights(String flights) {
		this.flights = flights;
	}
	public String getFligthd() {
		return fligthd;
	}
	public void setFligthd(String fligthd) {
		this.fligthd = fligthd;
	}
	public LocalDate getFlightdate() {
		return flightdate;
	}
	public void setFlightdate(LocalDate flightdate) {
		this.flightdate = flightdate;
	}
	public String getFlighttime() {
		return flighttime;
	}
	public void setFlighttime(String flighttime) {
		this.flighttime = flighttime;
	}
	public String getFligthprice() {
		return fligthprice;
	}
	public void setFligthprice(String fligthprice) {
		this.fligthprice = fligthprice;
	}	

}
