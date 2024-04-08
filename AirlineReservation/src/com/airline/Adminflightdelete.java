package com.airline;

import java.io.*;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteflight")
public class Adminflightdelete extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		String flightno = request.getParameter("fid");
		Connection c = Database.connect();
		try {
			Statement stmt = c.createStatement();
			stmt.executeUpdate("delete from flightdetails where fno='"+flightno+"'");			
			stmt.executeUpdate("delete from passengerdetails where fno='"+flightno+"'");
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
		
		RequestDispatcher r = request.getRequestDispatcher("/adminflightshow");
		r.forward(request, response);
	}
}
