package com.exam.client;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

import com.exam.model.ExamModel;
import com.exam.model.QuestionModel;
import com.exam.model.ScheduleModel;
import com.exam.model.StudentModel;
import com.exam.model.SubjectModel;
import com.exam.repository.ExamRepository;
import com.exam.service.ExamService;
import com.exam.service.QuestionService;
import com.exam.service.SubjectService;

public class ExamClientApplication {
    public static void main(String x[]) {
        // Initialize services
        SubjectService sv = new SubjectService();
        QuestionService qService = new QuestionService();
        ExamService examService = new ExamService();

        // Main menu loop
        do {
            // Display menu options
            System.out.println("1: Register Subject ");
            System.out.println("2: Create Question ");
            System.out.println("3: Import Bulk Questions ");
            System.out.println("4: Create New Exam ");
            System.out.println("5: Create Exam Schedule ");
            System.out.println("6. Student Login");
            // System.out.println("Attempt Exam");
            // System.out.println("Show The Result");

            System.out.print("Enter Your Choice ");
            Scanner sc = new Scanner(System.in);
            int choice = sc.nextInt();

            switch (choice) {
                case 1:
                    // Add new subject
                    sc.nextLine(); // Consume newline
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
                    // Add new question
                    sc.nextLine(); // Consume newline
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

                    // Similar inputs for options 2, 3, and 4...

                    System.out.println("Enter Option As Answer");
                    int answer = sc.nextInt();
                    sc.nextLine(); // Consume newline

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
                    // Add bulk questions
                    sc.nextLine(); // Consume newline
                    System.out.println("Enter Subject Name To Store");
                    String subname = sc.nextLine();
                    qService.uploadBulkQuestion(subname);
                    break;

                case 4:
                    // Add new exam
                    sc.nextLine(); // Consume newline
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
                    // Create exam schedule
                    sc.nextLine(); // Consume newline
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
                    System.out.println(eModel.getName());

                    if (eModel != null) {
                        System.out.println("Enter Exam Date (dd-MMMM-yyyy)");
                        String dateFormat = sc.nextLine();

                        // Parse date
                        Date d1 = new Date(dateFormat);
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");

                        // Format the date using the SimpleDateFormat object
                        String formattedDate = sdf.format(d1);

                        System.out.println("Enter Start Time");
                        String startTime = sc.nextLine();

                        System.out.println("Enter End Time");
                        String endTime = sc.nextLine();

                        System.out.println("ID is " + eModel.getId());
                        System.out.println("Date is " + formattedDate);
                        System.out.println("Start Time is " + startTime);
                        System.out.println("End Time is " + endTime);

                        ScheduleModel sModel = new ScheduleModel();
                        sModel.setExamid(eModel.getId());
                        sModel.setExamDate(formattedDate);
                        sModel.setStartTime(startTime);
                        sModel.setEndTime(endTime);
                        eModel.setScheduleModel(sModel);
                        System.out.println("Enter Subject Name");
                        subName = sc.nextLine();
                        b = examService.isSetSchedule(eModel, subName);

                        if (b) {
                            System.out.println("Added Exam");
                        } else {
                            System.out.println("Not Added Exam");
                        }
                    }
                    break;

                case 6:
                    ExamRepository examRepo = new ExamRepository();
                    sc.nextLine();
                    System.out.println("Enter Username (Lowercase Letters)");
                    String username = sc.nextLine();

                    System.out.println("\nEnter Password");
                    String password = sc.nextLine();

                    // Creating a StudentModel object with the entered username and password
                    StudentModel studentModel = new StudentModel();
                    studentModel.setUsername(username);
                    studentModel.setPassword(password);

                    // Call the isUserPresent method from ExamService
                    result = examService.isUserPresent(studentModel);

                    if (result == 1) {
                        System.out.println("\nLogin successful");
                        // You may want to perform further actions here for a successful login
                    } else {
                        System.out.println("\nUser does not exist");
                        System.out.println("Create New Account? Press Y or N");
                        String y = sc.nextLine();
                        if (y.equalsIgnoreCase("y")) {
                            System.out.println("Enter Full Name");
                            String name = sc.nextLine();
                            System.out.println("\nEnter Email");
                            String email = sc.nextLine();
                            System.out.println("\nEnter Contact");
                            String contact = sc.nextLine();
                            // System.out.println("Enter Username");
                            // String userName = sc.nextLine();
                            // System.out.println("Enter Password");
                            // String passWord = sc.nextLine();

                            studentModel.setName(name);
                            studentModel.setEmail(email);
                            studentModel.setContact(contact);
                            studentModel.setUsername(username);
                            studentModel.setPassword(password);

                            if (examService.addUser(studentModel)) {
                                System.out.println("User added successfully!");
                            } else {
                                System.out.println("Failed to add user!");
                            }
                        } else {
                            System.out.println("Okay");
                        }

                    }

                    break;

                default:
                    System.out.println("Wrong Choice");
                    break;
            }

        } while (true); // End of main menu loop
    }
}