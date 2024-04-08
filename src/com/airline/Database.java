package com.airline;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.servlet.ServletContext;
import javax.servlet.ServletInputStream;

public class Database {
		
	private static String url = "";
	private static String dbuser = "";
    private static String dbpass = "";
    
    public static Connection connect(){
    	Connection con = null;
    	try {
    		Class.forName ("oracle.jdbc.OracleDriver");
    		con = DriverManager.getConnection(url,dbuser,dbpass);
    		if (con != null) {
                System.out.println("Connected to the Oracle DB!");
                return con;
            } else {
                System.out.println("Failed to make connection!");
            }
    	}catch (SQLException e) {
            System.err.format("SQL State: %s\n%s", e.getSQLState(), e.getMessage());
        }catch (Exception e) {
        	System.out.println("Hello");
            e.printStackTrace();
        }        
        return con; 
    }

}