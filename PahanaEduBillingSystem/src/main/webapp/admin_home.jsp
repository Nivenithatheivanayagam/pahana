<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String admin = (String) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("admin_login.jsp");
        return;
    }
%>
<html>
<head>
    <title>Admin Home</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            display: flex;
        }

        /* Sidebar/Navbar */
        .sidebar {
            height: 100vh;
            width: 220px;
            background-color: #D1E8FF;
            padding-top: 30px;
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
        }

        .sidebar a {
            display: block;
            color: #000;
            padding: 12px 20px;
            text-decoration: none;
            font-weight: bold;
        }

        .sidebar a:hover {
            background-color: #A076F9;
            color: white;
        }

        /* Main Content */
        .main-content {
            flex: 1;
            padding: 40px;
            background-color: #F7ECC6;
        }

        h2 {
            margin-top: 0;
        }
    </style>
</head>
<body>

    <div class="sidebar">
        <a href="admin_home.jsp">Home</a>
        <a href="new_book.jsp">New Book</a>
        <a href="edit_book.jsp">Edit Book</a>
        <a href="admin_logout.jsp">Logout</a>
    </div>

    <div class="main-content">
        <h2>Welcome, <%= admin %></h2>
        <p>This is your admin dashboard.</p>
    </div>

</body>
</html>
