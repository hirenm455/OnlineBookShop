<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Book Details</title>
</head>

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
#bn,#an,#isbn,#price,#path,#ID,#oldPath{
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
<body>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*"%> 
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
  <form class="formBox" action="update3.jsp" enctype="multipart/form-data">
  
    <div class="container">
      <h1>Update Book Details</h1>
      <hr>
      
      
       <%   
	   String bn=request.getParameter("bn");
	   
	      try
		{
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","","");
			
			Statement smt=conn.createStatement();
	        ResultSet rs=smt.executeQuery("select id,bookName,authorName,isbnNum,price,bookCover from book where bookName like '%"+bn+"%'");
	
	     if(rs.next())
	     {
	        	
	        	
	     %>
	     
	     <label><b>Id</b></label>
	     <input type="text" name="id" value="<%=rs.getInt("id")%>" id="ID" readonly>
	     
	     <label><b>Book Name</b></label>
	      <input type="text" value="<%=rs.getString("bookName")%>" name="bn" id="bn" required pattern="[A-Za-z]{5,50}" title="5 to 50 characters, numbers not allowed">
	      
	      <label><b>Author Name</b></label>
	      <input type="text" value="<%=rs.getString("authorName")%>" name="an" id="an" required pattern="[A-Za-z]{3,20}" title="3 to 20 characters, numbers not allowed">
	      
	      
	      <label><b>ISBN Number</b></label>
	      <input type="number" value="<%=rs.getInt("isbnNum")%>" name="isbn" id="isbn" required pattern="^\d{10}$">
	      
	      
	      <label><b>Cost Price</b></label>
	      <input type="number" value="<%=rs.getInt("price")%>" name="price" id="price" required  pattern="^\d{30}$">
	      
		  <label><b>Old Path Of Image </b></label>
	      <input type="text" id="oldPath" name="oldPath" value="<%=rs.getString("bookCover")%>" readonly>
	      
		  <label class="fileContainer">
	      <input type="file" id="file" name="file" size="60" onchange="alertFilename()" />
	      <span class="cover"><b>Choose Book Cover</b></span>
	      <span id="fileName" ></span>
	      </label>
	      
	      <div class="btn">
	        <center><button type="submit" class="upd">Update</button></center>
	      </div>
		<%
		}
	     
	    else
	    {
	   		out.println("Book Not Found"); 	 
	    }
	}
	catch(Exception ex)
	{
		out.println("Something went wrong!!!");
	}
	%>
	
	</div>
	</form>
	</div>
<%
}
%>

</body>
</html>