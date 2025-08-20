<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head>
    <title>Menu - Pahana Edu</title>
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
            min-height: 100vh;
        }

        h2 {
            margin-top: 0;
            color: #333;
        }

        .book-list {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .book-card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            padding: 20px;
            width: 220px;
        }

        .book-card h3 {
            margin-top: 0;
            font-size: 18px;
        }

        .book-card p {
            margin: 5px 0;
            font-size: 14px;
            color: #555;
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
        <h2>Available Books</h2>
        <div class="book-list">
            <%
                String dbURL = "jdbc:mysql://localhost:3306/pahana_billing";
                String dbUser = "root";
                String dbPass = "123456789";
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery("SELECT * FROM books");

                    while (rs.next()) {
            %>
               <form action="bill.jsp" method="post" class="book-card">
    <h3><%= rs.getString("book_name") %></h3>
    <p><strong>Amount:</strong> Rs. <%= rs.getDouble("amount") %></p>
    <p><strong>Language:</strong> <%= rs.getString("language") %></p>
    
    <input type="hidden" name="bookName" value="<%= rs.getString("book_name") %>">
    <input type="hidden" name="amount" value="<%= rs.getDouble("amount") %>">
    <input type="hidden" name="language" value="<%= rs.getString("language") %>">

    <label>Quantity:</label>
    <input type="number" name="quantity" min="1" value="1" required style="width: 60px;" />

    <br/><br/>
    <input type="submit" value="Buy" style="background-color:#45a049; color:white; border:none; padding: 5px 10px; border-radius: 5px; cursor: pointer;" />
</form>

            <%
                    }
                } catch (Exception e) {
                    out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
                } finally {
                    if (rs != null) try { rs.close(); } catch (Exception ignored) {}
                    if (stmt != null) try { stmt.close(); } catch (Exception ignored) {}
                    if (conn != null) try { conn.close(); } catch (Exception ignored) {}
                }
            %>
        </div>
    </div>
</body>
</html>
