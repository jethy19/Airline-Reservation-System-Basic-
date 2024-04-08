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

@WebServlet("/showpass")
public class Boardingpasspassengers extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	HttpSession session;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException,ServletException{
		session = request.getSession();
		String uname = session.getAttribute("uname").toString();
		int uid = Integer.parseInt(session.getAttribute("userid").toString());
		int pnr = Integer.parseInt(request.getParameter("p").toString());
		List<String> liofpass = getpasslist(uid,uname,pnr);
		request.setAttribute("passengerlist", liofpass);
		session.setAttribute("p", pnr);
		request.setAttribute("condition", true);
		RequestDispatcher rd = request.getRequestDispatcher("boardingpass.jsp");
		rd.forward(request, response);
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
