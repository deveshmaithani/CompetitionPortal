<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
*{
    margin: 0; padding:0; box-sizing: border-box;
    font-family: 'Montserrat', sans-serif;
}

.site-header {
    width: 100%;
    height: 100vh;
    background: #0f8a9d;
    background: linear-gradient(57deg, #00C6A7 , #1E4D92 ); 
    clip-path: polygon(0% 0%, 100% 0%, 100% 80%, 0% 100%);

}


nav{
    width: 100%; height: 100px;
    /*background-color:  red;*/
    display: flex; color: white;
    
}

.logo{
    width: 50%;
    height: 100px;
}

.logo h1{
    line-height: 100px;
    padding-left: 50px;
    text-transform: uppercase;
}

.menu{
    width: 50%; height: 100px;
}

.menu ul{
    width: 100%;
    height: 100px;
    display: flex;
    flex-direction: row;
    justify-content: space-around;
    align-items:  center;
}

.menu ul li{
	display: block;
    list-style: none;
    font-size: 15px;
    font-weight: bold;
    text-transform: uppercase;
}

section{ display: flex;  }

.leftside { width: 45%; height: auto; overflow: hidden; margin-top: 20px;}

.leftside img{  width: 600px;  height: 500px; }

.rightside{ width: 55%; height: 300px; color: white; text-align: center; margin-top: 80px; padding: 40px;}

.rightside h1{ text-align: center;
    color: #ffffff;
    font-size: 50px;
    font-weight: 900;
    text-transform: uppercase; } 

.rightside p {  
    font-size: 1.1rem; padding: 30px 0; }

.rightside button{   font-size: 17px;
    font-weight: 600;
    color: white;
    text-transform: uppercase;
    background: linear-gradient(57deg, #00C6A7 , #1E4D92 ); 
    border-radius: 4px 4px 4px 4px;
    padding: 20px 35px ; 
}
.menu ul li a{
	color:white;
	font-size: 17px;
	padding: 7px 13px;
	border-radius: 3px;
	text-decoration:none;
	
}
a.active, a:hover{
	background: #1b9bff;
	transition: .5s;
}


.rightside button:hover{
      background: linear-gradient(57deg, #1E4D92, #00C6A7 );   
}
</style>
</head>
<body>
	<header class="site-header clearfix">
 <nav>
  <div class="logo">
   <h1>Competition Portal</h1>
  </div>
  <div class="menu"> 
   <ul>
    <li><a class="active" href="UserModule1.jsp">Home</a></li>
    <li><a href="P_Register.jsp">Contest</a></li>
    <li><a href="V_Register.jsp">Go for Vote</a></li>
    <li><a href="#">Result</a></li>
   </ul>
  </div>
 </nav>
 <section>
  <div class="leftside"> 
   <img src="c_images.jpg">
  </div>
  <div class="rightside"> 
   <h1>Welcome To Competition Portal</h1>
  
   <a href="AdminGallery.jsp"><button>Welcome</button></a>
   <a href="UserAbout.jsp"><button>About Us</button></a>
  </div>
  
 </section>

</header>

</body>
</html>