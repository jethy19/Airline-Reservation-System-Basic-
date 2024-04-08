package com.airline;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/showdetailpass")
public class Boardingpassloader extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	HttpSession session;
	
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		session = request.getSession();
		int uid = Integer.parseInt((session.getAttribute("userid").toString()));
		String uname = session.getAttribute("uname").toString();
		String pkaname = request.getParameter("passenger");
		int pnr = Integer.parseInt(session.getAttribute("p").toString());
		List<String> liofpass = getpasslist(uid,uname,pnr);
		request.setAttribute("passengerlist", liofpass);
		Boardingdao wlist = getblist(pkaname,uid);
		request.setAttribute("airlinecompany", wlist.getFlightcompany());
		request.setAttribute("fdepart", wlist.getFlights());
		request.setAttribute("farrv", wlist.getFlightd());
		session.setAttribute("p", pnr);
		request.setAttribute("passn", wlist.getPassengern());
		request.setAttribute("flightn", wlist.getFlightn());
		request.setAttribute("fpnrno",wlist.getPasspnr());
		request.setAttribute("fseat", wlist.getFlightseat());
		request.setAttribute("ftime", wlist.getFlighttime());
		request.setAttribute("condition", false);
		
		RequestDispatcher rd = request.getRequestDispatcher("boardingpass.jsp");
		rd.forward(request,response);
		
	}

	private Boardingdao getblist(String pkaname,int uid) {
		
		Boardingdao temp = new Boardingdao();
		Connection c = Database.connect();
		try {
			Statement stmt = c.createStatement();
			ResultSet rs = stmt.executeQuery("select pd.pname,fd.fno,fd.fsource,fd.fdest,fd.ftime,pd.pnrno,fd.fcompany,pd.seatno from passengerdetails pd inner join flightdetails fd on pd.fno=fd.fno where pd.pname = '"+pkaname+"' and pd.userid="+uid+"");
			while(rs.next()){
				String pname = rs.getString("pname");
				String fno = rs.getString("fno");
				String fsource = rs.getString("fsource").toUpperCase();
				String fdest = rs.getString("fdest").toUpperCase();
				String ftime = rs.getString("ftime");
				int pnrno = rs.getInt("pnrno");
				String fcompany = rs.getString("fcompany");
				fcompany = fcompany.substring(0, 1).toUpperCase() + fcompany.substring(1); 
				String seatno = rs.getString("seatno");
				temp = new Boardingdao(pname,fno,fsource,fdest,ftime,pnrno,fcompany,seatno);
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
	
	private List<String> getpasslist(int uid, String uname, int pnr) {
		List<String> temp = new ArrayList<String>();
		Connection c = Database.connect();
		try {
			Statement stmt = c.createStatement();
			ResultSet rs = stmt.executeQuery("select pname from PASSENGERDETAILS where pnrno="+pnr+" and userid="+uid+" and username='"+uname+"' order by porder");
			while(rs.next()) {
				temp.add(rs.getString("pname"));
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
