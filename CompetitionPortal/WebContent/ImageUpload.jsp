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
    
    <!-- Somehow I got an error, so I comment the title, just uncomment to show -->
    <!-- <title>Preview Image Before Upload | CodingNepal</title> -->
    <link rel="stylesheet" href="ImageUploadStyle.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <style>
      .button {
        display: inline-block;
        width: 100%;
    	height: 50px;
    	border: none;
    	outline: none;
    	border-radius: 25px;
    	color: #fff;
    	font-size: 18px;
    	font-weight: 500;
    	letter-spacing: 1px;
    	text-transform: uppercase;
    	cursor: pointer;
    	background: linear-gradient(135deg,#3a8ffe 0%,#9658fe 100%);
    	margin: 5px;
    	transition-duration:.60s;
      }
     .button:hover
	    {
		box-shadow: 0 5px 10px rgba(0,0,0,.5);
		transform: scale(.95);
		}
    </style>
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
	<form action="./SaveImageIntoDB" method="post" enctype="multipart/form-data">
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
     <input type="file" name="image" >
     </td>
     </tr>
     <tr>
     <td><input type="submit" class="button" value="submit"></input>
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
 
 <br>
 <br>
    <div class="container">
      <div class="wrapper">
        <div class="image">
          <img src="" alt="">
        </div>
<div class="content">
          <div class="icon">
<i class="fas fa-cloud-upload-alt"></i></div>
<div class="text">
No file chosen, yet!</div>
</div>
<div id="cancel-btn">
<i class="fas fa-times"></i></div>
<div class="file-name">
File name here<input type="file" name="image" size="50"/></div>
</div>
<button onclick="defaultBtnActive()" id="custom-btn">Choose a file</button>
      <input id="default-btn" type="file" hidden>
<button onclick="defaultBtnActive3()" id="custom-btn2">Details</button>
    </div>

<script>
	  const MyForm = document.getElementById("MyForm");
      const wrapper = document.querySelector(".wrapper");
      const fileName = document.querySelector(".file-name");
      const defaultBtn = document.querySelector("#default-btn");
      const customBtn = document.querySelector("#custom-btn");
      const cancelBtn = document.querySelector("#cancel-btn i");
      const img = document.querySelector("img");
      let regExp = /[0-9a-zA-Z\^\&\'\@\{\}\[\]\,\$\=\!\-\#\(\)\.\%\+\~\_ ]+$/;
      function defaultBtnActive(){
        defaultBtn.click();
      }
      function defaultBtnActive2(){
          defaultBtn2.click();
        }
      defaultBtn.addEventListener("change", function(){
        const file = this.files[0];
        if(file){
          const reader = new FileReader();
          reader.onload = function(){
            const result = reader.result;
            img.src = result;
            wrapper.classList.add("active");
          }
          cancelBtn.addEventListener("click", function(){
            img.src = "";
            wrapper.classList.remove("active");
          })
          reader.readAsDataURL(file);
        }
        if(this.value){
          let valueStore = this.value.match(regExp);
          fileName.textContent = valueStore;
          
        }
      });
      
      function defaultBtnActive3(){
    	  window.location.href = "Show_Contest.jsp";
      }
      
    </script>

  </body>
</html>