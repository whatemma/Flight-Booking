<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sales Report</title>
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
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String sql = "select sum(r.BookingFee) 'booking fee', sum(r.CancelFee) 'cancel fee', sum(t.TotalFare) 'total fare', (sum(r.BookingFee)+sum(r.CancelFee)+sum(t.TotalFare)) total from DataProj.Reserve r join DataProj.Ticket t  on t.TIcket_ID = r.Ticket_no where month(r.Date) = '"+month+"' and year(r.Date) = '"+year+"'";

		ResultSet resultSet = stmt.executeQuery(sql);
		
		out.print("<table border = 1>");
		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		//print out column header
		out.print("Booking Fee");
		out.print("</td>");
		//make a column
		out.print("<td>");
		//depending on the radio button selection make a column header for Manufacturer if the beers table was selected and Address if the bars table was selected
		out.print("Cancellation Fee");
		out.print("</td>");
		out.print("<td>");
		//print out column header
		out.print("Total Fare");
		out.print("</td>");
		out.print("<td>");
		//print out column header
		out.print("Total Revenue");
		out.print("</td>");
		out.print("</tr>");

		//parse out the results
		while (resultSet.next()) {
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//Print out current bar or beer name:
			out.print(resultSet.getString("booking fee"));
			out.print("</td>");
			out.print("<td>");
			//Print out current bar/beer additional info: Manf or Address
				out.print(resultSet.getString("cancel fee"));
			out.print("</td>");
			out.print("<td>");
			//Print out current bar or beer name:
			out.print(resultSet.getString("total fare"));
			out.print("</td>");
			out.print("<td>");
			//Print out current bar or beer name:
			out.print(resultSet.getString("total"));
			out.print("</td>");
			out.print("</tr>");

		}
		out.print("</table>");
		
	} catch (Exception ex) {
		out.print(ex);
	}
%>
<a href="admin.jsp">Go back to admin home page</a>
</body>
</html>