package com.exam.repository;
import java.sql.*;

public class DBConfig {
    protected Connection conn;
    protected PreparedStatement stmt;
    protected ResultSet rs;
    
    public DBConfig() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ExamApplicationSystem","root","Saurabh@148");
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
