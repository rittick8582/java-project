<%-- 
    Document   : delete
    Created on : 9 Dec, 2024, 1:11:25 AM
    Author     : RITTICK BAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*" %> 
<html>
<head>
    <style>
        /* Custom CSS for success message */
        .success-message {
            color: whitesmoke;
            font-size: 25px;
            font-weight: bold;
            font-family: Rockwell;
            color: white;
        }
     
        body{
            background-color: orange;
        }
    </style>
</head>
<body>
<%
String uname = request.getParameter("uname");
Connection conn = null;
Statement statement = null;
try {
    // Load MySQL JDBC driver
    Class.forName("com.mysql.jdbc.Driver");
    
    // Establish the connection
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "");
    
    // Create a statement object
    statement = conn.createStatement();
    
    // Execute the delete query
    String query = "DELETE FROM user WHERE uname='" + uname + "'";
    int i = statement.executeUpdate(query);
    
    // Print success message
    
    
} catch (Exception e) {
    // Handle errors
    System.out.println(e);
    e.printStackTrace();
} finally {
    // Close the resources
    try {
        if (statement != null) statement.close();
        if (conn != null) conn.close();
    } catch (SQLException se) {
        se.printStackTrace();
    }
}
%>
<%
    // Displaying the registration success message with the CSS class
    out.println("<p class='success-message'>");
    out.println("Account for user " + uname + " deleted successfully!.");
    out.println("</p>");
%>
</body>
</html>
