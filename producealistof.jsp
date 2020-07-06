<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Produce List of</title>
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
		String entity = request.getParameter("command");
		String sql;
		if(entity.equals("flight")){
			sql = "select temp.b, temp.Tsold from DataProj.Associates a, (select a.Flight_no b, count(*) Tsold from DataProj.Reserve r join DataProj.Associates a on r.Ticket_no = a.TicketID group by a.Flight_no) temp where temp.Tsold in (select max(temp.Tsold) from (select a.Flight_no, count(*) Tsold from DataProj.Reserve r join DataProj.Associates a on r.Ticket_no = a.TicketID group by a.Flight_no) temp) group by temp.b";
		}else{
			sql = "select * from (select r.Username, (sum(r.BookingFee)+sum(r.CancelFee)+sum(t.TotalFare)) total from DataProj.Reserve r join DataProj.Associates a on r.Ticket_no = a.TicketID join DataProj.Ticket t  on t.TIcket_ID = r.Ticket_no group by r.Username) temp where temp.total in (select max(temp.total) from (select r.Username, (sum(r.BookingFee)+sum(r.CancelFee)+sum(t.TotalFare)) total from DataProj.Reserve r join DataProj.Associates a on r.Ticket_no = a.TicketID join DataProj.Ticket t  on t.TIcket_ID = r.Ticket_no group by r.Username) temp)";
		}
		ResultSet resultSet = stmt.executeQuery(sql);
		out.print("<table border = 1>");
		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		//print out column header
		if(entity.equals("flight")){
			out.print("Flight ID");
		}else{
			out.print("Username");
		}
		
		out.print("</td>");
		//make a column
		out.print("<td>");
		//depending on the radio button selection make a column header for Manufacturer if the beers table was selected and Address if the bars table was selected
		if(entity.equals("flight")){
			out.print("Ticket Sold");
		}else{
			out.print("Total Revenue");
		}		out.print("</td>");
		out.print("</tr>");

		//parse out the results
		while (resultSet.next()) {
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//Print out current bar or beer name:
			if(entity.equals("flight")){
				out.print(resultSet.getString("temp.b"));
			}else{
				out.print(resultSet.getString("Username"));
			}
			out.print("</td>");
			out.print("<td>");
			//Print out current bar or beer name:
			if(entity.equals("flight")){
				out.print(resultSet.getString("temp.Tsold"));
			}else{
				out.print(resultSet.getString("total"));
			}
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