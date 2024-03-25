package com.exam.repository;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//import java.util.Date;
import java.util.ArrayList;
import java.util.List;

import com.exam.model.ExamModel;
import com.exam.model.ScheduleModel;
import com.exam.model.StudentModel;

import java.text.SimpleDateFormat;



public class ExamRepository extends DBConfig {

    List<ExamModel> listExams = new ArrayList<ExamModel>(); // List to store ExamModels
    QuestionRepository qRepo = new QuestionRepository(); // Repository for handling questions

    // Method to check if an exam with given name exists
    public boolean isExamPresent(String examName) {
        try {
            stmt = conn.prepareStatement("select * from exam where examname = ?");
            stmt.setString(1, examName);
            rs = stmt.executeQuery();
            return rs.next(); // Returns true if exam is present, else false
        } catch (Exception e) {
            System.out.println("Error in isExamPresent: " + e.getMessage());
            return false;
        }
    }

    // Method to add a new exam
    public boolean isAddExam(ExamModel model) {
        try {
            stmt = conn.prepareStatement("insert into exam (examname, totalmarks, passingmarks) values (?,?,?)");
            stmt.setString(1, model.getName());
            stmt.setInt(2, model.getTotalMarks());
            stmt.setInt(3, model.getPassingMarks());

            int value = stmt.executeUpdate();
            return value > 0; // Returns true if insertion successful, else false
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    // Method to get all exams from the database
    public List<ExamModel> getAllExam() {
        try {
            stmt = conn.prepareStatement("Select * from exam");
            rs = stmt.executeQuery();
            while (rs.next()) {
                ExamModel model = new ExamModel();
                model.setId(rs.getInt(1));
                model.setName(rs.getString(2));
                model.setTotalMarks(rs.getInt(3));
                model.setPassingMarks(rs.getInt(4));
                listExams.add(model);
            }
            return listExams.size() > 0 ? listExams : null; // Returns list of exams if not empty, else null
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    // Method to get exam by name
    public ExamModel getExamIdByName(String name) {
        try {
            stmt = conn.prepareStatement("select * from exam where examname = '" + name + "'");
            rs = stmt.executeQuery();
            ExamModel model = null;
            System.out.println("Name From ExamRepo " + name);

            if (rs.next()) {
                model = new ExamModel();
                
                    model.setId(rs.getInt(1));
                    model.setName(rs.getString(2));
                    model.setTotalMarks(rs.getInt(3));
                    model.setPassingMarks(rs.getInt(4));
                
                return model != null ? model : null;
            }
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
        return null;
    }


    // Method to set schedule for an exam
    public boolean isSetSchedule(ExamModel model, String subName) {    
       String examDate = null;
       Date sqlDate = null;
       ScheduleModel sModel = model.getScheduleModel();
       int subId = qRepo.getSubjectIdByName(subName);
        try {
            //int subId = qRepo.getSubjectIdByName(subName);
            //ScheduleModel sModel = model.getScheduleModel();

            examDate = sModel.getExamDate();
            String[] dateSplit = examDate.split("/");

            int year = Integer.parseInt(dateSplit[0]);
            int month = Integer.parseInt(dateSplit[1]) - 1; // Subtracting 1 to match Java's month indexing (starts from 0)
            int day = Integer.parseInt(dateSplit[2]);
    
            sqlDate = new Date(year - 1900, month, day);
    

            System.out.println("SQL Date "+sqlDate);

            stmt = conn.prepareStatement("INSERT INTO schedule (examid, date, starttime, endtime, sid) VALUES (?, ?, ?, ?, ?)");

                    stmt.setInt(1, model.getId()); // Setting exam ID
                    stmt.setDate(2, sqlDate); // Setting exam date
                    stmt.setString(3, sModel.startTime); // Setting start time
                    stmt.setString(4, sModel.endTime); // Setting end time
                    stmt.setInt(5, subId); // Setting subject ID
                    
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0; // Returns true if insertion successful, else false

        } catch (Exception e) {
            System.out.println("isSetSchedule Error " + e);
            System.out.println("ID Repo "+ model.getId());    
            System.out.println("SQL Date Repo "+sqlDate);
            System.out.println("sModel.startTime: " + sModel.startTime);
            System.out.println("sModel.startTime: " + sModel.endTime);
            System.out.println("Subject ID "+subId);
            return false;
        }
    }

    // Method to check login 

    public boolean checkUsernameAndPassword(String username, String password) {
        PreparedStatement stmt = null;
        ResultSet rs = null;
        boolean userExists = false;

        try {
            // Prepare and execute the SQL query
            stmt = conn.prepareStatement("SELECT * FROM student WHERE username=? AND password=?");
            stmt.setString(1, username);
            stmt.setString(2, password);
            rs = stmt.executeQuery();

            // Check if a record with the provided username and password exists
            if (rs.next()) {
                userExists = true;
                System.out.println("Login successful!");
            } else {
                System.out.println("Invalid username or password.");
            }
        } catch (SQLException e) {
            // Handle any SQL exceptions
            System.out.println("Error: " + e.getMessage());
        } finally {
            // Close the PreparedStatement and ResultSet
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }

        return userExists;
    }


}
