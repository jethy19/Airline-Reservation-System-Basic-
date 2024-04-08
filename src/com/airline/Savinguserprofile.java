package com.airline;

import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/saveuserdetails")
public class Savinguserprofile extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	HttpSession session;
	
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		session = request.getSession();
		String firstname = request.getParameter("firstn");
		String lastname = request.getParameter("lastn");
		String username = session.getAttribute("uname").toString();
		String password = request.getParameter("passn");
		String address = request.getParameter("addrn");
		String phone = request.getParameter("phonen");
		session.setAttribute("Name", firstname+" "+lastname);
		int uid = Integer.parseInt(session.getAttribute("userid").toString());
		
		Connection c = Database.connect();
		try {
			Statement stmt = c.createStatement();
			stmt.executeUpdate("update airlineuser set fname='"+firstname+"',lname='"+lastname+"',username='"+username+"',pass='"+password+"',uaddress='"+address+"',umobile='"+phone+"' where userid="+uid+"");
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
		
		response.sendRedirect(request.getContextPath()+"/getuser");
	}
	
}
