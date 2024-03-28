package com.exam.csv;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ReadCSVLoadInDB {
    public static void main(String[] args) {
        String filePath = "C:\\Users\\Saurabh\\Downloads\\Tech Hub\\Java\\Project\\Exam-Application-System\\src\\com\\exam\\csv\\student.csv";

        try (
                FileReader fr = new FileReader(filePath);
                BufferedReader br = new BufferedReader(fr);
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/examapplicationsystem",
                        "root", "root")) {
            if (conn != null) {
                boolean success = false;
                String line;

                while ((line = br.readLine()) != null) {
                    String[] cols = line.split(",");

                    if (cols.length >= 6) {
                        try (
                                PreparedStatement stmt = conn.prepareStatement(
                                        "INSERT INTO student (stid, name, email, contact, username, password) VALUES (?, ?, ?, ?, ?, ?)")) {
                            stmt.setInt(1, Integer.parseInt(cols[0])); 
                            stmt.setString(2, cols[1].trim()); 
                            stmt.setString(3, cols[2].trim()); 
                            stmt.setString(4, cols[3].trim()); 
                            stmt.setString(5, cols[4].trim().toLowerCase()); 
                            stmt.setString(6, cols[5].trim()); 
                            int value = stmt.executeUpdate();
                            if (value > 0) {
                                success = true;
                            }
                        } catch (SQLException e) {
                            System.out.println("Error executing SQL statement: " + e.getMessage());
                        } catch (NumberFormatException e) {
                            System.out.println("Invalid student ID: " + cols[0]);
                        }
                    } else {
                        System.out.println("Line does not have enough columns: " + line);
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
