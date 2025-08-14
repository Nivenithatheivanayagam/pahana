package servlet;

import bean.BillBean;
import dao.BillDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/SaveBillServlet")
public class SaveBillServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("username");

            String bookName = request.getParameter("bookName");
            String language = request.getParameter("language");
            double amount = Double.parseDouble(request.getParameter("amount"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            double total = Double.parseDouble(request.getParameter("total"));

            BillBean bill = new BillBean();
            bill.setUsername(username);
            bill.setBookName(bookName);
            bill.setLanguage(language);
            bill.setAmount(amount);
            bill.setQuantity(quantity);
            bill.setTotal(total);

            BillDAO dao = new BillDAO();
            boolean success = dao.saveBill(bill);

            if (success) {
                session.setAttribute("message", "Your bill has been saved successfully.");
            } else {
                session.setAttribute("message", "Failed to save bill.");
            }

            response.sendRedirect("home.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Server error: " + e.getMessage());
            request.getRequestDispatcher("bill.jsp").forward(request, response);
        }
    }
}
