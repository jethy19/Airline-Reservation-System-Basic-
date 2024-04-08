package com.airline;

import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/saveuser")
public class Adminuseredit extends HttpServlet{
	
private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException,ServletException {
		int uid = Integer.parseInt(request.getParameter("userid"));
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String uname = request.getParameter("uname");
		String p = request.getParameter("pass");	
		String addr = request.getParameter("addr");
		String phone = request.getParameter("phone");
		int t = Integer.parseInt(request.getParameter("ty"));
		Connection c = Database.connect();
		try {
			Statement stmt = c.createStatement();
			stmt.executeUpdate("update airlineuser set fname='"+fname+"',lname='"+lname+"',username='"+uname+"',pass='"+p+"',aadmin="+t+",uaddress='"+addr+"',umobile='"+phone+"' where userid="+uid+"");
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
		
		RequestDispatcher r = request.getRequestDispatcher("/adminshowuser");
		r.forward(request, response);
	}

}
