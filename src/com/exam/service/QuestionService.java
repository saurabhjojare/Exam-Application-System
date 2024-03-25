package com.exam.service;

import java.io.*;
import java.util.*;

import com.exam.helper.PathHelper;
import com.exam.model.QuestionModel;
import com.exam.repository.QuestionRepository;

public class QuestionService {
    QuestionRepository qRepo = new QuestionRepository();
    SubjectService ss = new SubjectService();

    public boolean isAddQuestion(QuestionModel qModel, String subName) {
        return qRepo.isAddQuestion(qModel, subName);
    }

    public boolean createFiles() {
        try {
            String path = "C:\\Users\\Saurabh\\Downloads\\Tech Hub\\Java\\Project\\Exam-Application-System\\src\\com\\exam\\csv\\QuestionBank";
            File f = new File(path);
            if (!f.exists()) {
                f.mkdir();
            }
            List<String> subList = ss.getAllSubjects();
            if (subList != null) {
                for (String subName : subList) {
                    f = new File(path + "\\" + subName + ".csv");
                    if (!f.exists()) {
                        f.createNewFile();
                    }
                }
            } else {
                System.out.println("Subject Not Found");
            }
        } catch (Exception e) {
            System.out.println("Error is " + e);
        }
        return true;
    }

    public boolean uploadBulkQuestion(String subName) {
        boolean b = this.createFiles();
        if (b) {
            File f = new File(
                    "C:\\Users\\Saurabh\\Downloads\\Tech Hub\\Java\\Project\\Exam-Application-System\\src\\com\\exam\\csv\\QuestionBank");
            File[] fileList = f.listFiles();
            boolean flag = false;
            for (File file : fileList) {
                if (file.isFile()) {
                    int index = file.toString().indexOf(subName);
                    if (index != -1) {
                        flag = true;
                        break;
                    }
                }
            }
            if (flag) {
                try {
                    FileReader fr = new FileReader(PathHelper.filePath + "\\" + subName + ".csv");
                    BufferedReader br = new BufferedReader(fr);
                    String question;
                    flag = false;
                    while ((question = br.readLine()) != null) {
                        String qwithop[] = question.split(",");
                        flag = qRepo.uploadBulkQuestion(qwithop, subName);
                    }
                    br.close(); 
                } catch (Exception e) {
                    System.out.println(e);
                    e.printStackTrace();
                } 
            } else {
                System.out.println("Subject File Not Found");
            }
            return true;
        } else {
            return false;
        }
    }

    public List<QuestionModel> getQuestionsBySubjectId(String subjectId) {
        // You can include additional logic here if needed
        return qRepo.getQuestionsBySubjectId(subjectId);
    }
    

  
}
