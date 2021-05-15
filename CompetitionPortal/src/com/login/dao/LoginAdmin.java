package com.login.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginAdmin {
	
	String sql = "Select * from adminLogin where uname=? and pass=?";
	String url = "jdbc:mysql://localhost:3306/competitionPortal";
	String username = "root";
	String password = "12345";
	public boolean check(String uname,String pass)
	{
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,username,password);		
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, uname);
			st.setString(2, pass);	
			ResultSet rs = st.executeQuery();
			if(rs.next())
			{
				return true;
			}
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
	
	
	
}
