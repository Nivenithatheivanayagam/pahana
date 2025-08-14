package servlet;

import bean.BookBean;
import dao.BookDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/NewBookServlet")
public class NewBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String bookName = request.getParameter("bookName");
            String amountStr = request.getParameter("amount");
            String language = request.getParameter("language");

            if (bookName == null || bookName.isEmpty() ||
                amountStr == null || amountStr.isEmpty() ||
                language == null || language.isEmpty()) {

                request.setAttribute("error", "All fields are required.");
                request.getRequestDispatcher("new_book.jsp").forward(request, response);
                return;
            }

            double amount = Double.parseDouble(amountStr);

            BookBean book = new BookBean();
            book.setBookName(bookName);
            book.setAmount(amount);
            book.setLanguage(language);

            BookDAO dao = new BookDAO();
            boolean success = dao.addBook(book);

            if (success) {
                request.setAttribute("message", "Book added successfully!");
            } else {
                request.setAttribute("error", "Failed to add book.");
            }

            request.getRequestDispatcher("new_book.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Internal error: " + e.getMessage());
            request.getRequestDispatcher("new_book.jsp").forward(request, response);
        }
    }
}
