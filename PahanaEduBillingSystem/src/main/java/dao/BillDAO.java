package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.BillBean;

public class BillDAO {
    private Connection conn;

    public BillDAO() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pahana_billing", "root", "123456789");
    }

    public boolean saveBill(BillBean bill) throws Exception {
        String sql = "INSERT INTO bill (username, book_name, language, amount, quantity, total) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1, bill.getUsername());
        pst.setString(2, bill.getBookName());
        pst.setString(3, bill.getLanguage());
        pst.setDouble(4, bill.getAmount());
        pst.setInt(5, bill.getQuantity());
        pst.setDouble(6, bill.getTotal());
        return pst.executeUpdate() > 0;
    }
    
    public List<BillBean> getBillsByUsername(String username) throws Exception {
        List<BillBean> bills = new ArrayList<>();
        String sql = "SELECT * FROM bill WHERE username = ?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1, username);
        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            BillBean bill = new BillBean();
            bill.setBookName(rs.getString("book_name"));
            bill.setLanguage(rs.getString("language"));
            bill.setAmount(rs.getDouble("amount"));
            bill.setQuantity(rs.getInt("quantity"));
            bill.setTotal(rs.getDouble("total"));
            bills.add(bill);
        }
        return bills;
    }

    
}


		