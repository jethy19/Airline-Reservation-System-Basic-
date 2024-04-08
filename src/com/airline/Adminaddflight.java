package com.airline;

import java.io.*;
import java.sql.*;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/addflightdetails")
public class Adminaddflight extends HttpServlet{

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException,ServletException {
		String flightno = request.getParameter("fno");
		String flightcompany = request.getParameter("fc");
		String fsource = request.getParameter("fsource");
		String fdest = request.getParameter("fdest");
		LocalDate fd = LocalDate.parse(request.getParameter("fdate"));
		Date dd = java.sql.Date.valueOf(fd);
		String ftime = request.getParameter("ftime");
		String fprice = request.getParameter("fprice");
		
		Connection c = Database.connect();
		try {
			Statement stmt = c.createStatement();
			stmt.executeUpdate("insert into flightdetails (fno,fcompany,fsource,fdest,fdate,ftime,fprice) values ('"+flightno+"','"+flightcompany+"','"+fsource+"','"+fdest+"',TO_DATE('"+dd+"','yyyy-mm-dd'),'"+ftime+"','"+fprice+"')");
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
