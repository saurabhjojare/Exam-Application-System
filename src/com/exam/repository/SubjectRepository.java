package com.exam.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.exam.model.SubjectModel;

public class SubjectRepository extends DBConfig {
    List<String> list = new ArrayList<>();

    // Method to add a subject to the database
    public boolean isAddSubject(SubjectModel model) {
        try {
            // Prepare SQL statement to insert a new subject
            stmt = conn.prepareStatement("insert into subject values('0',?)");
            stmt.setString(1, model.getName());
            // Execute the SQL statement
            int value = stmt.executeUpdate();
            // If insertion is successful, return true, else return false
            return value > 0;
        } catch (Exception e) {
            // If an exception occurs, print the error and return false
            System.out.println(e);
            return false;
        }
    }

    // Method to check if a subject with given name already exists
    public boolean isSubjectPresent(String subName) {
        try {
            // Prepare SQL statement to select subject by name
            stmt = conn.prepareStatement("select * from subject where subjectname = ?");
            stmt.setString(1, subName);
            // Execute the SQL statement
            rs = stmt.executeQuery();
            // If a result is found, return true, else return false
            return rs.next();
        } catch (Exception e) {
            // If an exception occurs, return false
            return false;
        }
    }

    // Method to retrieve all subjects from the database
    public List<String> getAllSubjects() {
        try {
            // Prepare SQL statement to select all subjects
            stmt = conn.prepareStatement("select subjectname from subject");
            // Execute the SQL statement
            rs = stmt.executeQuery();
            // Iterate through the result set and add subject names to the list
            while (rs.next()) {
                list.add(rs.getString(1));
            }
            // If list is not empty, return the list, else return null
            return list.size() > 0 ? list : null;
        } catch (Exception e) {
            // If an exception occurs, print the error and return null
            System.out.println("Error is " + e);
            return null;
        }
    }

    public int getSidFromSchid(int schid) {
        int sid = -1; // Default value if no record is found

        try {
            stmt = conn.prepareStatement("SELECT sid FROM schedule WHERE schid = ?");

            stmt.setInt(1, schid);

            rs = stmt.executeQuery();
            if (rs.next()) {
                sid = rs.getInt("sid");
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Handle SQLException properly
        }

        return sid;
    }

    public int getSubjectIdBySubjectName(String subjectName) {
        try {
            stmt = conn.prepareStatement("SELECT sid FROM subject WHERE subjectname = ?");
            stmt.setString(1, subjectName);
            rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1); // Return the retrieved subject ID
            } else {
                return -1; // Return -1 if subject is not found
            }

        } catch (Exception e) {
            e.printStackTrace();
            return -1; // Return -1 if an exception occurs
        }
    }

    // Method to retrieve subject name by subject ID from the database
    public String getSubjectNameById(int id) {
        try {
            stmt = conn.prepareStatement("select subjectname from subject where sid = ?");
            stmt.setInt(1, id);
            rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getString(1); // Return the retrieved subject name
            } else {
                return null; // Return null if subject is not found
            }

        } catch (Exception e) {
            System.out.println(e);
            return null; // Return null if an exception occurs
        }
    }

    public int getStidByName(String studentName) {
    int stid = -1; // Default value in case no student is found

    try {
        stmt = conn.prepareStatement("SELECT stid FROM student WHERE name=?");
        stmt.setString(1, studentName);
        rs = stmt.executeQuery();

        // Check if any result is returned
        if (rs.next()) {
            stid = rs.getInt("stid");
        } else {
            System.out.println("No student found with the name: " + studentName);
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    return stid;
}


    // Method to add a student ID and subject ID into studentsubjectjoin table
    public boolean addStudentSubject(int studentId, int subjectId) {
        try {
            // Prepare SQL statement for insertion
            String sql = "INSERT INTO studentsubjectjoin (stid, sid) VALUES (?, ?)";
            stmt = conn.prepareStatement(sql);
            
            // Set parameters
            stmt.setInt(1, studentId);
            stmt.setInt(2, subjectId);
            
            // Execute the SQL statement
            int rowsAffected = stmt.executeUpdate();
            
            // Check if insertion was successful
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false; // Return false if an exception occurs
        } finally {
            // Close the prepared statement
            try {
                if (stmt != null) {
                    stmt.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public void updateStudentMarks(int stid, int schid, double obtainedPercentage, double status) {
        
            // Establish connection
            try  {
                // Prepare SQL statement for insertion
                String sql = "INSERT INTO studentexamrelation (stid, schid, obtainedpercentage, status) VALUES (?, ?, ?, ?)";
                stmt = conn.prepareStatement(sql);
                    // Set values for parameters
                    stmt.setInt(1, stid);
                    stmt.setInt(2, schid);
                    stmt.setDouble(3, obtainedPercentage);
                    stmt.setDouble(4, status);

                    // Execute the statement
                    int rowsInserted = stmt.executeUpdate();
                    if (rowsInserted > 0) {
                        System.out.println("Student marks updated successfully.");
                }
            } catch (Exception e) {
                System.out.println();
            }
    }


}
