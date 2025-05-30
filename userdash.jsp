<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Responsive Sidebar for Admin</title>
    <style>
        /* Styling for the container */
        .container {
            min-height: 100vh;         
            background-color: #dcbaec; 
            padding: 20px;           
            position: relative;       
        }

        /* Styling for the box */
        .box, .box1, .box2,.box3 {
            background-color: #4CAF50; /* White background for the box */
            border: 2px solid #ccc;    /* Light gray border */
            padding: 20px;             /* Padding inside the box */
            border-radius: 10px;       /* Rounded corners */
            width: 400px;              /* Fixed width for the box */
            text-align: center;        /* Center align text inside the box */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow */
            font-family: Rockwell, Rockwell; /* Use a clean sans-serif font */
            position: absolute;        /* Use absolute positioning */
            height:60px;
            animation: flyInFromLeft 2s forwards;
             
            
        }
           .box:hover{
            background-color: #f39c12;
            color: white;
            transition: box-shadow 0.3s ease, border-color 0.3s ease;
             box-shadow: 0 0 8px 5px #f39c12; /* Blue glow effect */
                border-color: #f39c12; 
        }
           .box1:hover{
            background-color: #f39c12;
            color: white;
            transition: box-shadow 0.3s ease, border-color 0.3s ease;
             box-shadow: 0 0 8px 5px #f39c12; /* Blue glow effect */
                border-color: #f39c12; 
        }
           .box2:hover{
            background-color: #f39c12;
            color: white;
            transition: box-shadow 0.3s ease, border-color 0.3s ease;
             box-shadow: 0 0 8px 5px #f39c12; /* Blue glow effect */
                border-color: #f39c12; 
        }
        .box3:hover{
            background-color: #f39c12;
            color: white;
            transition: box-shadow 0.3s ease, border-color 0.3s ease;
             box-shadow: 0 0 8px 5px #f39c12; /* Blue glow effect */
                border-color: #f39c12; 
        }
        /* Positioning the first box (top-left) */
        .box {
            top: 50px;
            right: 480px;
        }

        /* Positioning the second box (top-right) */
        .box1 {
            top: 50px;
            right: 20px;
        }

        /* Positioning the third box (middle center) */
        .box2 {
            top: 40%;               /* Vertically center it */
            right: 20%;              /* Horizontally center it */
            transform: translate(-50%, -50%); /* Adjust to exactly center the box */
        }
            .box3 {
            bottom: 10%;               /* Vertically center it */
            left: 47%;              /* Horizontally center it */
            transform: translate(-50%, -50%); /* Adjust to exactly center the box */
        }

        /* Styling for the <ul> elements */
        .box  ul {
            list-style: none;         /* Remove default list bullets */
            padding: 0;               /* Remove padding */
            margin: 0;                /* Remove margin */
        }
          .box1  ul {
            list-style: none;         /* Remove default list bullets */
            padding: 0;               /* Remove padding */
            margin: 0;                /* Remove margin */
        }
           .box2  ul {
            list-style: none;         /* Remove default list bullets */
            padding: 0;               /* Remove padding */
            margin: 0;                /* Remove margin */
        }
              .box3  ul {
            list-style: none;         /* Remove default list bullets */
            padding: 0;               /* Remove padding */
            margin: 0;                /* Remove margin */
        }
     .box li:hover {
  color: white;
}
        /* Styling for the heading 'Saving Account' */
        .box ul:first-child {
            font-weight: bold;
            font-size: 25px;           /* Large font size */
            color: #333;               /* Dark text color */
            margin-bottom: 10px;       /* Add margin below the heading */
        }

        /* Styling for the <li> elements inside the <ul> */
        .box li {
            font-size: 20px;           /* Set a normal font size */
            //margin-bottom: 10px;       /* Add space between list items */
            text-align: center;
        }
        .box1 li {
            font-size: 20px;
            text-align: center;
        }
        .box2 li{
            font-size: 20px;
            text-align: center;
        }
        .box3 li{
               font-size: 20px;
            text-align: center;
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
    }
    .table{
        bottom:50%;
        left: 50px;
        font-family: Rockwell;
        color:white;
        
    }
    .box4{
        height:220px;
        width:200px;
        background-color: #6c63ff; /* White background for the box */
            border: 2px solid #ccc;    /* Light gray border */
            padding: 20px;             /* Padding inside the box */
            border-radius: 10px; 
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow */
            font-family: Rockwell, Rockwell; /* Use a clean sans-serif font */
            position: absolute;  
    }
    input [type="text"]{
        font-family: Rockwell;
        font-weight: bold;
    }
button{
    position: absolute; /* Use absolute positioning to place it relative to the nearest positioned ancestor */
    top: 44%; /* Position vertically at the center of the container */
    left: 23px; /* Align it to the left with a 10px margin */
    transform: translateY(-50%); /* Offset the top to ensure it's truly centered */
    padding: 10px 20px; /* Adjust the padding for better visual appearance */
    border: none; /* Remove default border */
    background-color: #d32f2f; /* Set a background color */
    color: white; /* Set text color */
    font-size: 16px; /* Set the font size */
    cursor: pointer; /* Change cursor to pointer on hover */
    border-radius: 5px; /* Optional: Add rounded corners */
    transition: box-shadow 0.3s ease-in-out, transform 0.3s ease-in-out;
    
}
button:hover{
     box-shadow: 0 0 15px 5px rgba(255, 0, 0, 0.7); /* Glowing effect with red color */
    transform: scale(1.05); /* Slightly scale up the button on hover */
}
a{
    color:white;
    text-decoration: none;
}
    </style>
</head>
<body>
    <form>
    <div class="container">
        <div class="table">
            <div class="box4">
                <h2 style="font-family:Rockwell;font-size:15px">User Information</h2>
        Account No:<br>
        <input type="text" name="account" value="<%=session.getAttribute("accno")%>" disabled><br>
        Name:<br>
        <input type="text" name="name" value="<%=session.getAttribute("name")%>" disabled><br>
        UserName:<br>
        <input type="text" name="uname" value="<%=session.getAttribute("uname")%>" disabled><br>
        Available Balance:<br>
        <input type="text" name="totalamt" value="<%=session.getAttribute("totalamt")%>" disabled><br>
        
    </div>
        <button><a href="login.html">LogOut</a></button>
        </div>
        <div class="box">
            <ul style="font-weight: bold; font-size: 25px">
                <li><a href="deposite.jsp">Deposite Amount</a></li>
            </ul>
        </div>
        <div class="box1">
            <ul style="font-weight: bold; font-size: 25px">
                <li><a href="withdrawl.jsp">Withdrawal Amount</a></li>
            </ul>
        </div>
        <div class="box2">
            <ul style="font-weight: bold; font-size: 25px">
                <li><a href="transfer.jsp">Transfer Amount</a></li>
            </ul>
        </div>
        <div class="box3">
            <ul style="font-weight: bold; font-size: 25px">
                <li><a href="mini-state.jsp">Mini Statement</a></li>
            </ul>
        </div>
      
    </div>
    </form>
</body>
</html>
