<!DOCTYPE html> 
<html> 
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
    <title>  </title> 
  
    <style type="text/css"> 
    	body > #bg{
		height: 100%;
		width: 100%;
		background-color: #C7C11A;
		clip-path: polygon(0 0, 100% 0, 100% 99%, 0 55%);
		position: absolute;
		z-index: -1;
		}
        body { 
            text-align: center; 
        } 
  
        h1 { 
            color: white; 
        } 
  
        /* Basic CSS to design table */ 
        table { 
            border-collapse: collapse; 
            width: 100%; 
        } 
  
        th, 
        td { 
            padding: 8px; 
            text-align: left; 
            border-bottom: 1px solid #ddd; 
        } 
  
        /* CSS command for the row to highlight */ 
        .highlight { 
            background-color: #b8b8b8; 
        } 
    </style> 
</head> 
  
<body> <div id="bg"></div>
    <h1>Welcome to Competition Portal</h1> 
  
    <h3> 
        Choose the contest 
        you want to participate in 
    </h3> 
  
    <table id="table_to_highlight" align="center" cellpadding="7" cellspacing="7" border="1">
<tr>

</tr>
<tr bgcolor="#A52A2A">
<td><b>Id</b></td>
<td><b>Title</b></td>
<td><b>Contest_type</b></td>
<td><b>Date</b></td>
<td><b>Last_Date</b></td>
<td><b>Description</b></td>
</tr>
<%
try{ 
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/competitionPortal","root","12345");
	Statement st= con.createStatement();
	String sql ="SELECT * FROM AddContest";

resultSet = st.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">

<td><%=resultSet.getString("id") %></td>
<td><%=resultSet.getString("title") %></td>
<td><%=resultSet.getString("contest_type") %></td>
<td><%=resultSet.getString("date") %></td>
<td><%=resultSet.getString("last_date") %></td>
<td><%=resultSet.getString("Description") %></td>

</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
  
    <script type="text/javascript"> 
  
        // JavaScript Code to Highlight any 
        // row in the given table. 
        document.getElementById('table_to_highlight') 
            .addEventListener('click', function (item) { 
  
                // To get tr tag  
                // In the row where we click 
                var row = item.path[1]; 
  
                var row_value = ""; 
  
                for (var j = 0; j < row.cells.length; j++) { 
  
                    row_value += row.cells[j].innerHTML; 
                    row_value += " | "; 
                } 
  
                alert(row_value);
                window.location.href = 'ImageUpload.jsp'; 
  
                // Toggle the highlight 
                if (row.classList.contains('highlight')) 
                    row.classList.remove('highlight'); 
                else 
                    row.classList.add('highlight'); 
            }); 
    </script> 
</body> 
  
</html> 