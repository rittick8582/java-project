<%-- 
    Document   : withdrawl
    Created on : 7 Dec, 2024, 11:27:07 AM
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
    <form action="update-trans.jsp" method="post">
        <h2>Money Transfer Form</h2>
        
        <!-- 1st User Details -->
       <label for="accno"> 1st user Account No:</label><br>
            <input type="text" id="accno1" name="accno1" value="<%=session.getAttribute("accno")%>" ><br>
            <label for="user">UserName:</label><br>
            <input type="text" id="user1" name="user1" value="<%=session.getAttribute("uname")%>"><br>
        
        <label for="deposite">Amount Transfer:</label><br>
        <input type="text" id="deposite1" name="deposite1" oninput="updateTotal()"><br>
        
        <label for="date">Date:</label><br>
        <input type="date" id="date1" name="date1"><br>
        
        <label for="totalamt">Total Amount:</label><br>
        <input type="text" id="totalamt1" name="totalamt1"><br> <!-- Initial Balance of 1st user -->
        
        <!-- 2nd User Details -->
        <label for="accno">2nd user Account No:</label><br>
        <input type="text" id="accno2" name="accno2" ><br>
        
        <label for="user">UserName:</label><br>
        <input type="text" id="user2" name="user2"><br>
        
        <label for="deposite">Get Amount:</label><br>
        <input type="text" id="deposite2" name="deposite2"><br>
        
        <label for="date">Date:</label><br>
        <input type="date" id="date2" name="date2"><br>
        
        <label for="totalamt">Total Amount:</label><br>
        <input type="text" id="totalamt2" name="totalamt2"><br> <!-- Initial Balance of 2nd user -->
        
        <input type="submit" value="Transfer">
    </form>

    <script> 
    function updateTotal() {
        // Get the amount to transfer from the first user
       let amountToTransfer = parseFloat(document.getElementById('deposite1').value) || 0; 
let totalAmount1 = parseFloat('<%= session.getAttribute("totalamt") != null ? session.getAttribute("totalamt") : "0" %>') || 0;
let totalAmount2 = parseFloat(document.getElementById('totalamt2').value) || 0;

        
        // Check if the transfer amount is greater than the available balance
        if (amountToTransfer > totalAmount1) {
            // Show error message if amount is greater than available balance
            alert("Please enter a valid amount: Amount exceeds available balance.");
            document.getElementById('deposite1').value = ''; // Clear the input field for amount
            document.getElementById('deposite2').value = ''; // Clear the second user's deposit field
             document.getElementById('totalamt2').value = '';
            document.getElementById("totalamt").value = '';
            return; // Stop the function execution
        }
        
        // Calculate new total for the first user (Debit)
        let newTotal1 = totalAmount1 - amountToTransfer;
        document.getElementById('totalamt1').value = newTotal1;

        // Calculate new total for the second user (Credit)
        let newTotal2 = totalAmount2 + amountToTransfer;
        document.getElementById('totalamt2').value = newTotal2;

        // Set the amount to transfer for the second user (Read-only field)
        document.getElementById('deposite2').value = amountToTransfer;
    }
</script>


</body>

</html>


