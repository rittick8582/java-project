

<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<%@page import="java.sql.*" %>
<%
String accno = request.getParameter("accno1");
String uname = request.getParameter("user1");
String transamt = request.getParameter("deposite1");
String date = request.getParameter("date1");
String totalamt = request.getParameter("totalamt1");

String accno1 = request.getParameter("accno2");
String uname1 = request.getParameter("user2");
String depamt = request.getParameter("deposite2");
String da = request.getParameter("date2");
String totalamt1 = request.getParameter("totalamt2");

// Database Connection
Connection conn = null;
PreparedStatement stmt1 = null;
PreparedStatement stmt2 = null;

try {
    // Load database driver and establish connection
    Class.forName("com.mysql.jdbc.Driver"); // Use the correct MySQL driver for newer versions
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "");

    // Begin transaction
    conn.setAutoCommit(false);

    // 1st Update: Deduct amount from User 1
    String updateQuery1 = "UPDATE user SET accno=?, uname=?, transamt=?, date=?, totalamt=? WHERE uname = ?";
    stmt1 = conn.prepareStatement(updateQuery1);
    stmt1.setString(1, accno);
    stmt1.setString(2, uname);
    stmt1.setString(3, transamt);
    stmt1.setString(4, date);
    stmt1.setString(5, totalamt);
    stmt1.setString(6, uname);

    // 2nd Update: Add amount to User 2
    String updateQuery2 = "UPDATE user SET accno=?, uname=?, depamt=?, da=?, totalamt=? WHERE uname = ?";
    stmt2 = conn.prepareStatement(updateQuery2);
    stmt2.setString(1, accno1); // Correct parameter for accno1
    stmt2.setString(2, uname1); // Correct parameter for uname1
    stmt2.setString(3, depamt); // Correct parameter for depamt
    stmt2.setString(4, da);     // Correct parameter for da
    stmt2.setString(5, totalamt1); // Correct parameter for totalamt1
    stmt2.setString(6, uname1); // Correct parameter for uname1

    // Execute updates
    stmt1.executeUpdate();
    stmt2.executeUpdate();

    // Commit the transaction
    conn.commit();

    // Success Message
    out.println("<script>alert('Transfer successful!');</script>");
} catch(Exception e) {
    // Handle errors and rollback if necessary
    try {
        if(conn != null) {
            conn.rollback();
        }
    } catch(SQLException sqle) {
        e.printStackTrace();
    }
    out.println("<script>alert('Transfer failed! Please try again later.');</script>");
    e.printStackTrace(); // Log exception details for better debugging
} finally {
    try {
        if(stmt1 != null) stmt1.close();
        if(stmt2 != null) stmt2.close();
        if(conn != null) conn.close();
    } catch(SQLException e) {
        e.printStackTrace();
    }
}
%>

