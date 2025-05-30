<%@ page contentType="text/html" pageEncoding="UTF-8" %> 
<%@ page import="java.sql.*, java.util.*" %>
<html>
<head>
    <style>
        /* Custom CSS for success message */
        .success-message {
            color: whitesmoke;
            font-size: 35px;
            font-weight: bold;
            font-family: Rockwell;    
        }
        .success-message a {
            color: blue;
        }
        body{
            background-color: orange;
        }
    </style>
</head>
<body>
<%
    String name = request.getParameter("name");
    String uname = request.getParameter("user");
    String pword = request.getParameter("password");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Load MySQL JDBC driver (use the updated driver class)
        Class.forName("com.mysql.jdbc.Driver");

        // Establish connection (make sure to specify the correct timezone)
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "");

        // SQL query using PreparedStatement to prevent SQL injection
        String query = "INSERT INTO user (name, uname, pword) VALUES (?, ?, ?)";
        pstmt = conn.prepareStatement(query);
        
        // Set the parameters for the PreparedStatement (ensure the correct order
        pstmt.setString(1, name); // First parameter for name
        pstmt.setString(2, uname); // Second parameter for user
        pstmt.setString(3, pword); // Third parameter for password
        
        // Execute the update
        int i = pstmt.executeUpdate();

        if (i > 0) {
            //out.println("Thank you for registering! Please <a href='login.html'>Login</a> to continue.");
        } else {
            out.println("Registration failed. Please try again.");
        }
    } catch (Exception e) {
        // Handle the exception
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    } finally {
        // Close resources to avoid memory leaks
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
<%
    // Displaying the registration success message with the CSS class
    out.println("<p class='success-message'>");
    out.println("Thank you for registering! Please <a href='login.html'>Login</a> to continue.");
    out.println("</p>");
%>

</body>
</html>
