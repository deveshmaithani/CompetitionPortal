<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
* {
  box-sizing: border-box;
}
body > #bg{
	height: 100%;
	width: 100%;
	background-color: #3DBE29;
	clip-path: polygon(53% 0, 100% 0, 100% 50%, 10% 100%, 0 100%,0 21%);
	position: absolute;
	z-index: -1;
}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}
</style>
</head>
<body>
<div id="bg"></div>
	<h1>Create   Contest</h1>

<div class="container">
  <form name="MyForm" action="AddContest.jsp" method="post">
    <div class="row">
      <div class="col-25">
        <label for="fname">Title</label>
      </div>
      <div class="col-75">
        <input type="text" id="fname" name="title" placeholder="title..">
      </div>
    </div>
     <div class="row">
      <div class="col-25">
        <label for="contest_type">Contest_Type</label>
      </div>
      <div class="col-75">
        <select id="contest" name="contest_type">
          <option value="photo">Photography</option>
          <option value="poster">Poster</option>
          <option value="essay">Essay</option>
        </select>
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="lname">Date</label>
      </div>
      <div class="col-75">
        <input type="date" id="lname" name="date">
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="ldate">Last Date</label>
      </div>
      <div class="col-75">
        <input type="date" id="ldate" name="ldate">
      </div>
    </div>
   
    <div class="row">
      <div class="col-25">
        <label for="subject">Description</label>
      </div>
      <div class="col-75">
        <textarea id="subject" name="description" placeholder="Write something.." style="height:200px"></textarea>
      </div>
    </div>
    <div class="row">
      <input type="submit" value="Create">
    </div>
  </form>
</div>
	
</body>
</html>