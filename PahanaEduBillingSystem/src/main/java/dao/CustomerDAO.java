package dao;

import java.sql.*;
import bean.CustomerBean;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class CustomerDAO {
    private Connection conn;

    public CustomerDAO() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pahana_billing", "root", "123456789");
    }

    // Generate the next account number
    public String generateAccountNumber() throws Exception {
        String query = "SELECT COUNT(*) FROM users";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        rs.next();
        int count = rs.getInt(1) + 1;
        return String.format("pahana %02d", count);
    }

    // Register user
    public boolean registerUser(CustomerBean bean) throws Exception {
        String hashedPassword = hashPassword(bean.getPassword());
        String query = "INSERT INTO users (account_number, username, address, telephone, password) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement pst = conn.prepareStatement(query);
        pst.setString(1, bean.getAccountNumber());
        pst.setString(2, bean.getUsername());
        pst.setString(3, bean.getAddress());
        pst.setString(4, bean.getTelephone());
        pst.setString(5, hashedPassword);
        return pst.executeUpdate() > 0;
    }

    
    public boolean isUsernameExists(String username) throws SQLException {
        String query = "SELECT username FROM users WHERE username = ?";
        PreparedStatement pst = conn.prepareStatement(query);
        pst.setString(1, username);
        ResultSet rs = pst.executeQuery();
        return rs.next(); // Returns true if username already exists
    }

    
    private String hashPassword(String password) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] result = md.digest(password.getBytes());
        StringBuilder sb = new StringBuilder();
        for (byte b : result) {
            sb.append(String.format("%02x", b));
        }
        return sb.toString();
    }
    
 // Fetch current user info
    public CustomerBean getCustomerByUsername(String username) throws Exception {
        String sql = "SELECT * FROM users WHERE username = ?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1, username);
        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            CustomerBean bean = new CustomerBean();
            bean.setAccountNumber(rs.getString("account_number"));
            bean.setUsername(rs.getString("username"));
            bean.setAddress(rs.getString("address"));
            bean.setTelephone(rs.getString("telephone"));
            bean.setPassword(rs.getString("password")); // optional
            return bean;
        }
        return null;
    }

    // Update customer info
    public boolean updateCustomer(String username, String address, String telephone, String password) throws Exception {
        String hashedPassword = hashPassword(password);
        String sql = "UPDATE users SET address = ?, telephone = ?, password = ? WHERE username = ?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1, address);
        pst.setString(2, telephone);
        pst.setString(3, hashedPassword);
        pst.setString(4, username);
        return pst.executeUpdate() > 0;
    }

    
}
