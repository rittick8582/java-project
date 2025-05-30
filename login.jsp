<%@ page contentType="text/html" pageEncoding="UTF-8" %>  
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@page session="true" %>
<%
    // Get parameters from the request
    String uname = request.getParameter("username"); // Corrected to match the input name in HTML
    String pword = request.getParameter("password");  // Corrected to match the input name in HTML
    
    // Store the username in the session to identify the user
    session.setAttribute("uname", uname);  // Corrected session attribute usage
    
    try {
        // Load the MySQL driver
        Class.forName("com.mysql.jdbc.Driver");  // Updated to use the newer MySQL connector
        
        // Establish the connection
        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "");
        
        // Use PreparedStatement to avoid SQL injection
        String query = "SELECT * FROM user WHERE uname = ? AND pword = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, uname);
        pstmt.setString(2, pword);
        
        // Execute the query
        ResultSet rs = pstmt.executeQuery();
        
        if (rs.next()) {
            // Check if the password and username match
            session.setAttribute("uname",uname);
            session.setAttribute("name",rs.getString("name"));
            session.setAttribute("accno",rs.getInt("accno"));
            session.setAttribute("totalamt",rs.getInt("totalamt"));
            response.sendRedirect("userdash.jsp");
            out.println("Welcome, " + uname);
        } else {
            out.println("Invalid username or password");
        }
        
        // Close resources
        rs.close();
        pstmt.close();
        con.close();
        
    } catch (Exception e) {
        // Handle exceptions
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    }
%>
