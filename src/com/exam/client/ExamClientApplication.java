package com.exam.client;

import java.util.Scanner;
import java.io.*;
import com.exam.model.QuestionModel;
import com.exam.model.SubjectModel;
import com.exam.service.QuestionService;
import com.exam.service.SubjectService;
import java.lang.NumberFormatException;


public class ExamClientApplication {
    public static void main(String x[]) {
        SubjectService sv = new SubjectService();
        QuestionService qService = new QuestionService();

        do {
            System.out.println("1: Add New Subject ");
            System.out.println("2: Add New Question ");
            System.out.println("3: Add Bulk Question ");

            System.out.println("Enter Your Choice ");
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

                default:
                    System.out.println("Wrong Choice");
                    break;
            }

        } while (true);
    }
}
