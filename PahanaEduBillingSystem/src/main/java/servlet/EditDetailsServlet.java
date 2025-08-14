package servlet;

import dao.CustomerDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/EditDetailsServlet")
public class EditDetailsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = (String) request.getSession().getAttribute("username");
        String address = request.getParameter("address");
        String telephone = request.getParameter("telephone");
        String password = request.getParameter("password");

        try {
            if (address == null || address.isEmpty() ||
                telephone == null || telephone.length() != 10 ||
                password == null || password.length() < 8) {
                request.setAttribute("error", "All fields are required. Telephone must be 10 digits and password at least 8 characters.");
                request.getRequestDispatcher("edit.jsp").forward(request, response);
                return;
            }

            CustomerDAO dao = new CustomerDAO();
            boolean success = dao.updateCustomer(username, address, telephone, password);

            if (success) {
                request.setAttribute("message", "Details updated successfully.");
            } else {
                request.setAttribute("error", "Update failed.");
            }

        } catch (Exception e) {
            request.setAttribute("error", "Error: " + e.getMessage());
        }

        request.getRequestDispatcher("edit.jsp").forward(request, response);
    }
}
