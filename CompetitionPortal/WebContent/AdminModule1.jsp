<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="adminModule1Style.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.1/css/all.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Dashboard</title>
</head>
<body>
      <!--wrapper start-->
        <div class="wrapper">
            <!--header menu start-->
            <div class="header">
                <div class="header-menu">
                    <div class="title">Competition  <span>Portal</span></div>
                    <div class="sidebar-btn">
                        <i class="fa fa-bars"></i>
                    </div>
                    <ul>
                        <li><a href="About.jsp"><i class="fa fa-power-off"></i></a></li>
                    </ul>
                </div>
            </div>
            <!--header menu end-->
            <!--sidebar start-->
            <div class="sidebar">
                <div class="sidebar-menu">
                    <center class="profile">
                        <img src="admin.jpg" alt="">
                        <p>Devesh</p>
                    </center>
                    <li class="item">
                        <a href="#" class="menu-btn">
                            <i class="fas fa-desktop"></i><span>Dashboard</span>
                        </a>
                    </li>
                    <li class="item" id="profile">
                        <a href="AdminGallery.jsp" class="menu-btn">
                            <i class="fas fa-images"></i><span>Gallery</span>
                        </a>  
                    </li>
                    <li class="item" id="messages">
                        <a href="CreateContest.jsp" class="menu-btn">
                            <i class="fas fa-plus"></i><span>Create New</span>
                        </a>
                  
                    </li>
                    <li class="item" id="settings">
                        <a href="#settings" class="menu-btn">
                            <i class="fas fa-user-circle"></i><span>User Details <i class="fas fa-chevron-down drop-down"></i></span>
                        </a>
                        <div class="sub-menu">
                            <a href="Show_P_Details.jsp"><i class="fas fa-users"></i><span>Participants</span></a>
                            <a href="Show_V_Details.jsp"><i class="fas fa-poll"></i><span>Voter</span></a>
                        </div>
                    </li>
                    <li class="item">
                        <a href="#" class="menu-btn">
                            <i class="fas fa-trophy"></i><span>Winner</span>
                        </a>
                    </li>
                </div>
            </div>
            <!--sidebar end-->
        </div>
        <!--wrapper end-->

        <script type="text/javascript">
        $(document).ready(function(){
            $(".sidebar-btn").click(function(){
                $(".wrapper").toggleClass("collapse");
            });
        });
        </script>
</body>
</html>