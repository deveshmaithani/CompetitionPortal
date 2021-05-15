<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<% String message = (String)request.getAttribute("alertMsg");%>
<%@page import="java.sql.*,java.util.*"%>

<%
String user_name=request.getParameter("user_name");
String course=request.getParameter("course");
String gender=request.getParameter("gender");
String phone=request.getParameter("phone");
String email=request.getParameter("email");

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/competitionPortal", "root", "12345");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into V_Details (user_name,course,gender,phone,email)values('"+user_name+"','"+course+"','"+gender+"','"+phone+"','"+email+"')");
RequestDispatcher rd=request.getRequestDispatcher("Start.jsp");  
rd.include(request, response);
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>