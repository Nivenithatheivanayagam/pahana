<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Add New Book</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #F7ECC6;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: flex-start;
            align-items: center;
            height: 100vh;
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
        
        
        .container {
            background: #9EECFF;
            width: 400px;
            padding: 25px;
            border-radius: 10px;
            margin-left: 100px;
        }
        input[type=text], input[type=number] {
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
    </style>
</head>
<body>

		<div class="sidebar">
        <a href="admin_home.jsp">Home</a>
        <a href="new_book.jsp">New Book</a>
        <a href="edit_book.jsp">Edit Book</a>
        <a href="admin_logout.jsp">Logout</a>
    </div>
		

    <div class="container">
        <h2>Add New Book</h2>

        <% if (request.getAttribute("error") != null) { %>
            <div class="error"><%= request.getAttribute("error") %></div>
        <% } %>
        <% if (request.getAttribute("message") != null) { %>
            <div class="message"><%= request.getAttribute("message") %></div>
        <% } %>

        <form action="NewBookServlet" method="post">
            <label>Book Name:</label>
            <input type="text" name="bookName" required />

            <label>Amount:</label>
            <input type="number" step="0.01" name="amount" required />

            <label>Language:</label>
            <input type="text" name="language" required />

            <input type="submit" value="Add Book" />
        </form>
    </div>
</body>
</html>
