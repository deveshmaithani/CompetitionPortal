
<%@ page import="java.sql.*"%>

<%@ page import="java.io.*"%>

<%

String user_name=request.getParameter("user_name");
String course=request.getParameter("course");
String contest_type=request.getParameter("contest_type");
String email=request.getParameter("email");

Connection con=null;

ResultSet rs=null;

PreparedStatement psmt=null;

FileInputStream fis;

String url="jdbc:mysql://192.168.10.13:3306/competitionportal";

try{

Class.forName("com.mysql.jdbc.Driver").newInstance();

con=DriverManager.getConnection(url,"root","12345");

File image=new File("photo");

psmt=con.prepareStatement("insert into Image(user_name,course,contest_type,email,photo) values(?,?,?,?,?)");

psmt.setString(1,"username");

psmt.setString(2,"course");
psmt.setString(3,"contest_type");
psmt.setString(4,"email");

fis=new FileInputStream(image);

psmt.setBinaryStream(5, (InputStream)fis, (int)(image.length()));

int s = psmt.executeUpdate();

if(s>0) {

%>

<b><font color="Blue">

<% out.println("Image Uploaded successfully !"); %>

</font></b>

<%

}

else {

out.println("unsucessfull to upload image.");

}

con.close();

psmt.close();

}catch(Exception ex){

out.println("Error in connection : "+ex);

}

%>