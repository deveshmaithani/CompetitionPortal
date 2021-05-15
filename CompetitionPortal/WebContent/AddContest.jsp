<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<% String message = (String)request.getAttribute("alertMsg");%>
<%@page import="java.sql.*,java.util.*"%>

<%
String title=request.getParameter("title");
String contest_type=request.getParameter("contest_type");
String date=request.getParameter("date");
String ldate=request.getParameter("ldate");
String description=request.getParameter("description");

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/competitionPortal", "root", "12345");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into AddContest (title,contest_type,date,last_date,description)values('"+title+"','"+contest_type+"','"+date+"','"+ldate+"','"+description+"')");
RequestDispatcher rd=request.getRequestDispatcher("AdminModule1.jsp");  
rd.include(request, response);
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>