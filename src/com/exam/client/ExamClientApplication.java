package com.exam.client;

import java.util.*;
import java.io.*;

import com.exam.model.ExamModel;
import com.exam.model.QuestionModel;
import com.exam.model.ScheduleModel;
import com.exam.model.SubjectModel;
import com.exam.service.ExamService;
import com.exam.service.QuestionService;
import com.exam.service.SubjectService;
import java.lang.NumberFormatException;

public class ExamClientApplication {
    public static void main(String x[]) {
        SubjectService sv = new SubjectService();
        QuestionService qService = new QuestionService();
        ExamService examService = new ExamService();

        do {
            System.out.println("1: Add New Subject ");
            System.out.println("2: Add New Question ");
            System.out.println("3: Add Bulk Questions ");
            System.out.println("4: Add Exam ");
            System.out.println("5: Create Exam Schedule ");

            System.out.print("Enter Your Choice ");
            Scanner sc = new Scanner(System.in);
            int choice = sc.nextInt();

            switch (choice) {
                case 1:
                    sc.nextLine();
                    System.out.println("Enter Subject Name");
                    String subName = sc.nextLine();

                    SubjectModel model = new SubjectModel();
                    model.setName(subName);

                    int result = sv.addSubject(model);
                    if (result == 1) {
                        System.out.println("Subject Added");
                    } else if (result == -1) {
                        System.out.println("Subject Already Added");
                    } else {
                        System.out.println("Something is Wrong");
                    }

                    break;

                case 2:
                    sc.nextLine();
                    System.out.println("Enter Question");
                    String question = sc.nextLine();

                    System.out.println("Enter Option 1");
                    String op1 = sc.nextLine();

                    System.out.println("Enter Option 2");
                    String op2 = sc.nextLine();

                    System.out.println("Enter Option 3");
                    String op3 = sc.nextLine();

                    System.out.println("Enter Option 4");
                    String op4 = sc.nextLine();

                    System.out.println("Enter Option As Answer");
                    int answer = sc.nextInt();
                    sc.nextLine();

                    System.out.println("Enter Subject Name ");
                    subName = sc.nextLine();
                    System.out.println("Subject Name: " + subName); // Debug statement

                    QuestionModel qModel = new QuestionModel(question, op1, op2, op3, op4, answer);
                    boolean b = qService.isAddQuestion(qModel, subName);

                    if (b) {
                        System.out.println("Question Added");
                    } else {
                        System.out.println("Something Wrong");
                    }
                    break;

                case 3:
                    sc.nextLine();
                    System.out.println("Enter Subject Name To Store");
                    String subname = sc.nextLine();
                    qService.uploadBulkQuestion(subname);
                    break;

                case 4:
                    sc.nextLine();
                    System.out.println("Enter Exam Name");
                    String examName = sc.nextLine();
                    System.out.println("Total Marks");
                    int totalMarks = sc.nextInt();
                    System.out.println("Passing Marks");
                    int passMarks = sc.nextInt();

                    ExamModel examModel = new ExamModel(examName, totalMarks, passMarks);
                    result = examService.isAddExam(examModel);
                    if (result == 1) {
                        System.out.println("Exam Added");
                    } else if (result == -1) {
                        System.out.println("Exam Already Present");
                    } else {
                        System.out.println("Exam Not Added");
                    }

                    break;

                case 5:
                    sc.nextLine();
                    List<ExamModel> list = examService.getAllExam();
                    System.out.println("List Of Exams \nSelect 1 For Schedule\n");
                    for (ExamModel m : list) {
                        System.out.println(String.format("%-5s %-12s  %-5s  %s", m.getId(), m.getName(),
                                m.getTotalMarks(), m.getPassingMarks()));

                    }
                    System.out.println();
                    System.out.println("Enter Exam Name For Schedule");
                    examName = sc.nextLine();
                    ExamModel eModel = examService.getExamIdByName(examName);
                    if (eModel != null) {
                        System.out.println("Enter Exam Date");
                        String dateFormat = sc.nextLine();
                        Date d1 = new Date(dateFormat);

                        System.out.println("Enter Start Time");
                        String startTime = sc.nextLine();
                        
                        System.out.println("Enter End Time");
                        String endTime = sc.nextLine();
                        
                        ScheduleModel sModel = new ScheduleModel();
                        sModel.setExamDate(d1);
                        sModel.setStartTime(startTime);
                        sModel.setEndTime(endTime);
                        sModel.setExamid(eModel.getId());
                        eModel.setScheduleModel(sModel);

                    } else {
                        System.out.println("Enter Correct Exam");
                    }
                    break;
                default:
                    System.out.println("Wrong Choice");
                    break;
            }

        } while (true);
    }
}
