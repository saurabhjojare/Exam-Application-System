package com.exam.repository;

import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.sql.*;

import com.exam.helper.PathHelper;

public class DBConfig {
    protected Connection conn;
    protected PreparedStatement stmt;
    protected ResultSet rs;

    public DBConfig() {
        try {
            PathHelper phelp = new PathHelper();
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ExamApplicationSystem", "root",
                    "Saurabh@148");
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
