<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String bookName = request.getParameter("bookName");
    String language = request.getParameter("language");
    double amount = Double.parseDouble(request.getParameter("amount"));
    int quantity = Integer.parseInt(request.getParameter("quantity"));
    double total = amount * quantity;

    session.setAttribute("bookName", bookName);
    session.setAttribute("language", language);
    session.setAttribute("amount", amount);
    session.setAttribute("quantity", quantity);
    session.setAttribute("total", total);
%>
<html>
<head>
    <title>Bill - Pahana Edu</title>
    <style>
        body { font-family: Arial; padding: 30px; background-color: #F8F8F8; }
        .bill-box {
            background: white;
            padding: 25px;
            max-width: 500px;
            margin: auto;
            border-radius: 10px;
            box-shadow: 0 0 8px rgba(0,0,0,0.1);
        }
        h2 { color: #4CAF50; }
        p { font-size: 16px; margin: 10px 0; }
        .btns {
            margin-top: 20px;
        }
        .btns input {
            padding: 8px 16px;
            margin-right: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .save-btn { background-color: #4CAF50; color: white; }
        .back-btn { background-color: #ccc; }
    </style>
</head>
<body>
    <div class="bill-box">
        <h2>Your Bill</h2>
        <p><strong>Book Name:</strong> <%= bookName %></p>
        <p><strong>Language:</strong> <%= language %></p>
        <p><strong>Price per Unit:</strong> Rs. <%= amount %></p>
        <p><strong>Quantity:</strong> <%= quantity %></p>
        <hr>
        <p><strong>Total Amount:</strong> Rs. <%= total %></p>

        <div class="btns">
            <form action="SaveBillServlet" method="post" style="display:inline;">
                <input type="hidden" name="bookName" value="<%= bookName %>">
                <input type="hidden" name="language" value="<%= language %>">
                <input type="hidden" name="amount" value="<%= amount %>">
                <input type="hidden" name="quantity" value="<%= quantity %>">
                <input type="hidden" name="total" value="<%= total %>">
                <input type="submit" value="Save" class="save-btn" />
            </form>

            <form action="home.jsp" method="get" style="display:inline;">
                <input type="submit" value="Back" class="back-btn" />
            </form>
        </div>
    </div>
</body>
</html>
