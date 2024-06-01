package com.exam.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBConfig {

    protected Connection conn;
    protected PreparedStatement stmt;
    protected ResultSet rs;

    public DBConfig() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ExamApplicationSystem", "root", "root");
            ensureAdminUserExists();
        } catch (Exception ex) {
            System.out.print(ex);
        }
    }

    private void ensureAdminUserExists() {
        String checkQuery = "SELECT COUNT(*) FROM admin WHERE fullName = ? AND password = ? AND contact = ? AND email = ? AND role = ? AND department = ? AND permissions = ?";
        String insertQuery = "INSERT INTO admin (fullName, password, contact, email, role, department, permissions) VALUES (?, ?, ?, ?, ?, ?, ?)";

        String fullName = "Saurabh Jojare";
        String password = "Saurabh@123";
        String contact = "+917083900700";
        String email = "saurabh.jojare@gmail.com";
        String role = "Administrator";
        String department = "IT Department";
        String permissions = "Full Access";

        try {
            stmt = conn.prepareStatement(checkQuery);
            stmt.setString(1, fullName);
            stmt.setString(2, password);
            stmt.setString(3, contact);
            stmt.setString(4, email);
            stmt.setString(5, role);
            stmt.setString(6, department);
            stmt.setString(7, permissions);

            rs = stmt.executeQuery();
            rs.next();

            int count = rs.getInt(1);

            if (count == 0) {
                stmt = conn.prepareStatement(insertQuery);
                stmt.setString(1, fullName);
                stmt.setString(2, password);
                stmt.setString(3, contact);
                stmt.setString(4, email);
                stmt.setString(5, role);
                stmt.setString(6, department);
                stmt.setString(7, permissions);

                stmt.executeUpdate();
            }

        } catch (Exception ex) {
            System.out.print(ex);
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
            } catch (Exception ex) {
                System.out.print(ex);
            }
        }
    }
}
