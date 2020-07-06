<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Log-In Page</title>
</head>
<body>

Hello! Please log in below:
<br>
	<form method="post" action="signInAccount.jsp">
	<table>
	<tr>    
	<td>Username</td><td><input type="text" name="username"></td>
	</tr>
	<tr>
	<td>Password</td><td><input type="text" name="password"></td>
	</tr>
	</table>
	<input type="submit" value="Sign-In">
	</form>
<br>


Or, if do not already have an account, create one below:
<br>
	<form method="post" action="createAccount.jsp">
	<table>
	<tr>    
	<td>Username</td><td><input type="text" name="username"></td>
	</tr>
	<tr>
	<td>Password</td><td><input type="text" name="password"></td>
	</tr>
	</table>
	<select name="usertype" size=1>
			<option value="Customer">Customer</option>
			<option value="CustomerRep">Customer Representative</option>
	</select>
	<br> 
	<input type="submit" value="Create Account">
	</form>
	
<br>

</body>
</html>