package com.exam.client;

import java.util.Scanner;

import com.exam.model.SubjectModel;
import com.exam.service.SubjectService;

public class ExamClientApplication {
    public static void main(String x[]) {
        SubjectService sv = new SubjectService();
        do {
            System.out.println("1: Add New Subject ");

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

                default:
                    System.out.println("Wrong Choice");
                    break;
            }

        } while (true);
    }
}
