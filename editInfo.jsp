<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Info Edit</title>
</head>
<body>
	<%
	try {
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters from the HTML form at the index.jsp
		String oldName = request.getParameter("username1");
		String newName = request.getParameter("username2");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String type = request.getParameter("type");
		String query;
		//Make an insert statement for the Sells table:
		String orig = "select * from DataProj.User where Username = '"+oldName+"'";
		ResultSet resultSet = stmt.executeQuery(orig);
		out.print("<table border = 1>");
		out.println("User Information Before Edit");
		out.print("<tr>");
		out.print("<td>");
		out.print("Username");
		out.print("</td>");
		out.print("<td>");
		out.print("Password");
		out.print("</td>");
		out.print("<td>");
		out.print("User Type");
		out.print("</td>");
		out.print("<td>");
		out.print("Name");
		out.print("</td>");
		out.print("<td>");
		out.print("Address");
		out.print("</td>");
		out.print("<td>");
		out.print("Email");
		out.print("</td>");
		out.print("<td>");
		out.print("Phone Number");
		out.print("</td>");
		out.print("</tr>");
		
		while (resultSet.next()) {
			out.print("<tr>");
			out.print("<td>");
			out.print(resultSet.getString("Username"));
			out.print("</td>");
			out.print("<td>");
			out.print(resultSet.getString("Password"));
			out.print("</td>");
			out.print("<td>");
			out.print(resultSet.getString("Usertype"));
			out.print("</td>");
			out.print("<td>");
			out.print(resultSet.getString("Name"));
			out.print("</td>");
			out.print("<td>");
			out.print(resultSet.getString("Address"));
			out.print("</td>");
			out.print("<td>");
			out.print(resultSet.getString("Email"));
			out.print("</td>");
			out.print("<td>");
			out.print(resultSet.getString("Phone"));
			out.print("</td>");
			out.print("</tr>");
		}
		
		if(newName.length() != 0){
			query = "update DataProj.User set Username = ? where Username = ?";
			PreparedStatement smth = con.prepareStatement(query);
			smth.setString(1, newName);
		    smth.setString(2, oldName);
		    smth.executeUpdate();
		}
		//if input password is not left empty and the new username stays the same
		if(password.length() != 0){
			if(newName.length() != 0){
				query = "update DataProj.User set Password = ? where Username = ?";
				PreparedStatement smth = con.prepareStatement(query);
				smth.setString(1, password);
			    smth.setString(2, newName);		
			    smth.executeUpdate();
			}else{
				query = "update DataProj.User set Password = ? where Username = ?";
				PreparedStatement smth = con.prepareStatement(query);
				smth.setString(1, password);
			    smth.setString(2, oldName);
			    smth.executeUpdate();
			}
		}
		if(name.length() != 0){
			if(newName.length() != 0){
				if(name.equals("D")){
					query = "update DataProj.User set Name = '' where Username = ?";
					PreparedStatement smth = con.prepareStatement(query);
					smth.setString(1, newName);
				    smth.executeUpdate();
				}else{
					query = "update DataProj.User set Name = ? where Username = ?";
					PreparedStatement smth = con.prepareStatement(query);
					smth.setString(1, name);
				    smth.setString(2, newName);
				    smth.executeUpdate();
				}
			}else{
				if(name.equals("D")){
					query = "update DataProj.User set Name = '' where Username = ?";
					PreparedStatement smth = con.prepareStatement(query);
					smth.setString(1, oldName);
				    smth.executeUpdate();
				}else{
					query = "update DataProj.User set Name = ? where Username = ?";
					PreparedStatement smth = con.prepareStatement(query);
					smth.setString(1, name);
				    smth.setString(2, oldName);
				    smth.executeUpdate();
				}
			}
		}
		if(address.length() != 0){
			if(newName.length() != 0){
				if(address.equals("D")){
					query = "update DataProj.User set Address = '' where Username = ?";
					PreparedStatement smth = con.prepareStatement(query);
					smth.setString(1, newName);
				    smth.executeUpdate();
				}else{
					query = "update DataProj.User set Address = ? where Username = ?";
					PreparedStatement smth = con.prepareStatement(query);
					smth.setString(1, address);
				    smth.setString(2, newName);
				    smth.executeUpdate();
				}
			}else{
				if(address.equals("D")){
					query = "update DataProj.User set Address = '' where Username = ?";
					PreparedStatement smth = con.prepareStatement(query);
					smth.setString(1, oldName);
				    smth.executeUpdate();
				}else{
					query = "update DataProj.User set Address = ? where Username = ?";
					PreparedStatement smth = con.prepareStatement(query);
					smth.setString(1, address);
				    smth.setString(2, oldName);
				    smth.executeUpdate();
				}
			}
		}
		if(email.length() != 0){
			if(newName.length() != 0){
				if(email.equals("D")){
					query = "update DataProj.User set Email = '' where Username = ?";
					PreparedStatement smth = con.prepareStatement(query);
					smth.setString(1, newName);
				    smth.executeUpdate();
				}else{
					query = "update DataProj.User set Email = ? where Username = ?";
					PreparedStatement smth = con.prepareStatement(query);
					smth.setString(1, email);
				    smth.setString(2, newName);
				    smth.executeUpdate();
				}
			}else{
				if(email.equals("D")){
					query = "update DataProj.User set Email = '' where Username = ?";
					PreparedStatement smth = con.prepareStatement(query);
					smth.setString(1, oldName);
				    smth.executeUpdate();
				}else{
					query = "update DataProj.User set Email = ? where Username = ?";
					PreparedStatement smth = con.prepareStatement(query);
					smth.setString(1, address);
				    smth.setString(2, oldName);
				    smth.executeUpdate();
				}
			}
		}
		if(phone.length() != 0){
			if(newName.length() != 0){
				if(phone.equals("D")){
					query = "update DataProj.User set Phone = '' where Username = ?";
					PreparedStatement smth = con.prepareStatement(query);
					smth.setString(1, newName);
				    smth.executeUpdate();
				}else{
					query = "update DataProj.User set Phone = ? where Username = ?";
					PreparedStatement smth = con.prepareStatement(query);
					smth.setString(1, phone);
				    smth.setString(2, newName);
				    smth.executeUpdate();
				}
			}else{
				if(phone.equals("D")){
					query = "update DataProj.User set Phone = '' where Username = ?";
					PreparedStatement smth = con.prepareStatement(query);
					smth.setString(1, oldName);
				    smth.executeUpdate();

				}else{
					query = "update DataProj.User set Phone = ? where Username = ?";
					PreparedStatement smth = con.prepareStatement(query);
					smth.setString(1, phone);
				    smth.setString(2, oldName);
				    smth.executeUpdate();
				}
			}
		}
		if(type.length() != 0){
			if(newName.length() != 0){
				query = "update DataProj.User set Usertype = ? where Username = ?";
				PreparedStatement smth = con.prepareStatement(query);
				smth.setString(1, type);
			    smth.setString(2, newName);
			    smth.executeUpdate();
			}else{
				query = "update DataProj.User set Usertype = ? where Username = ?";
				PreparedStatement smth = con.prepareStatement(query);
				smth.setString(1, type);
			    smth.setString(2, oldName);
			    smth.executeUpdate();
			}
		}
		String sql;
		if(newName.length()!= 0){
			sql = "select * from DataProj.User where Username = '"+newName+"'";
		}else{
			sql = "select * from DataProj.User where Username = '"+oldName+"'";
		}
		ResultSet resultSet2 = stmt.executeQuery(sql);
		out.print("<table border = 1>");
		out.println("User Information After Edit");
		out.print("<tr>");
		out.print("<td>");
		out.print("Username");
		out.print("</td>");
		out.print("<td>");
		out.print("Password");
		out.print("</td>");
		out.print("<td>");
		out.print("User Type");
		out.print("</td>");
		out.print("<td>");
		out.print("Name");
		out.print("</td>");
		out.print("<td>");
		out.print("Address");
		out.print("</td>");
		out.print("<td>");
		out.print("Email");
		out.print("</td>");
		out.print("<td>");
		out.print("Phone Number");
		out.print("</td>");
		out.print("</tr>");
		
		while (resultSet2.next()) {
			out.print("<tr>");
			out.print("<td>");
			out.print(resultSet2.getString("Username"));
			out.print("</td>");
			out.print("<td>");
			out.print(resultSet2.getString("Password"));
			out.print("</td>");
			out.print("<td>");
			out.print(resultSet2.getString("Usertype"));
			out.print("</td>");
			out.print("<td>");
			out.print(resultSet2.getString("Name"));
			out.print("</td>");
			out.print("<td>");
			out.print(resultSet2.getString("Address"));
			out.print("</td>");
			out.print("<td>");
			out.print(resultSet2.getString("Email"));
			out.print("</td>");
			out.print("<td>");
			out.print(resultSet2.getString("Phone"));
			out.print("</td>");
			out.print("</tr>");
		}
		String d = request.getParameter("delete");
		if(d.length() != 0){
			String ran = "delete from DataProj.User where Username = ?";
			PreparedStatement anything = con.prepareStatement(ran);
			anything.setString(1, d);
			anything.executeUpdate();
		}
		con.close();		
	} catch (Exception ex) {
		out.print(ex);
	}
%>
<a href="admin.jsp">Return to previous page</a>
</body>
</html>