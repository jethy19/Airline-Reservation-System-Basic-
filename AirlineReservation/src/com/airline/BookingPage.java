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

@WebServlet("/bookingpage")
public class BookingPage extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException { 
		int c = Integer.parseInt(request.getParameter("count"));
		int bprice = Integer.parseInt(request.getParameter("bprice"));
		String fnumber = request.getParameter("fnumber");
		List<String> disablelist = fetchseats(fnumber);
		if(disablelist.isEmpty()) {
			request.setAttribute("emp", true);
		}
		else {
			request.setAttribute("emp", false);
		}
		request.setAttribute("DisableList", disablelist);
		request.setAttribute("count", c);
		request.setAttribute("bprice", bprice);
		request.setAttribute("fnumber", fnumber);
		
		RequestDispatcher rd = request.getRequestDispatcher("flightbooking.jsp");
		rd.forward(request, response);
		
	}

	private List<String> fetchseats(String fnumber) {
		List<String> seatlist = new ArrayList<String>();
		Connection c = Database.connect();
		try {
			Statement stmt = c.createStatement();
			ResultSet rs = stmt.executeQuery("select seatno from passengerdetails where fno='"+fnumber+"'");
			while(rs.next()) {
				seatlist.add(rs.getString("seatno"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				c.close();
				System.out.println("Connection is Closed");
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return seatlist;
	}

}