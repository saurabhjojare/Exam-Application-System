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

    // Static initializer block to print properties only once
    static {
        try {
            // Accessing properties from PathHelper
            String driverClassName = PathHelper.properties.getProperty("driverClassName");
            String url = PathHelper.properties.getProperty("url");
            String userName = PathHelper.properties.getProperty("userName");
            String password = PathHelper.properties.getProperty("password");

            // Printing properties
            System.out.println("driverClassName: " + driverClassName);
            System.out.println("userName: " + userName);
            System.out.println("url: " + url);
            System.out.println("password: " + password);
        } catch (Exception e) {
            System.out.println("Exception occurred while printing database properties: ");
            e.printStackTrace(); // Print full stack trace for debugging
        }
    }

    public DBConfig() {
        try {
            // Loading the JDBC driver
            String driverClassName = PathHelper.properties.getProperty("driverClassName");
            Class.forName(driverClassName);

            // Establishing database connection
            String url = PathHelper.properties.getProperty("url");
            String userName = PathHelper.properties.getProperty("userName");
            String password = PathHelper.properties.getProperty("password");
            conn = DriverManager.getConnection(url, userName, password);
        } catch (Exception e) {
            System.out.println("Exception occurred while connecting to the database: ");
            e.printStackTrace(); // Print full stack trace for debugging
        }
    }
}
