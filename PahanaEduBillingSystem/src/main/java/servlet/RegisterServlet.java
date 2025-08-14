package servlet;

import bean.CustomerBean;
import dao.CustomerDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String username = request.getParameter("username");
            String address = request.getParameter("address");
            String telephone = request.getParameter("telephone");
            String password = request.getParameter("password");

            // Input Validation
            if (username == null || username.isEmpty() ||
                address == null || address.isEmpty() ||
                telephone == null || telephone.isEmpty() || telephone.length() != 10 ||
                password == null || password.isEmpty() || password.length() < 8) {

                request.setAttribute("error", "All fields are required. Telephone must be 10 digits. Password must be at least 8 characters.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            CustomerDAO dao = new CustomerDAO();

            // Check if username already exists
            if (dao.isUsernameExists(username)) {
                request.setAttribute("error", "Username already exists. Please choose another.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            // Generate account number
            String accountNumber = dao.generateAccountNumber();

            // Create Bean
            CustomerBean bean = new CustomerBean();
            bean.setAccountNumber(accountNumber);
            bean.setUsername(username);
            bean.setAddress(address);
            bean.setTelephone(telephone);
            bean.setPassword(password); // Will be hashed in DAO

            // Register User
            boolean success = dao.registerUser(bean);

            if (success) {
                HttpSession session = request.getSession();
                session.setAttribute("message", "Registration successful! Your account number is: " + accountNumber);
                response.sendRedirect("home.jsp");
            } else {
                request.setAttribute("error", "Registration failed. Please try again.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Internal server error: " + e.getMessage());
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
