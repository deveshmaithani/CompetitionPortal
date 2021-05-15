<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<head>
<link rel="stylesheet" type="text/css" href="P_DetailsStyle.css"></head>
<body>
<div id="bg"></div>
</body>
<h1 align="center"><font><strong>Participants  Details</strong></font></h1>
<table align="center" cellpadding="7" cellspacing="7" border="1">
<tr>

</tr>
<tr bgcolor="#A52A2A">
<td><b>Id</b></td>
<td><b>User_Name</b></td>
<td><b>Course</b></td>
<td><b>Contest_Type</b></td>
<td><b>Gender</b></td>
<td><b>Phone_No</b></td>
<td><b>Email</b></td>
</tr>
<%
try{ 
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/competitionPortal","root","12345");
	Statement st= con.createStatement();
	String sql ="SELECT * FROM P_Details";

resultSet = st.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">

<td><%=resultSet.getString("id") %></td>
<td><%=resultSet.getString("user_name") %></td>
<td><%=resultSet.getString("course") %></td>
<td><%=resultSet.getString("contest_type") %></td>
<td><%=resultSet.getString("gender") %></td>
<td><%=resultSet.getString("phone") %></td>
<td><%=resultSet.getString("email") %></td>

</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>