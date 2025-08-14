package servlet;

import bean.BookBean;
import dao.BookDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/EditBookServlet")
public class EditBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String action = request.getParameter("action");
            int id = Integer.parseInt(request.getParameter("id"));
            BookDAO dao = new BookDAO();

            if ("update".equals(action)) {
                String name = request.getParameter("book_name");
                double amount = Double.parseDouble(request.getParameter("amount"));
                String language = request.getParameter("language");

                BookBean book = new BookBean();
                book.setId(id);
                book.setBookName(name);
                book.setAmount(amount);
                book.setLanguage(language);

                dao.updateBook(book);
                request.setAttribute("message", "Book updated successfully.");
            } else if ("delete".equals(action)) {
                dao.deleteBook(id);
                request.setAttribute("message", "Book deleted successfully.");
            }

            request.getRequestDispatcher("edit_book.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Operation failed: " + e.getMessage());
            request.getRequestDispatcher("edit_book.jsp").forward(request, response);
        }
    }
}
