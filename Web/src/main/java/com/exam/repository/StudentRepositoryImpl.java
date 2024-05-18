package com.exam.repository;

import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.exam.config.DBConfig;
import com.exam.model.StudentModel;

public class StudentRepositoryImpl extends DBConfig implements StudentRepository {

    @Override
    public List<StudentModel> getStudentByUsername(String username) {
        List<StudentModel> listStudent = new ArrayList<>();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            stmt = conn.prepareStatement("SELECT * FROM student WHERE username = ?");
            stmt.setString(1, username);
            rs = stmt.executeQuery();

            while (rs.next()) {
                StudentModel model = new StudentModel();
                model.setStid(rs.getInt("stid"));
                model.setName(rs.getString("name"));
                model.setEmail(rs.getString("email"));
                model.setContact(rs.getString("contact"));
                model.setUsername(rs.getString("username"));
                model.setPassword(rs.getString("password"));
                listStudent.add(model);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Consider using a logging framework
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
            } catch (SQLException e) {
                e.printStackTrace(); // Consider using a logging framework
            }
        }

        return listStudent.isEmpty() ? null : listStudent;
    }
    
    
    @Override
    public boolean insertStudentExamRelation(int stid, int schid, double obtainedPercentage, double status) {
        PreparedStatement stmt = null;

        try {
            stmt = conn.prepareStatement("INSERT INTO studentexamrelation (stid, schid, obtainedpercentage, status) VALUES (?, ?, ?, ?)");
            stmt.setInt(1, stid);
            stmt.setInt(2, schid);
            stmt.setDouble(3, obtainedPercentage);
            stmt.setDouble(4, status);
            
            int rowsAffected = stmt.executeUpdate();
            
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace(); // Consider using a logging framework
        } finally {
            try {
                if (stmt != null) stmt.close();
            } catch (SQLException e) {
                e.printStackTrace(); // Consider using a logging framework
            }
        }

        return false;
    }
}
