package com.airline;

import java.io.*;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/getuser")
public class Userprofile extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	HttpSession session;
	String firstname;
	String lastname;
	String username;
	String password;
	String address;
	String phoneno;
	
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		session = request.getSession();
		username = session.getAttribute("uname").toString();
		int uid = Integer.parseInt(session.getAttribute("userid").toString());
		Connection c = Database.connect();
		try {
			Statement stmt = c.createStatement();
			ResultSet rs = stmt.executeQuery("select * from airlineuser where username='"+username+"' and userid="+uid+"");
			while(rs.next()){
				firstname = rs.getString("fname");
				lastname = rs.getString("lname");
				password = rs.getString("pass");
				address = rs.getString("uaddress");
				phoneno = rs.getString("umobile");
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
		
		request.setAttribute("firstname", firstname);
		request.setAttribute("lastname", lastname);
		request.setAttribute("password", password);
		request.setAttribute("address", address);
		request.setAttribute("phoneno", phoneno);
		
		RequestDispatcher rd = request.getRequestDispatcher("userprofile.jsp");
		rd.forward(request, response);
	}
	
}
