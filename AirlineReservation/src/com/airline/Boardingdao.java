package com.airline;

public class Boardingdao {
	String passengern;
	String flightn;
	String flights;
	String flightd;
	String flighttime;
	int passpnr;
	String flightcompany;
	String flightseat;
	
	public Boardingdao() {};
	
	public Boardingdao(String passengern, String flightn, String flights, String flightd, String flighttime,int passpnr, String flightcompany, String flightseat) {
		this.passengern = passengern;
		this.flightn = flightn;
		this.flights = flights;
		this.flightd = flightd;
		this.flighttime = flighttime;
		this.passpnr = passpnr;
		this.flightcompany = flightcompany;
		this.flightseat = flightseat;
	}
	
	public String getPassengern() {
		return passengern;
	}
	public void setPassengern(String passengern) {
		this.passengern = passengern;
	}
	public String getFlightn() {
		return flightn;
	}
	public void setFlightn(String flightn) {
		this.flightn = flightn;
	}
	public String getFlights() {
		return flights;
	}
	public void setFlights(String flights) {
		this.flights = flights;
	}
	public String getFlightd() {
		return flightd;
	}
	public void setFlightd(String flightd) {
		this.flightd = flightd;
	}
	public String getFlighttime() {
		return flighttime;
	}
	public void setFlighttime(String flighttime) {
		this.flighttime = flighttime;
	}
	public int getPasspnr() {
		return passpnr;
	}
	public void setPasspnr(int passpnr) {
		this.passpnr = passpnr;
	}
	public String getFlightcompany() {
		return flightcompany;
	}
	public void setFlightcompany(String flightcompany) {
		this.flightcompany = flightcompany;
	}
	public String getFlightseat() {
		return flightseat;
	}
	public void setFlightseat(String flightseat) {
		this.flightseat = flightseat;
	}
	
	

}
