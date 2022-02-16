<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Validating User</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%
try
{
	String un=request.getParameter("uname");
	String psw=request.getParameter("psw");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","","");
	PreparedStatement pst=conn.prepareStatement("select userName,password from reg where userName=? and password=?");
	pst.setString(1,un);
	pst.setString(2,psw);
	
	ResultSet rs=pst.executeQuery();
	
	if(rs.next())
	{
		session.setAttribute("user",un);
%>

<jsp:forward page="menu.jsp"/>

<%
	}
	
	else
	{
		out.println("Invalid Login");
%>

<jsp:include page="Login.html"/>

<%
	}
}

catch(Exception e)
{
	out.println("Something went wrong!! Please try again "+e);
}
%>
</body>
</html>