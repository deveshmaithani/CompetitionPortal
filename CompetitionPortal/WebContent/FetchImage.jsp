<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.io.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" dir="ltr">
  <head>
  </head>
<body>
<%
OutputStream img;
   try{
	   java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/competitionPortal","root","12345");
		Statement st= con.createStatement();
		String sql ="select * from image where id= 3";

	    ResultSet rs = st.executeQuery(sql);
	    while(rs.next())
	    {	    	
%>
	<form id="MyForm" action="ShowImage" method="post" >
	<table width="450px">
	<tr>
	<td>
	<label><b>Name</b></label>   </td>
	<td>       
	<input type="text" name="user_name" size="30" maxlength="50" value=<%=rs.getString("user_name")%>></input>
	</td>
	</tr>
	<tr>
	<td>
	<label><b>Course</b></label>  </td> 
	<td>      
	<input type="text" name="course" size="30" maxlength="50" value=<%=rs.getString("course")%>></input>
	</td>
	</tr>
	<tr>
	<td>
	<label><b>Contest Title</b></label>  </td>
	<td>
	<input type="text" name="contest_type" size="30" maxlength="50" value=<%=rs.getString("contest_type")%>></input>
	</td>
	</tr>
	<tr>
	<td>
	<label><b>Email</b></label> </td>
	<td>      
	<input type="text" name="email" size="30" maxlength="50" value=<%=rs.getString("email")%>></input>
	</td>
	</tr>
	<tr>
	<td>
	<img src="data:image/jpg;base64,${photo.base64Image}" name="image" width="400" height="300"></img>
	</td>
	</tr>
	</table>
	</form>
	<% 	    	
   }
 }
catch(Exception e){ 
e.printStackTrace();
out.println("Error" +e.getMessage());
}
  
 %>
</body>
</html>