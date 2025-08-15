<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.CustomerDAO" %>
<%@ page import="bean.CustomerBean" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    CustomerBean customer = null;
    try {
        CustomerDAO dao = new CustomerDAO();
        customer = dao.getCustomerByUsername(username);
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<html>
<head>
    <title>Edit Details - Pahana Edu</title>
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
            flex-grow: 1;
            background-color: #F2F2F2;
            height: 100vh;
        }

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

        .message {
            color: green;
        }

        .error {
            color: red;
        }

        .form-container {
            max-width: 500px;
            background-color: white;
            padding: 20px;
            border-radius: 10px;
        }
    </style>
</head>
<body>

    <div class="sidebar">
        <a href="home.jsp">Home</a>
        <a href="menu.jsp">Menu</a>
        <a href="help.jsp">Help</a>
        <a href="edit.jsp">Edit Details</a>
        <a href="logout.jsp">Logout</a>
    </div>

    <div class="content">
        <h2>Edit Your Details</h2>

        <div class="form-container">
            <% if (request.getAttribute("error") != null) { %>
                <div class="error"><%= request.getAttribute("error") %></div>
            <% } %>
            <% if (request.getAttribute("message") != null) { %>
                <div class="message"><%= request.getAttribute("message") %></div>
            <% } %>

            <form action="EditDetailsServlet" method="post">
                <label>Address:</label>
                <input type="text" name="address" value="<%= customer.getAddress() %>" required />

                <label>Telephone:</label>
                <input type="text" name="telephone" value="<%= customer.getTelephone() %>" maxlength="10" required />

                <label>New Password:</label>
                <input type="password" name="password" required minlength="8" />

                <input type="submit" value="Update" />
            </form>
        </div>
    </div>

</body>
</html>
