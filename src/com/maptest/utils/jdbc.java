package com.maptest.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ResourceBundle;


//
public class jdbc {
	private static String driverClass;
	private static String url;
	private static String username;
	private static String password;
	
	static{
		//
		ResourceBundle rb = ResourceBundle.getBundle("dbinfo");
		driverClass = rb.getString("driverClass");
		url = rb.getString("url");
		username = rb.getString("username");
		password = rb.getString("password");
		try {
		    //Class.forName(driverClass);
			Class.forName("com.mysql.jdbc.Driver");  
			//com.mysql.jdbc.Driver driver = new com.mysql.jdbc.Driver();   
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}	
	//
	public static Connection getConnection() throws Exception{
		System.out.println("cheng");
		return DriverManager.getConnection(url, username, password);
		
	}
	//
		public static void closeAll(ResultSet rs,Statement stmt,Connection conn){
			//
			if(rs!=null){
				try {
					rs.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				rs = null;
			}
			if(stmt!=null){
				try {
					stmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				stmt = null;
			}
			if(conn!=null){
				try {
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				conn = null;
			}
		}
	}


