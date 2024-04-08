package com.airline;

import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/adminadduser")
public class Adminadduser extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException,ServletException {
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String uname = request.getParameter("uname");
		String p = request.getParameter("pass");	
		String addr = request.getParameter("addr");
		String phone = request.getParameter("phone");
		int t = Integer.parseInt(request.getParameter("ty"));
		Connection c = Database.connect();
		try {
			int id = 1;
			Statement stmt = c.createStatement();
			ResultSet r = stmt.executeQuery("select * from airlineuser order by userid");
			while(r.next()) {
				id = r.getInt("userid");
			}
			id = id + 1;
			stmt.executeUpdate("insert into airlineuser (userid,fname,lname,username,pass,aadmin,uaddress,umobile) values ("+id+",'"+fname+"','"+lname+"','"+uname+"','"+p+"',"+t+",'"+addr+"','"+phone+"')");
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
