<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List of Revenue</title>
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
		String flight = request.getParameter("flightno");
		String airline = request.getParameter("airline");
		String user = request.getParameter("username");
		String sql;
		if(flight.length() != 0){
			sql = "select a.Flight_no, (sum(r.BookingFee)+sum(r.CancelFee)+sum(t.TotalFare)) total from DataProj.Reserve r join DataProj.Associates a on r.Ticket_no = a.TicketID  join DataProj.Ticket t  on t.TIcket_ID = r.Ticket_no where a.Flight_no = '"+flight+"' group by a.Flight_no";
		}else if(airline.length() != 0){
			sql = "select a.CompanyID, (sum(r.BookingFee)+sum(r.CancelFee)+sum(t.TotalFare)) total from DataProj.Reserve r join DataProj.Associates a on r.Ticket_no = a.TicketID  join DataProj.Ticket t  on t.TIcket_ID = r.Ticket_no where a.CompanyID = '"+airline+"' group by a.CompanyID";
		}else{
			sql = "select r.Username, (sum(r.BookingFee)+sum(r.CancelFee)+sum(t.TotalFare)) total from DataProj.Reserve r join DataProj.Associates a on r.Ticket_no = a.TicketID  join DataProj.Ticket t  on t.TIcket_ID = r.Ticket_no where r.Username = '"+user+"' group by r.Username";
		}
		ResultSet resultSet = stmt.executeQuery(sql);
		out.print("<table border = 1>");
		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		//print out column header
		if(flight.length() != 0){
			out.print("Flight ID");
		}else if(airline.length() != 0){
			out.print("Company ID");
		}else{
			out.print("Username");
		}
		
		out.print("</td>");
		//make a column
		out.print("<td>");
		//depending on the radio button selection make a column header for Manufacturer if the beers table was selected and Address if the bars table was selected
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
			if(flight.length() != 0){
				out.print(resultSet.getString("Flight_no"));
			}else if(airline.length() != 0){
				out.print(resultSet.getString("CompanyID"));
			}else{
				out.print(resultSet.getString("Username"));
			}
			out.print("</td>");
			out.print("<td>");
			//Print out current bar or beer name:
			out.print(resultSet.getString("total"));
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