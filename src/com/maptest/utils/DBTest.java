package com.maptest.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class DBTest {
 /**
  * @param args
  */
 
 private static String url="jdbc:mysql://localhost:3306/testlighting";
 private static String name="root";
 private static String password="hadoop";
 
 public static void main(String[] args) throws Exception {
  // TODO Auto-generated method stub
 
 
  try {
   //������������
   Class.forName("com.mysql.jdbc.Driver");
   //������ݿ����ӣ�
   Connection conn=DriverManager.getConnection(url,name,password);
   //ͨ�����ݿ�����Ӳ������ݿ⣬ʵ����ɾ�Ĳ顣
   Statement stmt=conn.createStatement();
   ResultSet rs=stmt.executeQuery("select Longitude, Latitude from flash;");
   while(rs.next())
   {
    System.out.println(rs.getString("Longitude")+","+rs.getString("Latitude"));
   
   }
  } catch (ClassNotFoundException e) {
   e.printStackTrace();
  } catch (SQLException e) {
   e.printStackTrace();
  }
 
 }
}