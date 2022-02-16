<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Remove Book</title>

<style>
body {
font-family: Arial, Helvetica, sans-serif;
}

* {
box-sizing: border-box; 
}

/* Width of input fields */
#bn{
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

/* Add a background color when the inputs get focus */
#bn:focus {
  background-color: #ddd;
  outline: none;
}

/* Set a style for all buttons */
button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

button:hover {
  opacity:1;
}

/* Add padding to container elements */
.container {
  padding: 16px;
}

.back {
  z-index: 1; /* Sit on top */
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: #474e5d;
  padding-top: 50px;
}



/* Form Box */
.formBox {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 70%; 
}
</style>

</head>
<body>

<%
String username=(String)session.getAttribute("user");

if(username==null)
{
	out.println("Please log in");
	
%>

<jsp:include page="Login.html"></jsp:include>
<%
}

else
{
%>
  <div class="back">
  <form class="formBox" action="remove2.jsp" enctype="multipart/form-data">
  
    <div class="container">
      <h1>Remove Book</h1>
      <hr>
      
      <label><b>Book Name</b></label>
      <input type="text" placeholder="Enter Book Name" name="bn" id="bn" required pattern="[A-Za-z]{5,50}" title="5 to 50 characters, numbers not allowed">
      
      <div class="btn">
        <button type="submit" class="sub">Submit</button>
      </div>
   
    </div>
  </form>
</div>

<%
}
%>

</body>
</html>