package com.tool;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.*;

//连接数据库，封装数据库操作的方法
public class Conndatabaseserver {

	public static Connection conn=null;
	public void getConnection()
	{
		try {			
			if(conn!=null)
				return;

	        //加载数据库驱动，注册到去送管理器
	        Class.forName("com.mysql.jdbc.Driver");
	        String url = "jdbc:mysql://localhost:3306/enterprice";
	        String username = "root";
	        String password = "qq134131";

	        conn = DriverManager.getConnection(url , username , password);
	        if (conn != null) 
	               System.out.println("数据库连接成功!");
	        else
	               System.out.println("数据库连接失败!");
	        //完成后记得关闭数据库连接
	        //conn.close();
	 } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	 } catch (SQLException e) {
	        e.printStackTrace();
	 }
	}
	
	public ResultSet executeQuery(String sql)
	{
		if(conn==null)
		{
			this.getConnection();
		}
		try {	
			
			Statement stm=conn.createStatement();
			ResultSet ret=stm.executeQuery(sql);
			System.out.println("Conndatabase:ret not null");
			return ret;
	 } catch (SQLException e) {
		    System.out.println("Conndatabase:exection");
	        e.printStackTrace();
	 }
		return null;
	}
	
	public int executeUpdate(String sql)
	{
		if(conn==null)
		{
			this.getConnection();
		}
		try {	
			
			Statement stm=conn.createStatement();
			return stm.executeUpdate(sql);
	 } catch (SQLException e) {
	        e.printStackTrace();
	        return -1;
	 }
		//return null;
	}
	
	public void close() {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			conn = null;
		}
	}
}
