package com.exam.repository;

import java.sql.Date;
//import java.util.Date;
import java.util.ArrayList;
import java.util.List;

import com.exam.model.ExamModel;
import com.exam.model.ScheduleModel;
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

            examDate = sModel.getExamDate().toString();
            String d[] = examDate.split(",");
    
            String[] dateSplit = d[0].split("-");

            // System.out.println("Printing "+dateSplit[0] + "\t" + dateSplit[1] + "\t" + dateSplit[2]);
            int months[] = new int[] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 };
            int m = 1;
            switch (dateSplit[1]) { // Mapping month string to integer
                case "Jan":
                    m = 1;
                    break;
                case "Feb":
                    m = 2;
                    break;
                case "Mar":
                    m = 3;
                    break;
                case "Apr":
                    m = 4;
                    break;
                case "May":
                    m = 5;
                    break;
                case "Jun":
                    m = 6;
                    break;
                case "Jul":
                    m = 7;
                    break;
                case "Aug":
                    m = 8;
                    break;
                case "Sep":
                    m = 9;
                    break;
                case "Oct":
                    m = 10;
                    break;
                case "Nov":
                    m = 11;
                    break;
                case "Dec":
                    m = 12;
                    break;
                default:
                    System.out.println("Wrong Input Date");
                    break;
            }
            // String newYear = dateSplit[2].substring(2, dateSplit[2].length());

           sqlDate = new Date(Integer.parseInt(dateSplit[2]) - 1900, m - 1, Integer.parseInt(dateSplit[0]));

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
}
