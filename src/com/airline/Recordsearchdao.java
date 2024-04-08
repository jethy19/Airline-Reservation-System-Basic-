package com.airline;

import java.time.LocalDate;

public class Recordsearchdao {
	int pnr;
	String flightnumber;
	String flightdep;
	String flightarr;
	String flighttime;
	LocalDate ld;
	
	public Recordsearchdao(int pnr, String flightnumber, String flightdep, String flightarr, String flighttime,LocalDate ld)
	{
		this.pnr = pnr;
		this.flightnumber = flightnumber;
		this.flightdep = flightdep;
		this.flightarr = flightarr;
		this.flighttime = flighttime;
		this.ld = ld;
	}
	public int getPnr() {
		return pnr;
	}
	public void setPnr(int pnr) {
		this.pnr = pnr;
	}
	public String getFlightnumber() {
		return flightnumber;
	}
	public void setFlightnumber(String flightnumber) {
		this.flightnumber = flightnumber;
	}
	public String getFlightdep() {
		return flightdep;
	}
	public void setFlightdep(String flightdep) {
		this.flightdep = flightdep;
	}
	public String getFlightarr() {
		return flightarr;
	}
	public void setFlightarr(String flightarr) {
		this.flightarr = flightarr;
	}
	public String getFlighttime() {
		return flighttime;
	}
	public void setFlighttime(String flighttime) {
		this.flighttime = flighttime;
	}
	public LocalDate getLd() {
		return ld;
	}
	public void setLd(LocalDate ld) {
		this.ld = ld;
	}
	
	
}
