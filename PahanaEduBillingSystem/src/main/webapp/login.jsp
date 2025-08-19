<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Login - Pahana Edu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: #F7ECC6;
            height: 100vh;
            display: flex;
            justify-content: flex-start;
            align-items: center;
        }

        .container {
            width: 400px;
            margin-left: 100px;
            background: #9EECFF;
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
            background-color: #FEC7FF;
            color: black;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type=submit]:hover {
            background-color: #45a049;
        }

        .error { color: red; margin-bottom: 10px; }
        .message { color: green; margin-bottom: 10px; }

        .login-link {
            margin-top: 15px;
            text-align: center;
        }

        .login-link a {
            color: #007BFF;
            text-decoration: none;
        }

        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Customer Login</h2>

        <% if (request.getAttribute("error") != null) { %>
            <div class="error"><%= request.getAttribute("error") %></div>
        <% } %>

        <form action="LoginServlet" method="post">
            <label>Username:</label>
            <input type="text" name="username" required />

            <label>Password:</label>
            <input type="password" name="password" required />

            <input type="submit" value="Login" />
        </form>

        <div class="login-link">
            New user? <a href="register.jsp">Click here to register</a>
        </div>
    </div>
</body>
</html>
