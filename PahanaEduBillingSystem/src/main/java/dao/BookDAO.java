package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import bean.BookBean;

public class BookDAO {
    private Connection conn;

    public BookDAO() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pahana_billing", "root", "123456789");
    }

    // Add new book to the database
    public boolean addBook(BookBean book) throws Exception {
        String sql = "INSERT INTO books (book_name, amount, language) VALUES (?, ?, ?)";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1, book.getBookName());
        pst.setDouble(2, book.getAmount());
        pst.setString(3, book.getLanguage());

        return pst.executeUpdate() > 0;
    }

    // Fetch all books from the database
    public List<BookBean> getAllBooks() throws Exception {
        List<BookBean> books = new ArrayList<>();
        String sql = "SELECT * FROM books";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);

        while (rs.next()) {
            BookBean book = new BookBean();
            book.setId(rs.getInt("book_id")); 
            book.setBookName(rs.getString("book_name"));
            book.setAmount(rs.getDouble("amount"));
            book.setLanguage(rs.getString("language"));
            books.add(book);
        }
        return books;
    }
    
 // ADD THESE METHODS to your existing BookDAO.java

 // Update book details
 public boolean updateBook(BookBean book) throws Exception {
     String sql = "UPDATE books SET book_name = ?, amount = ?, language = ? WHERE book_id = ?";
     PreparedStatement pst = conn.prepareStatement(sql);
     pst.setString(1, book.getBookName());
     pst.setDouble(2, book.getAmount());
     pst.setString(3, book.getLanguage());
     pst.setInt(4, book.getId());
     return pst.executeUpdate() > 0;
 }

 // Delete book
 public boolean deleteBook(int id) throws Exception {
     String sql = "DELETE FROM books WHERE book_id = ?";
     PreparedStatement pst = conn.prepareStatement(sql);
     pst.setInt(1, id);
     return pst.executeUpdate() > 0;
 }

    
}
