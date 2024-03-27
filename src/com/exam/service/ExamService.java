package com.exam.service;

import com.exam.repository.ExamRepository;
import com.exam.model.ExamModel;
import com.exam.model.ScheduleModel;
import com.exam.model.StudentModel;

import java.util.*;
import java.sql.SQLException;
import java.text.DateFormatSymbols;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class ExamService {
    ExamRepository examRepo = new ExamRepository();

    public int isAddExam(ExamModel model) {

        if (examRepo.isExamPresent(model.getName())) {
            return -1;
        } else if (examRepo.isAddExam(model)) {
            return 1;
        } else {
            return 0;
        }
    }

    public List<ExamModel> getAllExam() {
        return examRepo.getAllExam();
    }

    public ExamModel getExamIdByName(String name) {
        return examRepo.getExamIdByName(name);

    }

    public boolean isSetSchedule(ExamModel model, String subName) {
        Date d = new Date();
        // Get the current date
        LocalDate currentDate = LocalDate.now();

        String[] s = d.toLocaleString().split(",");
        String dsplit[] = currentDate.toString().split("-");

        // System.out.println("DSplit " + Arrays.toString(dsplit));

        ScheduleModel sModel = model.getScheduleModel();

        String userDate = sModel.getExamDate();
        System.out.println("User Date is " + userDate);
        String userDateArr[] = userDate.split("/");
        // System.out.println("DateArr Year: " + userDateArr[0] + ", DateArr Month: " +
        // userDateArr[1] + ", DateArr Day: "+ userDateArr[2]);

        String userDates[] = userDateArr[0].split("-");
        // System.out.println("Year: " + userDates[0] + ", Month: " + userDates[1] + ",
        // Day: " + userDates[2]);

        int currentYear = Integer.parseInt(dsplit[0]);
        int currentMonth = Integer.parseInt(dsplit[1]);
        int currentDay = Integer.parseInt(dsplit[2]);

        int examYear = Integer.parseInt(userDateArr[0]);
        int examMonth = Integer.parseInt(userDateArr[1]);
        int examDay = Integer.parseInt(userDateArr[2]);

        if (examYear > currentYear ||
                (examYear == currentYear && examMonth > currentMonth) ||
                (examYear == currentYear && examMonth == currentMonth && examDay > currentDay)) {
            System.out.println("You Can Schedule Exam");
            return examRepo.isSetSchedule(model, subName) ? true : false;
        } else {
            System.out.println("Cannot Schedule Exam");
        }

        return false;
    }

    public int isUserPresent(StudentModel model) {
        if (examRepo.checkUsernameAndPassword(model.getUsername(), model.getPassword())) {
            return 1;
        } else {
            return 0;
        }
    }

    public boolean addUser(StudentModel model) {
        // Check if the user already exists
        if (isUserPresent(model) == 1) {
            return false;
        } else {
            // Call the method in ExamRepository to add the new user
            return examRepo.addUser(model);
        }
    }

    // Method to get Schedule ID by Exam ID
    public List<ScheduleModel> getExamSchedule(int examId) throws SQLException {
        return examRepo.getExamSchedule(examId);
    }

     // Method to get student ID by username
     public int getStidByUsername(String username) {
        int stid = -1; // Default value if not found
        try {
            // Retrieve stid from repository
            stid = examRepo.getStidByUsername(username);
        } catch (SQLException e) {
            // Handle database errors
            e.printStackTrace();
            // Optionally, throw custom exception or return an error code
        }
        return stid;
    }


}