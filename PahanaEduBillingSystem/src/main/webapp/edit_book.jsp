<%@ page import="dao.BookDAO, bean.BookBean, java.util.List" %>
<%
    String admin = (String) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("admin_login.jsp");
        return;
    }

    BookDAO dao = new BookDAO();
    List<BookBean> books = dao.getAllBooks();
%>

<html>
<head>
    <title>Edit Books - Admin</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            display: flex;
        }
        .sidebar {
            width: 220px;
            height: 100vh;
            background-color: #D1E8FF;
            padding-top: 30px;
        }
        .sidebar a {
            display: block;
            padding: 12px 20px;
            color: #000;
            text-decoration: none;
            font-weight: bold;
        }
        .sidebar a:hover {
            background-color: #A076F9;
            color: white;
        }
        .main {
            flex: 1;
            padding: 30px;
            background: #F7ECC6;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 25px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #999;
            text-align: left;
        }
        input[type=text], input[type=number] {
            width: 90%;
        }
        input[type=submit] {
            padding: 5px 10px;
            margin: 5px;
            background-color: #FEC7FF;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .message {
            color: green;
            margin-bottom: 10px;
        }
        .error {
            color: red;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<div class="sidebar">
    <a href="admin_home.jsp">Home</a>
    <a href="new_book.jsp">New Book</a>
    <a href="edit_book.jsp">Edit Book</a>
    <a href="logout.jsp">Logout</a>
</div>

<div class="main">
    <h2>Edit or Delete Books</h2>

    <% if (request.getAttribute("message") != null) { %>
        <div class="message"><%= request.getAttribute("message") %></div>
    <% } else if (request.getAttribute("error") != null) { %>
        <div class="error"><%= request.getAttribute("error") %></div>
    <% } %>

    <table>
        <tr>
            <th>Book Name</th>
            <th>Amount</th>
            <th>Language</th>
            <th>Actions</th>
        </tr>
        <%
            for (BookBean book : books) {
        %>
        <tr>
            <form action="EditBookServlet" method="post">
                <input type="hidden" name="id" value="<%= book.getId() %>" />
                <td><input type="text" name="book_name" value="<%= book.getBookName() %>" /></td>
                <td><input type="number" step="0.01" name="amount" value="<%= book.getAmount() %>" /></td>
                <td><input type="text" name="language" value="<%= book.getLanguage() %>" /></td>
                <td>
                    <button type="submit" name="action" value="update">Update</button>
                    <button type="submit" name="action" value="delete" onclick="return confirm('Are you sure to delete this book?')">Delete</button>
                </td>
            </form>
        </tr>
        <% } %>
    </table>
</div>

</body>
</html>
