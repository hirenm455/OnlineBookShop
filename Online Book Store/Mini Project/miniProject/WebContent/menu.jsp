<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Menu Page</title>

<style>

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
	
	.circle{
		margin-top:2%;
		margin-left:39%;
	}
	
	.dot {
	  height: 200px;
	  width: 200px;
	  background-color: #27AE60    ;
	  border-radius: 50%;
	  display: inline-block;
	}
	
	h2{
		color:#ffffff;
		padding-top:35%;
	}
	
	/* Set a style for all buttons */
	button {
	  background-color: #C70039  ;
	  font-size:100%;
	  color: white;
	  padding: 14px 20px;
	  margin: 8px 0;
	  border: none;
	  cursor: pointer;
	  width: 30%;
	  opacity: 0.9
	}

	button:hover {
	  opacity:1;
	}
	
	#add{
		top:10%;
		margin-left:35%;	
	}
	
	#search{
		margin-top:-13%;
		margin-right:5%;
		float:right;
	}
	
	#update{
		margin-top:3%;
		margin-left:35%;
		margin-bottom:5%;
	}
	
	#delete{
		margin-top:-26.1%;
		margin-left:5%;
		float:left;
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
	  <div class="box">
	  	<center><h1>Welcome</h1></center>
	  	
	  	<a href="add.jsp"><button type="button" id="add">Add Book</button></a>
	  	
	  	<div class="circle">
		<span class="dot">
			<center><h2>Menu</h2></center>
		</span>
		</div>
		
		<a href="search.jsp"><button type="button" id="search">Search Book </button></a>
		<a href="update.jsp"><button type="button" id="update">Update Book Details</button></a>
		<a href="remove.jsp"><button type="button" id="delete">Remove Book </button></a>
		
		
		</div>
	</div>


<%
}
%>
</body>
</html>