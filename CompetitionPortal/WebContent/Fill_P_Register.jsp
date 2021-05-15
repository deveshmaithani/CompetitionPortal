<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<% String message = (String)request.getAttribute("alertMsg");%>
<%@page import="java.sql.*,java.util.*"%>

<%
String user_name=request.getParameter("user_name");
String course=request.getParameter("course");
String contest_type=request.getParameter("contest_type");
String gender=request.getParameter("gender");
String phone=request.getParameter("phone");
String email=request.getParameter("email");

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/competitionportal", "root", "12345");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into P_Details (user_name,course,contest_type,gender,phone,email)values('"+user_name+"','"+course+"','"+contest_type+"','"+gender+"','"+phone+"','"+email+"')");
RequestDispatcher rd=request.getRequestDispatcher("ImageUpload.jsp");  
rd.include(request, response);
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>