<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<% String message = (String)request.getAttribute("alertMsg");%>
<%@page import="java.sql.*,java.util.*"%>

<%
String user_name=request.getParameter("user_name");
String password=request.getParameter("password");
String re_password=request.getParameter("re_password");
String email=request.getParameter("email");

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/competitionPortal", "root", "12345");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into Insert_RegistrationDetails(user_name,password,re_password,email)values('"+user_name+"','"+password+"','"+re_password+"','"+email+"')");
RequestDispatcher rd=request.getRequestDispatcher("Start.jsp");  
rd.include(request, response);
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>