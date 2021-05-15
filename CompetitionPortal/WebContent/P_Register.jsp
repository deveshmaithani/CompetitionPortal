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
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>  
body{  
  font-family: Calibri, Helvetica, sans-serif;  
  background-color: pink;  
}  
.container {  
    padding: 50px;  
  background-color: rgb(134, 177, 221);  
}  
.container h1 {
font-size: 40px;
font-style: oblique;
color: rgb(247, 244, 101);
}

input[type=text]{  
  width: 100%;  
  padding: 15px;  
  margin: 5px 0 22px 0;  
  display: inline-block;  
  border: none;  
  background: #f1f1f1;  
}  
input[type=text]:focus{  
  background-color: orange;  
  outline: none;  
}  
 div {  
            padding: 10px 0;  
         }  
hr {  
  border: 1px solid #f1f1f1;  
  margin-bottom: 25px;  
}  
.registerbtn {  
  background-color: #4CAF50;  
  color: white;  
  font-size: 25px;
  padding: 16px 20px;  
  margin: 8px 0;  
  border: none;  
  cursor: pointer;  
  width: 100%;  
  opacity: 0.9;  
}  
.registerbtn:hover {  
  opacity: 1;  
}  
</style>  
</head>  
<body>  
<form name="MyForm" action="Fill_P_Register.jsp" method="post">  
  <div class="container">  
  <center><h1> We Need Some Information About You!!</h1></center>
  <hr>  
  <label><b> Name</b> </label>   
<input type="text" placeholder= "Name" size="15" name="user_name" required />   
<div>  
<label>   
<b>Course : </b> 
</label>   

<select name="course">  
<option value="Course" >Course</option>  
<option value="BCA" >BCA</option>  
<option value="BBA" >BBA</option>  
<option value="B.Tech" >B.Tech</option>  
<option value="MBA" >MBA</option>  
<option value="MCA" >MCA</option>  
<option value="M.Tech" >M.Tech</option>  
</select>  
</div>  
<div>  
    <label>   
  <b>Contest : </b> 
    </label>   
      
 <select name="contest_type"> 
 <option>Select Contest</option>   
 <%
   try{
	   java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/competitionPortal","root","12345");
		Statement st= con.createStatement();
		String sql ="select title from AddContest";

	    ResultSet rs = st.executeQuery(sql);
	    while(rs.next())
	    {
 		%>
	    	<option><%=rs.getString("title")%></option>
	<% 	    	
	    }
   	  }
    catch(Exception e){ 
	 e.printStackTrace();
	 out.println("Error" +e.getMessage());
 	}
%>   
</select>  
    </div>  
<div>  
<label>   
<b>Gender :</b>  
</label><br>  
<input type="radio" value="Male" name="gender" checked > Male   
<input type="radio" value="Female" name="gender"> Female   
<input type="radio" value="Other" name="gender"> Other  
  
</div>  
<label>   
<b>Phone : </b> 
</label>  
<input type="text" name="phone" placeholder="Country Code"  value="+91" size="2"/>       
 <label for="email"><b>Email</b></label>  
 <input type="text" placeholder="Enter Email" name="email" required>   
    <button type="submit" class="registerbtn"><b>Register</b></button>    
</form>  
</body>
</html>