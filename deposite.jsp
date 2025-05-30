<%-- 
    Document   : deposite
    Created on : 6 Dec, 2024, 9:26:29 PM
    Author     : RITTICK BAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
    <head>
        <title>Deposite html</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            body {
                font-family: Rockwell, Rockwell;
                margin: 0;
                padding: 20px;
                background-color: #dcbaec;
                
            }

            form {
                width: 500px;
                margin: 0 auto;
                padding: 20px;
                background-color: #fff;
                box-shadow: 0 6px 10px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                background-color:#cefacd;
            }

            input[type="text"], input[type="date"] {
                width: 100%;
                padding: 10px;
                margin: 10px 0;
                border: 2px solid #ccc;
                border-radius: 5px;
                font-size: 16px;
                transition: all 0.3s ease;
                width:350px;
                background-color: lightblue;
                font-family: Rockwell;
                animation: fadeIn 2s ease-in; 
            }

            @keyframes fadeIn {
                0% {
                    opacity: 0; /* Start with opacity 0 (invisible) */
                }
                100% {
                    opacity: 1; /* End with opacity 1 (fully visible) */
                }
            }

            input[type="text"]:focus, input[type="date"]:focus {
                outline: none;
                border-color: #6c63ff;
                box-shadow: 0 0 10px rgba(108, 99, 255, 0.7);
                color: #6c63ff;
            }

            input[type="text"]:valid, input[type="date"]:valid {
                color: green;
            }

            input[type="text"]:invalid, input[type="date"]:invalid {
                color: red;
            }

            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                width: 180px;
                transition: background-color 0.3s ease;
                animation: fadeIn 2s ease-in;
            }

            input[type="submit"]:hover {
                background-color: #45a049;
            }

            h2 {
                font-family: Rockwell;
                font-size: 25px;
                text-align: center;
                text-decoration: underline;
                animation: upDown 1.5s ease-in-out infinite;
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

            h2:hover {
                color: orange;
            }
        </style>
    </head>
    <body>
        <form action="update-depos.jsp" method="post">
            <h2>Depository Form</h2>
            <label for="accno">Account No:</label><br>
            <input type="text" id="accno" name="accno" value="<%=session.getAttribute("accno")%>" ><br>
            <label for="user">UserName:</label><br>
            <input type="text" id="user" name="user" value="<%=session.getAttribute("uname")%>"><br>
            <!--<label for="password">Password:</label><br>
            <input type="text" id="password" name="password"><br>-->
            <label for="deposite">Deposite Amount:</label><br>
            <input type="text" id="deposite" name="deposite"  oninput="updateTotal()"><br>
            <label for="date">Date:</label><br>
            <input type="date" id="date" name="date"><br>
            <label for="totalamt">Total Amount:</label><br>
            <input type="text" id="totalamt" name="totalamt"><br>
          
            <input type="submit" value="Deposite">
        </form>

       <script> 
    // Assuming initial total amount is passed via JSP (you can adjust as needed)
    let initialTotalAmount = parseFloat('<%= session.getAttribute("totalamt") %>');

    // Function to update total amount
    function updateTotal() {
        // Get the deposit amount entered by the user
        let depositAmount = document.getElementById("deposite").value;

        // Convert the deposit amount to a number
        depositAmount = parseFloat(depositAmount);

        // If the deposit amount is a valid number and non-negative, calculate the total amount
        if (!isNaN(depositAmount) && depositAmount >= 0) {
            let totalAmount = initialTotalAmount + depositAmount;
            // Display the total amount in the 'totalamt' field
            document.getElementById("totalamt").value = totalAmount.toFixed(2);
        } else {
            // If the deposit amount is invalid, display an alert and reset the total amount
            alert("Invalid Deposite amount. Please enter a valid, non-negative number.");
            document.getElementById("totalamt").value = initialTotalAmount.toFixed(2);
        }
    }
</script>


    </body>
</html>
