package com.airline;

import java.io.*;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/edituser")
public class Adminusereditloader extends HttpServlet{
	private static final long serialVersionUID = 1L;
	String fname;
	String lname;
	String username;
	String pass;
	int aadmin;
	String addr;
	String mobile;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException,ServletException {
		int uid = Integer.parseInt(request.getParameter("uid"));
		Connection c = Database.connect();
		try {
			Statement stmt = c.createStatement();
			ResultSet rs = stmt.executeQuery("select * from airlineuser where userid='"+uid+"'");
			while(rs.next()) {
				fname = rs.getString("fname");
				lname = rs.getString("lname");
				username = rs.getString("username");
				pass = rs.getString("pass");
				aadmin = rs.getInt("aadmin");
				addr = rs.getString("uaddress");
				mobile = rs.getString("umobile");
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
		
		int res = 0;
		if(aadmin == 0) {
			res = 1;
		}
		else {
			res = 0;
		}
		request.setAttribute("opp", res);
		request.setAttribute("fname", fname);
		request.setAttribute("lname", lname);
		request.setAttribute("username",username);
		request.setAttribute("pass",pass);
		request.setAttribute("aadmin",aadmin);
		request.setAttribute("addr",addr);
		request.setAttribute("mobile",mobile);
		request.setAttribute("uid",uid);
		
		RequestDispatcher r = request.getRequestDispatcher("useredit.jsp");
		r.forward(request, response);
	}
}
