<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List of Flights</title>
</head>
<body>
	<%
	try {
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters from the HTML form at the HelloWorld.jsp
		String airport = request.getParameter("airport");
		String sql = "select d.Company_ID, d.FlightID from DataProj.Departs d where d.airportID = '"+airport+"'";
		
		ResultSet resultSet = stmt.executeQuery(sql);
		out.print("<table border = 1>");
		out.print("Flights that departs from this airport");
		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		//print out column header
		out.print("Company ID");
		out.print("</td>");
		//make a column
		out.print("<td>");
		//depending on the radio button selection make a column header for Manufacturer if the beers table was selected and Address if the bars table was selected
		out.print("Flight ID");
		out.print("</td>");
		out.print("</tr>");

		//parse out the results
		while (resultSet.next()) {
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//Print out current bar or beer name:
			out.print(resultSet.getString("Company_ID"));
			out.print("</td>");
			out.print("<td>");
			//Print out current bar/beer additional info: Manf or Address
				out.print(resultSet.getString("FlightID"));
			out.print("</td>");
			out.print("</tr>");

		}
		out.print("</table>");
		String sql2 = "select a.COmpanyID, a.Flight_no from DataProj.Arrives a where a.AirportID = '"+airport+"'";
		
		ResultSet result = stmt.executeQuery(sql2);
		out.print("<table border = 1>");
		out.print("Flights that arrives at this airport");
		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		//print out column header
		out.print("Company ID");
		out.print("</td>");
		//make a column
		out.print("<td>");
		//depending on the radio button selection make a column header for Manufacturer if the beers table was selected and Address if the bars table was selected
		out.print("Flight ID");
		out.print("</td>");
		out.print("</tr>");

		//parse out the results
		while (result.next()) {
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//Print out current bar or beer name:
			out.print(result.getString("COmpanyID"));
			out.print("</td>");
			out.print("<td>");
			//Print out current bar/beer additional info: Manf or Address
				out.print(result.getString("Flight_no"));
			out.print("</td>");
			out.print("</tr>");

		}
		out.print("</table>");
		con.close();
	} catch (Exception ex) {
		out.print(ex);
	}
%>
<a href="admin.jsp">Go back to admin home page</a>
</body>
</html>