<%-- 
    Document   : search-user
    Created on : 8 Dec, 2024, 9:37:23 PM
    Author     : RITTICK BAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>

<%
    String uname = request.getParameter("uname");
    String driver = "com.mysql.jdbc.Driver";  // Updated driver class for newer MySQL versions
    String connectionurl = "jdbc:mysql://localhost:3306/";
    String database = "bank";
    String userid = "root";
    String password = "";

    Connection connection = null;
    Statement statement = null;
    ResultSet rs = null;
    
    try {
        // Load the MySQL driver
        Class.forName(driver);
        
        // Establish connection
        connection = DriverManager.getConnection(connectionurl + database, userid, password);
        
        // Use a PreparedStatement to avoid SQL injection
        String sql = "SELECT * FROM user";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        
        
        rs = preparedStatement.executeQuery();
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (Exception e) {
        e.printStackTrace();  // Log the exception
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Information</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
    <h1>User Information</h1>
    <table>
        <tr>
            <th>Account No</th>
            <th>Name</th>
            <th>Username</th>
            <th>Deposit Amount</th>
            <th>Deposit Date</th>
            <th>Withdrawal Amount</th>
            <th>Withdrawal Date</th>
            <th>Transfer Amount</th>
            <th>Transfer Date</th>
            <th>Total Amount</th>
        </tr>
        <%
            // Loop through the result set and display data
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("accno") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("uname") %></td>
            <td><%= rs.getString("depamt") %></td>
            <td><%= rs.getString("da") %></td>
            <td><%= rs.getString("withamt") %></td>
            <td><%= rs.getString("dat") %></td>
            <td><%= rs.getString("transamt") %></td>
            <td><%= rs.getString("date") %></td>
            <td><%= rs.getString("totalamt") %></td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
<%
    // Clean up resources
    try {
        if (rs != null) rs.close();
        if (statement != null) statement.close();
        if (connection != null) connection.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

