package com.airline;

import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/processing")
public class Processing extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	HttpSession session;
	
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException { 
		session = request.getSession();
		String uid = session.getAttribute("userid").toString();
		String username = session.getAttribute("uname").toString();
		int cnt = Integer.parseInt(request.getParameter("count"));
		int fare = Integer.parseInt(request.getParameter("bprice"));
		String flightnumber = request.getParameter("fnumber");
		String[] checkedIds = request.getParameterValues("ckb");
		int pnrno = 0;
		do {
			pnrno = getpnr();
		}while(verify(pnrno));
		for(int i = 1;i<=cnt;i++){			
			String passenger_name = request.getParameter("passenger"+i);
			String contact = request.getParameter("contact"+i);
			String email = request.getParameter("email"+i);
			String gender = request.getParameter("gender"+i);
			int age = Integer.parseInt(request.getParameter("age"+i));
			String seat = checkedIds[i-1];
			insertdata(pnrno,flightnumber,fare,uid,username,passenger_name,contact,email,gender,seat,i,age);
			
		}
		
		response.sendRedirect("payment.jsp?count="+cnt+"&totalfare="+fare);
	}

	private boolean verify(int pnrno) {
		Connection conn = Database.connect();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from passengerdetails where pnrno="+pnrno+"");
			if(rs.next())
			{
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
				System.out.println("Connection Closed !");
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	private int getpnr() {
		int result = (int)(Math.random()*(999999-100000)+100000);
		return result;
	}
	
	
	private void insertdata(int pnr,String flightnumber, int fare,String uid,String username,String pname,String contact,String emailid,String gender,String seatno,int order,int age){
		Connection c = Database.connect();
		try {
			Statement stmt = c.createStatement();
			stmt.executeUpdate("insert into passengerdetails(username,pnrno,pname,fno,seatno,fare,userid,contactno,email,gender,porder,age) values ('"+username+"',"+pnr+",'"+pname+"','"+flightnumber+"','"+seatno+"','"+fare+"','"+uid+"','"+contact+"','"+emailid+"','"+gender+"',"+order+","+age+")");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				c.close();
				System.out.println("Connection Closed !");
			}catch(Exception e) {
				e.printStackTrace();
			}
		}		
	}

}
