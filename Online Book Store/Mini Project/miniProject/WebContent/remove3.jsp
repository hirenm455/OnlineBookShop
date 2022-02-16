<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Remove Book</title>

<style type="text/css">
body {font-family: Arial, Helvetica, sans-serif;}

/* background */
.back {
  z-index: 1; /* Sit on top */
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: #474e5d;
  padding-top: 60px;
}

/* Box */
.box {
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
  width: 95%;
  opacity: 0.9;
}

button:hover {
  opacity:1;
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
	int id=Integer.parseInt(request.getParameter("id")); 
	
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","","");
		
		
		PreparedStatement pstmt = conn.prepareStatement("delete from book where id='"+id+"'");
		
		pstmt.executeUpdate();
		
		%>
		<div class="back">
		<form class="box">
		<center><h1>Deleted successfully!!!!</h1></center>
		
		<div class="btn">
	        <center><a href="menu.jsp"><button type="button" class="ok">OK</button></a></center>
	    </div>
		</form>
		</div>
		<%
	}
	
	catch(Exception ex)
	{
		out.println("Something went wrong!!!");
	}
}
%>

</body>
</html>