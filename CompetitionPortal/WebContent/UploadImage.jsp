<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String driverName = "com.mysql.jdbc.Driver";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <!-- Somehow I got an error, so I comment the title, just uncomment to show -->
    <!-- <title>Preview Image Before Upload | CodingNepal</title> -->
    
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
  </head>
  <body>
  <div id="bg"></div>
  <%
   try{
	   java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/competitionPortal","root","12345");
		Statement st= con.createStatement();
		String sql ="select user_name, course, contest_type, email from P_Details where id = (select max(id) from P_Details)";

	    ResultSet rs = st.executeQuery(sql);
	    while(rs.next())
	    {	    	
%>
	<form action="ImageIntoDB" method="post" enctype="multipart/form-data">
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
	<input type="text" name="email" size="30" maxlength="50"value=<%=rs.getString("email")%>></input>
	</td>
	</tr>
	 <tr>
     <td><b>Portrait Image</b></td>
     <td>
     <input type="file" name="photo" size="50"/>
     </td>
     </tr>
     <tr>
     <td><input type="submit" value="submit"></input>
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