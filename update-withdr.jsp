

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
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
<%! String driverName = "com.mysql.jdbc.Driver"; %> 
<%
    String url = "jdbc:mysql://localhost:3306/bank";  
    String user = "root";
    String psw = "";  

    String accno = request.getParameter("accno");
    String uname = request.getParameter("user");
    String withamt = request.getParameter("deposite");
    String dat = request.getParameter("date");
    String totalamt = request.getParameter("totalamt");

    if (uname != null) {  
        Connection con = null;
        PreparedStatement ps = null;

        try {
            Class.forName(driverName);
            con = DriverManager.getConnection(url, user, psw);

            String sql = "UPDATE user SET accno = ?, uname = ?, withamt = ?, dat = ?, totalamt = ? WHERE uname = ?";  

            ps = con.prepareStatement(sql); 
            ps.setString(1, accno);
            ps.setString(2, uname);
            ps.setString(3, withamt);
            ps.setString(4, dat);
            ps.setString(5, totalamt);
            ps.setString(6, uname);

            int i = ps.executeUpdate();
            if (i > 0) {
                
            } else {
                out.print("There is a problem of Withdrawal");
            }
        } catch (SQLException sqlException) {  
            request.setAttribute("error", sqlException);
            out.println("Error: " + sqlException.getMessage());  
        } catch (ClassNotFoundException e) {
            out.println("Error: JDBC Driver not found");
        } finally {
            try {
                if (ps != null) ps.close(); 
                if (con != null) con.close();  
            } catch (SQLException e) {
                out.println("Error closing resources: " + e.getMessage());
            }
        }
    }
%>
<%
    // Displaying the registration success message with the CSS class
    out.println("<p class='success-message'>");
    out.println("Withdrawal successfully!");
    out.println("</p>");
%>
</body>
</html>

