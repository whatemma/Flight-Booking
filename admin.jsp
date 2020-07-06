<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Page</title>
</head>
<body>
Welcome to the Admin Page, please select which function you would like to use
<hr>
<br>
<!-- Text: Add, edit and delete for CustomerRep and Customer -->
Please specify the account you want to edit (fields that are left blank will stay the same)
<br>
<form method="post" action="editInfo.jsp">
	<table>
	<tr>
	<td>Old Username(Required)</td><td><input type="text" name="username1"></td>
	</tr>
	<tr>
	<td>New Username</td><td><input type="text" name="username2"></td>
	</tr>
	<tr>
	<td>Password</td><td><input type="text" name="password"></td>
	</tr>
	<tr>
	<td>Name (D to delete this info)</td><td><input type="text" name="name"></td>
	</tr>
	<tr>
	<td>Address (D to delete this info)</td><td><input type="text" name="address"></td>
	</tr>
	<tr>
	<td>Email (D to delete this info)</td><td><input type="text" name="email"></td>
	</tr>
	<tr>
	<td>Phone (D to delete this info)</td><td><input type="text" name="phone"></td>
	</tr>
	<tr>
	<td>User Type(CustomerRep or Customer)</td><td><input type="text" name="type"></td>
	</tr>
	</table>
	<input type="submit" value="Edit User Information">
	<br>
	<br>
	
	Delete Username<input type="text" name="delete">
	<input type="submit" value="Delete User">
	</form>
	
	<hr>
	<br>
	
<!-- usertype for the above form, add and delete information still needed -->

<!-- Select: Sales report for a particular month -->
Sales report for a particular month
<form method="post" action="salesreport.jsp">
	<table>
	<tr>
	<td>Year(e.g., 2019)</td><td><input type="text" name="year"></td>
	</tr>
	<tr>
	<td>Month(e.g., 08)</td><td><input type="text" name="month"></td>
	</tr>
	</table>
	<input type="submit" value="Generate Sales Report">
	</form>
	<hr>
	<br>

<!-- Text: List of reservation by flight number or customer-->
List of reservation
<form method="post" action="listofReservation.jsp">
	(e.g., UA295, DL166, DL189)
	<input type="text" name="flightno">
	<input type="submit" value="By Flight Number">
	<br>
	(e.g., user1, user2)
	<input type="text" name="username">
	<input type="submit" value="By Username">
</form>
<hr>
<br>

<!-- Text: Summary listing of revenue generated by particular flight, airline or customer -->
List of total revenue (including total fare, booking fee and cancellation fee)
<form method="post" action="listofRevenue.jsp">
	(e.g., DL166, UA295)
	<input type="text" name="flightno">
	<input type="submit" value="By Flight Number">
	<br>
	(e.g., DL, UA)
	<input type="text" name="airline">
	<input type="submit" value="By Airline">
	<br>
	(e.g., user1, user2)
	<input type="text" name="username">
	<input type="submit" value="By Username">
</form>
<hr>
<br>

<!-- Text: List of all flights for a given airport -->
List of flights (e.g., DTW, EWR, PVG, NRT)
<form method="post" action="listofFlightsbyAirport.jsp">
	<input type="text" name="airport">
	<input type="submit" value="By Airport">
</form>
<hr>
<br>

<!-- Radio Button: Most active flights or customer that generated most total revenue -->
Generate a list of:
<form method="post" action="producealistof.jsp">
  <input type="radio" name="command" value="flight"/>Most active flights
  <br>
  <input type="radio" name="command" value="customer"/>Customers with most revenue
  <br>
  <input type="submit" value="submit" />
</form>
<hr>
</body>
</html>