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
    
    public List<String[]> fetchStudents() {
        List<String[]> studentData = new ArrayList<>();
        try {
            String query = "SELECT * FROM student";
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();

            while (rs.next()) {
                int sid = rs.getInt("sid");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String contact = rs.getString("contact");
                int courseId = rs.getInt("courseid");

                String[] studentRow = {String.valueOf(sid), name, email, contact, String.valueOf(courseId)};
                studentData.add(studentRow);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return studentData;
    }
    
    public List<String[]> fetchCourses() {
        List<String[]> courseData = new ArrayList<>();
        try {
            String query = "SELECT * FROM subject";
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();

            while (rs.next()) {
                int courseId = rs.getInt("sid");
                String courseName = rs.getString("subjectname");

                String[] courseRow = {String.valueOf(courseId), courseName};
                courseData.add(courseRow);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return courseData;
    }
    
    public List<String[]> fetchStudentsByCourse(int courseId) {
        List<String[]> studentData = new ArrayList<>();
        try {
            String query = "SELECT student.stid, student.name, student.email, student.contact, student.username " +
                           "FROM student " +
                           "JOIN studentsubjectjoin ON student.stid = studentsubjectjoin.stid " +
                           "JOIN subject ON studentsubjectjoin.sid = subject.sid " +
                           "WHERE subject.sid = ?";
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, courseId);
            rs = stmt.executeQuery();

            while (rs.next()) {
                int sid = rs.getInt("stid");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String contact = rs.getString("contact");
                String username = rs.getString("username");

                String[] studentRow = {String.valueOf(sid), name, email, contact, username};
                studentData.add(studentRow);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return studentData;
    }


}
