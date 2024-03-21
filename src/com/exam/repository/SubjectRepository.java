package com.exam.repository;

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
}
