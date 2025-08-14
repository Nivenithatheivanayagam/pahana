package servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Hardcoded admin check (can also be moved to DAO)
        if ("Admin 1".equals(username) && "adminadmin".equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", username);
            response.sendRedirect("admin_home.jsp");
        } else {
            request.setAttribute("error", "Invalid admin username or password.");
            request.getRequestDispatcher("admin_login.jsp").forward(request, response);
        }
    }
}
