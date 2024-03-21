package com.exam.service;

import com.exam.repository.ExamRepository;
import com.exam.model.ExamModel;
import com.exam.model.ScheduleModel;

import java.util.*;
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
        String[] s = d.toLocaleString().split(",");
        String dsplit[] = s[0].split("-");
        ScheduleModel sModel = model.getScheduleModel();

        Date userDate = sModel.getExamDate();
        String userDateArr[] = userDate.toLocaleString().split(",");
        String userDates[] = userDateArr[0].split("-");
        if (Integer.parseInt(userDates[2]) >= Integer.parseInt(dsplit[2]) && userDates[1].equals(dsplit[1])) {
            if (Integer.parseInt(userDates[0]) >= Integer.parseInt(dsplit[0])) {
                System.out.println("You Can Schedule Exam");
                return examRepo.isSetSchedule(model, subName) ? true : false;
            } else {
                System.out.println("Enter Valid Date");
            }
        } else {
            System.out.println("Previous Year Or Month");
        }
        return false;
    }

}
