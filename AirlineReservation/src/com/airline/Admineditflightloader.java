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

@WebServlet("/editflight")
public class Admineditflightloader extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	String fno;
	String fcomp;
	String source;
	String dest;
	LocalDate d;
	String ftime;
	String fprice;
	
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		String flightno = request.getParameter("fid");
		Connection c = Database.connect();
		try {
			Statement stmt = c.createStatement();
			ResultSet rs = stmt.executeQuery("select * from flightdetails where fno='"+flightno+"'");
			while(rs.next()) {
				fno = rs.getString("fno");
				fcomp = rs.getString("fcompany");
				source = rs.getString("fsource");
				dest = rs.getString("fdest");
				d = rs.getDate("fdate").toLocalDate();
				ftime = rs.getString("ftime");
				fprice = rs.getString("fprice");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				c.close();
				System.out.println("Connection Closed !");
			}catch(Exception ex) {
				ex.printStackTrace();
			}
		}
		List<String> company = new ArrayList<String>();
		company.add("indigo");
		company.add("vistara");
		company.add("airindia");
		company.add("jetairways");
		company.add("akasaair");
		company.add("spicejet");
		company.add("airasia");
		company.add("goair");
		company.remove(fcomp);
		
		request.setAttribute("optionlist", company);
		request.setAttribute("fno", fno);
		request.setAttribute("fcomp", fcomp);
		request.setAttribute("source", source);
		request.setAttribute("dest", dest);
		request.setAttribute("d", d);
		request.setAttribute("ftime", ftime);
		request.setAttribute("fprice", fprice);
		
		RequestDispatcher r = request.getRequestDispatcher("flightedit.jsp");
		r.forward(request, response);
	}

}
