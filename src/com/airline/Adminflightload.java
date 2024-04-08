package com.airline;

import java.io.*;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/adminflightshow")
public class Adminflightload extends HttpServlet{
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		List<Adminflightloaddao> userlist = fetchlistp();
		request.setAttribute("flist",userlist);		
		RequestDispatcher r = request.getRequestDispatcher("flighttable.jsp");
		r.forward(request, response);
}

	private List<Adminflightloaddao> fetchlistp() {
		List<Adminflightloaddao> temp = new ArrayList<Adminflightloaddao>();
		Connection c = Database.connect();
		try {
			Statement stmt = c.createStatement();
			ResultSet rs = stmt.executeQuery("select * from flightdetails order by fdate");
			while(rs.next()) {
				String fno = rs.getString("fno");
				String fcom = rs.getString("fcompany");
				String source = rs.getString("fsource");
				String dest = rs.getString("fdest");
				LocalDate d = rs.getDate("fdate").toLocalDate();
				String ftime = rs.getString("ftime");
				String fprice = rs.getString("fprice");
				
				temp.add(new Adminflightloaddao(fno,fcom,source,dest,d,ftime,fprice));
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
