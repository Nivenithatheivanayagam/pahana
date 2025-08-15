<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String message = (String) session.getAttribute("message");
%>

<html>
<head>
    <title>Home - Pahana Edu</title>
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

        .message {
            color: green;
            margin-bottom: 20px;
            font-weight: bold;
        }

        h2 {
            margin-top: 0;
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
        <h2>Welcome, <%= username %>!</h2>  <br>

        <% if (message != null) { %>
            <div class="message"><%= message %></div>
            <%
                session.removeAttribute("message");
            %>
        <% } %>

        <p>This is your dashboard. Use the sidebar to navigate through the system.</p>
        <br>  <br>  <br>
        <%
    try {
        dao.BillDAO billDAO = new dao.BillDAO();
        java.util.List<bean.BillBean> billList = billDAO.getBillsByUsername(username);

        if (!billList.isEmpty()) {
%>
        <h3>Your Bill History</h3>
        <table style="width: 100%; border-collapse: collapse; background-color: #fff;">
            <tr style="background-color: #4CAF50; color: white;">
                <th style="padding: 10px; border: 1px solid #ccc;">Book Name</th>
                <th style="padding: 10px; border: 1px solid #ccc;">Language</th>
                <th style="padding: 10px; border: 1px solid #ccc;">Amount</th>
                <th style="padding: 10px; border: 1px solid #ccc;">Quantity</th>
                <th style="padding: 10px; border: 1px solid #ccc;">Total</th>
            </tr>
<%
            for (bean.BillBean bill : billList) {
%>
            <tr>
                <td style="padding: 10px; border: 1px solid #ccc;"><%= bill.getBookName() %></td>
                <td style="padding: 10px; border: 1px solid #ccc;"><%= bill.getLanguage() %></td>
                <td style="padding: 10px; border: 1px solid #ccc;">Rs. <%= bill.getAmount() %></td>
                <td style="padding: 10px; border: 1px solid #ccc;"><%= bill.getQuantity() %></td>
                <td style="padding: 10px; border: 1px solid #ccc;">Rs. <%= bill.getTotal() %></td>
            </tr>
<%
            }
%>
        </table>
<%
        } else {
%>
        <p style="margin-top: 30px;">You have not made any purchases yet.</p>
<%
        }
    } catch (Exception e) {
%>
        <p style="color: red;">Error loading bill history: <%= e.getMessage() %></p>
<%
    }
%>
        
        
    </div>
</body>
</html>
