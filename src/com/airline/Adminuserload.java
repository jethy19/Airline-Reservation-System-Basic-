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

@WebServlet("/adminshowuser")
public class Adminuserload extends HttpServlet{

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		List<Adminuserloaddao> userlist = fetchlistu();
		request.setAttribute("userlist",userlist);		
		RequestDispatcher r = request.getRequestDispatcher("usertable.jsp");
		r.forward(request, response);
	}

	private List<Adminuserloaddao> fetchlistu() {
		List<Adminuserloaddao> temp = new ArrayList<Adminuserloaddao>();
		Connection c = Database.connect();
		try {
			Statement stmt = c.createStatement();
			ResultSet rs = stmt.executeQuery("select * from airlineuser order by userid");
			while(rs.next()) {
				int uid = rs.getInt("userid");
				String fname = rs.getString("fname");
				String lname = rs.getString("lname");
				String username = rs.getString("username");
				String pass = rs.getString("pass");
				int admin = rs.getInt("aadmin");
				String address = rs.getString("uaddress");
				String mob = rs.getString("umobile");
				
				temp.add(new Adminuserloaddao(uid,fname,lname,username,pass,admin,address,mob));
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
		return temp;
	}
}
