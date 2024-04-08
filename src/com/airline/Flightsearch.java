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

@WebServlet("/searchflights")
public class Flightsearch extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException {
		String source = request.getParameter("source").toLowerCase();
		String destination = request.getParameter("dest").toLowerCase();
		Date dt = Date.valueOf(request.getParameter("dt"));
		int ppl = Integer.parseInt(request.getParameter("people"));		
		List<Flightsearchdao> flightlist = fetchlist(source,destination,dt,ppl);
		boolean var = true;
		if(flightlist.isEmpty()) {
			request.setAttribute("value",var);
		}else{
			var = false;
			request.setAttribute("value",var);
		}
		request.setAttribute("flightpeople",ppl);
		request.setAttribute("flightList", flightlist);
		RequestDispatcher rd = request.getRequestDispatcher("search.jsp");
		rd.forward(request, response);
		
	}

	private List<Flightsearchdao> fetchlist(String source, String destination, Date dt, int ppl) {
		
		List<Flightsearchdao> templist = new ArrayList<>();
		Connection c = Database.connect();
		try {
			Statement stmt = c.createStatement();
			ResultSet rs = stmt.executeQuery("select * from flightdetails where fsource='"+source+"' and fdest='"+destination+"' and fdate=TO_DATE('"+dt+"','yyyy-mm-dd') order by fprice");
			while(rs.next()){
				String num = rs.getString("fno");
				String com = rs.getString("fcompany");
				String s = rs.getString("fsource").toUpperCase();
				String d = rs.getString("fdest").toUpperCase();
				String t = rs.getString("ftime");
				int p = (rs.getInt("fprice")*ppl);
				templist.add(new Flightsearchdao(num,com,s,d,p,t));
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
		return templist;
	}

}
