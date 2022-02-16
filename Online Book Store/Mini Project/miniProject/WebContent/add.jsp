<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Book Page</title>

<script>
    function alertFilename() {
    var thefile = document.getElementById('file');
    document.getElementById('fileName').innerHTML =  thefile.value; }
</script>

<style>
body {
font-family: Arial, Helvetica, sans-serif;
}

* {
box-sizing: border-box; 
}

/* Width of input fields */
#bn,#an,#isbn,#price,#file{
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

/* Add a background color when the inputs get focus */
#bn:focus,#an:focus,#isbn:focus,#price:focus {
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
  width: 80%;
  opacity: 0.9;
}

button:hover {
  opacity:1;
}

/* Styles for the reset button */
.rest {
  padding: 14px 20px;
  background-color: #f44336;
}

/* Float reset and submit buttons and add an equal width */
.rest, .sub {
  float: left;
  width: 50%;
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



.btn::after {
  content: "";
  clear: both;
  display: table;
}

.cover{
    padding: 10px;
    border: 1px solid #ccc;
    cursor: pointer;
    background: #2471A3; 
    margin: 5px 0 22px 0;
  	display: inline-block;
  	color: #fff;
  	opacity: 0.9;
  } 

    
.cover:hover {
  opacity:1;
}

#fileName{
  width:78.5%;
  padding: 10px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

#file{
    display: none;
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
  <form class="formBox" action="add2.jsp" enctype="multipart/form-data">
  
    <div class="container">
      <h1>Add Book Details</h1>
      <hr>
      
      <label><b>Book Name</b></label>
      <input type="text" placeholder="Enter Book Name" name="bn" id="bn" required pattern="[A-Za-z]{5,50}" title="5 to 50 characters, numbers not allowed">
      
      <label><b>Author Name</b></label>
      <input type="text" placeholder="Enter Author Name" name="an" id="an" required pattern="[A-Za-z]{3,20}" title="3 to 20 characters, numbers not allowed">
      
      
      <label><b>ISBN Number</b></label>
      <input type="number" placeholder="Enter ISBN Number" name="isbn" id="isbn" required pattern="^\d{10}$">
      
      
      <label><b>Cost Price</b></label>
      <input type="number" placeholder="Enter Cost Price" name="price" id="price" required  pattern="^\d{30}$">
      
      <label class="fileContainer">
      <input type="file" id="file" name="file" size="60" onchange="alertFilename()" />
      <span class="cover"><b>Choose Book Cover</b></span>
      <span id="fileName">No file selected</span>
      </label>


      <div class="btn">
        <button type="reset" class="rest">Reset</button>
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