package com.airline;

public class Passengerlist {
	String pname;
	int pnrno;
	String seatno;
	int age;
	String cno;
	String gender;
	String emailid;
	
	public Passengerlist(String pname, int pnrno, String seatno, int age,String cno, String gender,String emailid) {
		this.pname = pname;
		this.pnrno = pnrno;
		this.seatno = seatno;
		this.age = age;
		this.cno = cno;
		this.gender = gender;
		this.emailid = emailid;
	}
	
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPnrno() {
		return pnrno;
	}
	public void setPnrno(int pnrno) {
		this.pnrno = pnrno;
	}
	public String getSeatno() {
		return seatno;
	}
	public void setSeatno(String seatno) {
		this.seatno = seatno;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getCno() {
		return cno;
	}
	public void setCno(String cno) {
		this.cno = cno;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
}
