<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book Details</title>

<style>
body {
font-family: Arial, Helvetica, sans-serif;
}

* {
box-sizing: border-box; 
}

/* Width of labels that show details */
.details{
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}


/* Set a style for all buttons */
button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 95%;
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

/* Set a style for all buttons */
button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9
}

button:hover {
  opacity:1;
}

/* Styles for the remove button */
.sub {
  padding: 14px 20px;
  background-color: #f44336;
}

/* Float remove and back buttons and add an equal width */
.sub, .ok {
  float: left;
  width: 50%;
}

.btn::after {
  content: "";
  clear: both;
  display: table;
}

#ID{
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

</style>
</head>
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
  <form class="formBox" action="remove3.jsp">
  
    <div class="container">
      <h1>Book Details</h1>
      <hr>
     
   <%   
   String bn=request.getParameter("bn");
   
      try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","","");
		
		Statement smt=conn.createStatement();
        ResultSet rs=smt.executeQuery("select id,bookName,authorName,isbnNum,price,bookCover from book where bookName like '%"+bn+"%'");

        int i = 0;
        
        if(rs.next())
        {
        	%>
        	
        	<label><b>Id</b></label>
	     	<input type="text" name="id" value="<%=rs.getInt("id")%>" id="ID" readonly>
 
        	<label><b>Book Name</b></label>
        	<br><label class="details"><%=rs.getString("bookName")%></label>
        	
        	<label><b>Author Name</b></label>
        	<br><label class="details"><%=rs.getString("authorName")%></label>
        	
        	<label><b>ISBN Number</b></label>
        	<br><label class="details"><%=rs.getInt("isbnNum")%></label>
        	
        	<label><b>Price</b></label>
        	<br><label class="details"><%=rs.getInt("price")%></label>
        	
        	<label><b>Book Cover</b></label>
		    <br><img src="<%=rs.getString("bookCover")%>"/> 
       	  
       	  <div class="btn">
          <button type="submit" class="sub">Remove</button>
	      <a href="menu.jsp"><button type="button" class="ok">Back</button></a>
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