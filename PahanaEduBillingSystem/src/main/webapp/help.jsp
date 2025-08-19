<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head>
    <title>Help - Pahana Edu</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            display: flex;
        }

        .sidebar {
            width: 200px;
            height: 100vh;
            background-color: #4CAF50;
            padding-top: 30px;
            position: fixed;
            top: 0;
            left: 0;
        }

        .sidebar a {
            display: block;
            color: white;
            padding: 15px 20px;
            text-decoration: none;
            font-weight: bold;
        }

        .sidebar a:hover {
            background-color: #45a049;
        }

        .content {
            margin-left: 200px;
            padding: 30px;
            background-color: #F2F2F2;
            height: 100vh;
            overflow-y: auto;
        }

        h2 {
            margin-top: 0;
        }

        .section {
            margin-bottom: 20px;
        }

        .section h3 {
            color: #333;
        }

        .section p {
            margin: 5px 0;
        }

    </style>
</head>
<body>
    <!-- Sidebar Navbar -->
    <div class="sidebar">
        <a href="home.jsp">Home</a>
        <a href="menu.jsp">Menu</a>
        <a href="help.jsp">Help</a>
        <a href="edit.jsp">Edit Details</a>
        <a href="logout.jsp">Logout</a>
    </div>

    <!-- Main Content -->
    <div class="content">
        <h2>Help & User Guide</h2>

        <div class="section">
            <h3>🏠 Home</h3>
            <p>View your welcome message and previous purchase history (bills).</p>
        </div>

        <div class="section">
            <h3>📚 Menu</h3>
            <p>Browse available books with details. Select quantity and click "Buy" to generate a bill.</p>
        </div>

        <div class="section">
            <h3>📝 Edit Details</h3>
            <p>Update your password, address, or telephone number. Your username and account number are fixed.</p>
        </div>

        <div class="section">
            <h3>💾 Save Bill</h3>
            <p>After buying a book, you can save your bill. Saved bills will appear on your home page.</p>
        </div>

        <div class="section">
            <h3>🚪 Logout</h3>
            <p>Click this link to safely log out of your session.</p>
        </div>

        <div class="section">
            <h3>⚙️ Admin Panel</h3>
            <p>If you are an admin, you can log in from the admin login page and manage book entries.</p>
        </div>

        <div class="section">
            <h3>❓ Need More Help?</h3>
            <p>If you need any assistance, contact your system administrator or support team.</p>
        </div>
    </div>
</body>
</html>
