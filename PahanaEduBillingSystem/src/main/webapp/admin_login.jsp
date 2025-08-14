<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Admin Login - Pahana Edu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: #E8D5FF;
            height: 100vh;
            display: flex;
            justify-content: flex-start;
            align-items: center;
        }

        .container {
            width: 400px;
            margin-left: 100px;
            background: #D1E8FF;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h2 { margin-bottom: 20px; }

        input[type=text], input[type=password] {
            width: 100%;
            padding: 10px;
            margin: 8px 0 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type=submit] {
            width: 100%;
            background-color: #A076F9;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type=submit]:hover {
            background-color: #845EC2;
        }

        .error { color: red; margin-bottom: 10px; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Admin Login</h2>

        <% if (request.getAttribute("error") != null) { %>
            <div class="error"><%= request.getAttribute("error") %></div>
        <% } %>

        <form action="AdminLoginServlet" method="post">
            <label>Username:</label>
            <input type="text" name="username" required />

            <label>Password:</label>
            <input type="password" name="password" required />

            <input type="submit" value="Login" />
        </form>
    </div>
</body>
</html>
