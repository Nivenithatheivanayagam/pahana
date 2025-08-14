package servlet;

import bean.BookBean;
import dao.BookDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            BookDAO dao = new BookDAO();
            List<BookBean> bookList = dao.getAllBooks();
            request.setAttribute("bookList", bookList);
            request.getRequestDispatcher("menu.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Failed to load books: " + e.getMessage());
            request.getRequestDispatcher("menu.jsp").forward(request, response);
        }
    }
}