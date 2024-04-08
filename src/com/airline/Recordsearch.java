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

@WebServlet("/searchrecord")
public class Recordsearch extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private HttpSession session;
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException {	
		session = request.getSession();
		String u = session.getAttribute("uname").toString();
		int uid = Integer.parseInt(session.getAttribute("userid").toString());
		List<Recordsearchdao> recordlist = fetchlist(u,uid);
		boolean var = true;
		if(recordlist.isEmpty()) {
			request.setAttribute("r",var);
		}else{
			var = false;
			request.setAttribute("r",var);
		}
		request.setAttribute("recordlist",recordlist);
		RequestDispatcher rd = request.getRequestDispatcher("bookingrecord.jsp");
		rd.forward(request, response);
		
	}
	private List<Recordsearchdao> fetchlist(String u, int uid) {
		List<Recordsearchdao> temp = new ArrayList<>();
		Connection c = Database.connect();
		try {
			Statement stmt = c.createStatement();
			ResultSet rs = stmt.executeQuery("select DISTINCT passengerdetails.PNRNO,flightdetails.FNO,flightdetails.FSOURCE,flightdetails.FDEST,flightdetails.FDATE,flightdetails.FTIME from flightdetails  inner join passengerdetails on flightdetails.FNO = passengerdetails.FNO where passengerdetails.USERNAME='"+u+"' and passengerdetails.USERID="+uid+"");
			while(rs.next()) {
				int pnrno = rs.getInt("PNRNO");
				String fno = rs.getString("FNO");
				String fsource = rs.getString("FSOURCE").toUpperCase();
				String fdest = rs.getString("FDEST").toUpperCase();
				LocalDate l = rs.getDate("FDATE").toLocalDate();
				String ftime = rs.getString("FTIME");
				temp.add(new Recordsearchdao(pnrno,fno,fsource,fdest,ftime,l));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				c.close();
				System.out.println("Connection Closed");
			}catch(Exception ex) {
				ex.printStackTrace();
			}
		}
		
		return temp;
	}

}
