package com.airline;

import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/canceltick")
public class Ticketcancel extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	private HttpSession session;
	
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		session = request.getSession();
		String un = session.getAttribute("uname").toString();
		int id = Integer.parseInt(session.getAttribute("userid").toString());
		int pnrno = Integer.parseInt(session.getAttribute("pnr").toString());
		deleteticket(un,id,pnrno);
		session.removeAttribute("pnr");
		response.sendRedirect("ticketrefund.jsp");
	}

	private void deleteticket(String un, int id, int pnrno) {
		Connection c = Database.connect();
		try {
			Statement stmt = c.createStatement();
			stmt.executeUpdate("delete from passengerdetails where username='"+un+"' and userid="+id+" and pnrno="+pnrno+"");
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
	}
}
