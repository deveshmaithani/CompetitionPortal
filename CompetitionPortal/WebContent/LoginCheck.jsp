<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String uname=request.getParameter("uname");
String pass=request.getParameter("pass");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/competitionPortal","root","12345");
Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from Insert_RegistrationDetails where user_name='"+uname+"' and password='"+pass+"'");
try{
rs.next();
if(rs.getString("password").equals(pass)&&rs.getString("user_name").equals(uname))
{
	RequestDispatcher rd=request.getRequestDispatcher("UserModule1.jsp");  
	rd.include(request, response);
}
else{
	RequestDispatcher rd=request.getRequestDispatcher("Start.jsp"); 
	rd.include(request, response);
	
}
}
catch (Exception e) {
e.printStackTrace();
}
%>