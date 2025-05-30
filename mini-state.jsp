<%-- 
    Document   : mini-state
    Created on : 10 Dec, 2024, 11:26:06 AM
    Author     : RITTICK BAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>

<%
    String accno = (String) session.getAttribute("uname"); // Get account number from session
    String driver = "com.mysql.jdbc.Driver";  // Use updated driver class for MySQL
    String connectionurl = "jdbc:mysql://localhost:3306/";
    String database = "bank";
    String userid = "root";
    String password = "";

    Connection connection = null;
    ResultSet rs = null;
    
    try {
        // Load the MySQL driver
        Class.forName(driver);
        
        // Establish connection
        connection = DriverManager.getConnection(connectionurl + database, userid, password);
        
        // Prepare the SQL query with the session's accno
        String sql = "SELECT * FROM user WHERE uname = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, accno);  // Set the account number parameter
        
        rs = preparedStatement.executeQuery();
    } catch (ClassNotFoundException e) {
        e.printStackTrace(); // Log the exception
    } catch (Exception e) {
        e.printStackTrace(); // Log the exception
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Statement</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #6c63ff;
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
            color: #f2f2f2;
            animation: upDown 1.5s ease-in-out infinite;
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
        @keyframes upDown {
                0% {
                    transform: translateY(0); /* Start at the original position */
                }
                50% {
                    transform: translateY(-20px); /* Move 20px up at the halfway point */
                }
                100% {
                    transform: translateY(0); /* Return to the original position */
                }
            }
    </style>
</head>
<body>
    <h1>Account Statement</h1>
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
        if (connection != null) connection.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

