<%-- 
    Document   : admindash
    Created on : 8 Dec, 2024, 12:45:11 PM
    Author     : RITTICK BAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sidebar Navigation with Animated Toggle</title>
  <style>
      /* Basic Reset */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

/* Container setup */
.container {
  display: flex;
}

/* Sidebar styling */
.sidebar {
  position: fixed;
  left: -250px;
  top: 0;
  height: 100%;
  width: 250px;
  background-color: #333;
  transition: all 0.3s ease;
}

.sidebar ul {
  list-style-type: none;
  padding: 20px;
}

.sidebar ul li {
  margin: 20px 0;
}

.sidebar ul li a {
  color: #fff;
  text-decoration: none;
  font-size: 18px;
}

.sidebar.open {
  left: 0;
}

/* Content section */
.content {
  margin-left: 50px;
  padding: 20px;
  transition: margin-left 0.3s ease;
}

/* Toggle button styling */
.toggle-btn {
  position: absolute;
  top: 20px;
  left: 20px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  width: 30px;
  height: 25px;
  background: transparent;
  border: none;
  cursor: pointer;
  z-index: 1000;
}

.toggle-btn .bar {
  width: 30px;
  height: 5px;
  background-color: #e5f3f8;
  border-radius: 5px;
  transition: 0.3s ease;
}

.toggle-btn.open .bar:nth-child(1) {
  transform: rotate(45deg);
  position: relative;
  top: 10px;
}

.toggle-btn.open .bar:nth-child(2) {
  opacity: 0;
}

.toggle-btn.open .bar:nth-child(3) {
  transform: rotate(-45deg);
  position: relative;
  top: -10px;
}
body{
    background-color: #6c63ff;
}
  </style>
</head>
<body>
  <div class="container">
    <div class="sidebar" id="sidebar">
      <ul class="nav-links">
        <li><a href="#"></a></li>
        <li><a href="search-user.jsp">User Information</a></li>
        <li><a href="delete-acc.jsp">Close Account</a></li>
        <li><a href="login.html">LogOut</a></li>
      </ul>
    </div>

    <div class="content">
      <button class="toggle-btn" id="toggle-btn">
        <span class="bar"></span>
        <span class="bar"></span>
        <span class="bar"></span>
      </button>

      <h1>Welcome Admin</h1>
      <p></p>
    </div>
  </div>

    <script >
      document.getElementById("toggle-btn").addEventListener("click", function () {
  const sidebar = document.getElementById("sidebar");
  const toggleBtn = document.getElementById("toggle-btn");

  sidebar.classList.toggle("open");
  toggleBtn.classList.toggle("open");

  if (sidebar.classList.contains("open")) {
    document.querySelector(".content").style.marginLeft = "250px";
  } else {
    document.querySelector(".content").style.marginLeft = "50px";
  }
});

    </script>
</body>
</html>

