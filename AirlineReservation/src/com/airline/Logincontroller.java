package com.airline;

import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/userlogin")
public class Logincontroller extends HttpServlet{
	
	private HttpSession session;
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		session = request.getSession();		
		String u = request.getParameter("username");
		String p = request.getParameter("userpass");
		Logindao l = new Logindao(u,p);
		int val = login(l);
		if(val == -1)
		{
			response.sendRedirect("loginerror.jsp");
		}else{
			if(val == 1) {
				response.sendRedirect("adminmain.jsp");
			}
			else {
				response.sendRedirect("usermain.jsp");
			}
		}
	}

	private int login(Logindao l) {
		int res = -1;
		
		Connection c = Database.connect();
		try {
			Statement stmt = c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
				    ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = stmt.executeQuery("select * from airlineuser where USERNAME='"+l.getUsername()+"' AND PASS='"+l.getPassword()+"'");
			if(rs.next() == false){
				res = -1;
			}
			else {
				rs.beforeFirst();
				while(rs.next()){
					int ad = rs.getInt("aadmin");
					int uid = rs.getInt("userid");
					String uname = rs.getString("username");
					String ln = rs.getString("lname");
					String fn = rs.getString("fname");
					session.setAttribute("userid", uid);
					session.setAttribute("uname", uname);
					session.setAttribute("Name", fn+" "+ln);
					if(ad == 1) {
						res = 1;
					}
					else {
						res = 0;						
					}
				}								
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				c.close();
				System.out.println("Connection Closed!");
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return res;
	}
}
