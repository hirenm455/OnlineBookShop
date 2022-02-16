<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert registration details in mysql</title>
</head>
<body>

<%@ page import="java.sql.*" %>
<%
try
{
	String fn=request.getParameter("fn");
	String ln=request.getParameter("ln");
	String city=request.getParameter("city");
	int mob=Integer.parseInt(request.getParameter("mob"));
	String dob=request.getParameter("dob");
	String gen=request.getParameter("gender");
	String email=request.getParameter("email");
	String un=request.getParameter("un");
	String psw=request.getParameter("psw");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","","");
	PreparedStatement ps=conn.prepareStatement("insert into reg(firstName,lastName,city,phone,dob,gender,email,userName,password)values(?,?,?,?,?,?,?,?,?)");
    ps.setString(1,fn);
    ps.setString(2,ln);
    ps.setString(3,city);
    ps.setInt(4,mob);
    ps.setString(5,dob);
    ps.setString(6,gen);
    ps.setString(7,email);
    ps.setString(8,un);
    ps.setString(9,psw);

    ps.executeUpdate();
    
%>
<jsp:forward page="menu.jsp"/>

<%
}

catch(Exception e)
{
	out.println("Something went wrong!! Please try again "+e);
}
%>

</body>
</html>