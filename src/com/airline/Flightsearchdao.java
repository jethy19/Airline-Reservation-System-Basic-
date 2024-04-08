package com.airline;

public class Flightsearchdao {
	String fnumber;
	String fcompany;
	String fsource;
	String fdest;
	int price;
	String ftime;
	
	public Flightsearchdao(String fnumber, String fcompany, String fsource, String fdest, int price, String ftime) {
		this.fnumber = fnumber;
		this.fcompany = fcompany;
		this.fsource = fsource;
		this.fdest = fdest;
		this.price = price;
		this.ftime = ftime;
	}

	public String getFnumber() {
		return fnumber;
	}

	public void setFnumber(String fnumber) {
		this.fnumber = fnumber;
	}

	public String getFcompany() {
		return fcompany;
	}

	public void setFcompany(String fcompany) {
		this.fcompany = fcompany;
	}

	public String getFsource() {
		return fsource;
	}

	public void setFsource(String fsource) {
		this.fsource = fsource;
	}

	public String getFdest() {
		return fdest;
	}

	public void setFdest(String fdest) {
		this.fdest = fdest;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getFtime() {
		return ftime;
	}

	public void setFtime(String ftime) {
		this.ftime = ftime;
	}
	
	
	
	

}
