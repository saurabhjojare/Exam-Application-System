package com.exam.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.exam.helper.PathHelper;

public class DBConfig {
    protected Connection conn;
    protected PreparedStatement stmt;
    protected ResultSet rs;

    static {
        try {
            String driverClassName = PathHelper.properties.getProperty("driverClassName");
            String url = PathHelper.properties.getProperty("url");
            String userName = PathHelper.properties.getProperty("userName");
            String password = PathHelper.properties.getProperty("password");
        } catch (Exception e) {
            System.out.println("Exception occurred while printing database properties: ");
            e.printStackTrace(); 
        }
    }

    public DBConfig() {
        try {
            String driverClassName = PathHelper.properties.getProperty("driverClassName");
            Class.forName(driverClassName);

            String url = PathHelper.properties.getProperty("url");
            String userName = PathHelper.properties.getProperty("userName");
            String password = PathHelper.properties.getProperty("password");
            conn = DriverManager.getConnection(url, userName, password);
        } catch (Exception e) {
            System.out.println("Exception occurred while connecting to the database: ");
            e.printStackTrace(); 
        }
    }
}
