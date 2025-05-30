<%-- 
    Document   : delete-acc
    Created on : 9 Dec, 2024, 12:46:30 AM
    Author     : RITTICK BAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Rockwell, Rockwell;
                background-color: #6c63ff;
                margin: 0;
                padding: 20px;
            }

            h1 {
                color: #333;
                text-align: center;
            }

            label {
                font-size: 1.2em;
                margin-top: 10px;
                display: block;
                color: #333;
            }

            input[type="text"] {
                width: 300px;
                padding: 10px;
                margin-top: 5px;
                margin-bottom: 20px;
                border: 1px solid #ccc;
                border-radius: 4px;
                font-size: 1em;
                transition: box-shadow 0.3s ease, border 0.3s ease; /* Smooth transition */
                font-family: Rockwell;
            }
            

            input[type="text"]:focus {
                outline: none; /* Removes default browser outline */
                box-shadow: 0 0 10px rgba(0, 123, 255, 0.6); /* Blue glow */
                border-color: #007bff; /* Blue border */
            }

            input[type="submit"] {
                background-color: #f44336;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                font-size: 1em;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #d32f2f;
            }

            .container {
                max-width: 500px;
                margin: 0 auto;
                padding: 20px;
                background-color: #e0f7fa;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                 animation: flyInFromLeft 2s forwards;
            }
             @keyframes flyInFromLeft {
      0% {
        transform: translateX(-100%); /* Start off-screen on the left */
        opacity: 0;
      }
      100% {
        transform: translateX(0); /* End in the normal position */
        opacity: 1;
      }
    }.fly-in {
  width: 200px;
  height: 100px;
  background-color: #3498db;
  color: white;
  text-align: center;
  line-height: 100px;
  font-size: 20px;
  position: relative;
  transform: translateX(-100%); /* Initially off-screen */
  opacity: 0; /* Initially hidden */
  transition: transform 1s ease-out, opacity 1s ease-out; /* Transition for smooth animation */
}

/* Hover effect to trigger the fly-in animation */
.container:hover .fly-in {
  transform: translateX(0); /* Move into the viewport */
  opacity: 1; /* Make the element visible */
}
        </style>
    </head>
    <body>
        <div class="container">
            <h1 class="fly-in">Close Account</h1>
            <form action="delete.jsp" method="post">
                <label for="uname">UserName:</label><br>
                <input type="text" id="uname" name="uname"><br>
                <input type="submit" value="Delete">
            </form>
        </div>
    </body>
</html>
