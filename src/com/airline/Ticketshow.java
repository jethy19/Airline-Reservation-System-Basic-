package com.airline;

import java.io.*;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/showticket")
public class Ticketshow extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private HttpSession session;
	int fprice;
	String flightnum;
	String company;
	String source;
	String dest;
	LocalDate d;
	String ft;
	
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		session = request.getSession();
		String uname = session.getAttribute("uname").toString();
		int numberpnr = Integer.parseInt(request.getParameter("p"));
		List<Passengerlist> plist = fetchplist(numberpnr,uname);
		Connection conn = Database.connect();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from flightdetails where fno='"+flightnum+"'");
			while(rs.next()) {
				company = rs.getString("fcompany");
				source = rs.getString("fsource").toUpperCase();
				dest = rs.getString("fdest").toUpperCase();
				d = rs.getDate("fdate").toLocalDate();
				ft = rs.getString("ftime");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
				System.out.println("Connectin Closed");
			}catch(Exception ex) {
				ex.printStackTrace();
			}
		}
		request.setAttribute("plist",plist);
		request.setAttribute("airlinecomp",company);
		request.setAttribute("flightno",flightnum);
		request.setAttribute("pnrno",numberpnr);
		request.setAttribute("flightsource",source);
		request.setAttribute("flightdesti",dest);
		request.setAttribute("flightd",d);
		request.setAttribute("flightt",ft);
		request.setAttribute("flightfare", fprice);
		String capson = company.toUpperCase();
		request.setAttribute("capson", capson);

		RequestDispatcher rd = request.getRequestDispatcher("ticket.jsp");
		rd.forward(request, response);		
	}

	private List<Passengerlist> fetchplist(int numberpnr,String uname) {
		List<Passengerlist> temp = new ArrayList<>();
		Connection c = Database.connect();
		
		try {
			Statement stmt = c.createStatement();
			ResultSet rs = stmt.executeQuery("select * from passengerdetails where username='"+uname+"' and pnrno="+numberpnr+" order by porder");
			while(rs.next()){
				String pname = rs.getString("pname");
				int pnr = rs.getInt("pnrno");
				String seatno = rs.getString("seatno");
				fprice = rs.getInt("fare");
				flightnum = rs.getString("fno");
				int a = rs.getInt("age");
				String cno = rs.getString("contactno");
				String gender = rs.getString("gender");
				String emailid = rs.getString("email");
				temp.add(new Passengerlist(pname,pnr,seatno,a,cno,gender,emailid));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				c.close();
				System.out.println("Connection Closed");
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return temp;
	}

}
