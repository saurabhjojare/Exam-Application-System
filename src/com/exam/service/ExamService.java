package com.exam.service;

import com.exam.repository.ExamRepository;
import com.exam.model.ExamModel;
import java.util.*;

public class ExamService {
    ExamRepository examRepo = new ExamRepository();

    public int isAddExam(ExamModel model) {

        if (examRepo.isExamPresent(model.getName())) {
            return -1;
        }
        else if(examRepo.isAddExam(model))
        {
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

    public boolean isSetSchedule(ExamModel model) {
        Date  d = new Date();
        System.out.println(d.toLocaleString());
        return false;
    }

}
