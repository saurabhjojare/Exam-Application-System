package com.exam.csv;

import java.io.*;
import java.sql.*;

public class ReadCSVLoadInDB {
    public static void main(String[] args) {
        String filePath = "C:\\Users\\Saurabh\\Downloads\\Tech Hub\\Java\\Project\\Exam-Application-System\\src\\com\\exam\\csv\\emp.csv";

        try (FileReader fr = new FileReader(filePath);
                BufferedReader br = new BufferedReader(fr);
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/techhub", "root", "root")) {

            if (conn != null) {
                boolean success = false;
                String line;

                while ((line = br.readLine()) != null) {
                    String[] cols = line.split(",");

                    try (PreparedStatement stmt = conn.prepareStatement("INSERT INTO emp (name, salary) VALUES (?, ?)")) {
                        stmt.setString(1, cols[0]);
                        stmt.setInt(2, Integer.parseInt(cols[1]));
                        int value = stmt.executeUpdate();
                        if (value > 0) {
                            success = true;
                        }
                    } catch (SQLException e) {
                        System.out.println("Error executing SQL statement: " + e.getMessage());
                    }
                }

                if (success) {
                    System.out.println("Data uploaded successfully.");
                } else {
                    System.out.println("Failed to upload data.");
                }
            } else {
                System.out.println("Not Connected to Database");
            }

        } catch (IOException | SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
}
