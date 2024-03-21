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
        // Path to the CSV file
        String filePath = "C:\\Users\\Saurabh\\Downloads\\Tech Hub\\Java\\Project\\Exam-Application-System\\src\\com\\exam\\csv\\student.csv";

        try (
                // FileReader to read the CSV file
                FileReader fr = new FileReader(filePath);
                BufferedReader br = new BufferedReader(fr);
                // Establishing a connection to the MySQL database
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/examapplicationsystem",
                        "root", "root")) {
            // Checking if the database connection is successful
            if (conn != null) {
                boolean success = false;
                String line;

                // Reading each line from the CSV file
                while ((line = br.readLine()) != null) {
                    // Splitting the line into columns using comma as delimiter
                    String[] cols = line.split(",");

                    // Checking if the line has the expected number of columns
                    if (cols.length >= 6) {
                        try (
                                // Creating a PreparedStatement for inserting data into the database
                                PreparedStatement stmt = conn.prepareStatement(
                                        "INSERT INTO student (stid, name, email, contact, username, password) VALUES (?, ?, ?, ?, ?, ?)")) {
                            // Setting values for the PreparedStatement parameters
                            stmt.setInt(1, Integer.parseInt(cols[0])); // stid
                            stmt.setString(2, cols[1].trim()); // Name
                            stmt.setString(3, cols[2].trim()); // Email
                            stmt.setString(4, cols[3].trim()); // Contact
                            stmt.setString(5, cols[4].trim().toLowerCase()); // Username (converted to lowercase)
                            stmt.setString(6, cols[5].trim()); // Password
                            // Executing the SQL statement
                            int value = stmt.executeUpdate();
                            // Checking if the execution was successful
                            if (value > 0) {
                                success = true;
                            }
                        } catch (SQLException e) {
                            // Handling SQL exceptions
                            System.out.println("Error executing SQL statement: " + e.getMessage());
                        } catch (NumberFormatException e) {
                            // Handling the case where stid is not a valid integer
                            System.out.println("Invalid student ID: " + cols[0]);
                        }
                    } else {
                        // Log or handle the case where the line doesn't have enough columns
                        System.out.println("Line does not have enough columns: " + line);
                    }
                }

                // Printing upload status
                if (success) {
                    System.out.println("Data uploaded successfully.");
                } else {
                    System.out.println("Failed to upload data.");
                }
            } else {
                // If connection to database fails
                System.out.println("Not Connected to Database");
            }

        } catch (IOException | SQLException e) {
            // Handling IO and SQL exceptions
            System.out.println("Error: " + e.getMessage());
        }
    }
}
