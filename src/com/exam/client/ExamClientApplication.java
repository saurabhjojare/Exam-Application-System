package com.exam.client;

import java.sql.SQLException;
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
import com.exam.repository.QuestionRepository;
import com.exam.repository.SubjectRepository;
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
            System.out.println("3: Create New Exam ");
            System.out.println("4: Create Exam Schedule ");
            System.out.println("5. Add New Student");
            System.out.println("6. Attempt Exam");
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
                    System.out.println("\t1: Add One Question ");
                    System.out.println("\t2: Import Bulk Questions ");
                    System.out.println("Enter your choice:");
                    int choice2 = sc.nextInt();

                    switch (choice2) {
                        case 1:
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
                            // System.out.println("Subject Name: " + subName); // Debug statement

                            QuestionModel qModel = new QuestionModel(question, op1, op2, op3, op4, answer);
                            boolean b = qService.isAddQuestion(qModel, subName);

                            if (b) {
                                System.out.println("Question Added");
                            } else {
                                System.out.println("Something Wrong");
                            }
                            break;

                        case 2:
                            // Add bulk questions
                            sc.nextLine(); // Consume newline
                            System.out.println("Enter Subject Name To Store");
                            String subname = sc.nextLine();
                            b = qService.uploadBulkQuestion(subname);
                            if (b) {
                                System.out.println("Added");
                            } else {
                                System.out.println("Not Added");
                            }
                            break;

                        default:
                            System.out.println("Invalid choice for case 2");
                    }
                    break;

                case 3:
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

                case 4:
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
                        boolean b = examService.isSetSchedule(eModel, subName);

                        if (b) {
                            System.out.println("Added Exam");
                        } else {
                            System.out.println("Not Added Exam");
                        }
                    }
                    break;

                case 5:
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
                        System.out.println("Already Exists");
                        // You may want to perform further actions Shere for a successful login
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

                                List<String> subjects = sv.getAllSubjects();

                                System.out.println("Select Subject");
                                // Check if subjects list is not null and not empty
                                if (subjects != null && !subjects.isEmpty()) {
                                    // Iterate over the subjects list and print each subject
                                    for (String subject : subjects) {
                                        System.out.println(subject);
                                    }
                                } else {
                                    // If the subjects list is null or empty, display a message indicating no
                                    // subjects found
                                    System.out.println("No subjects found.");
                                }

                                // Ask the user to enter the subject name
                                System.out.print("Enter the subject name: ");
                                String subjectName = sc.nextLine();

                                // Call the getSubjectIdBySubjectName method to retrieve the subject ID
                                int subjectId = sv.getSubjectIdBySubjectName(subjectName);

                                System.out.println("Subject ID " + subjectId);

                                int stid = sv.getStidByName(name);
                                System.out.println("Student ID " + stid);

                                boolean success = sv.addStudentSubjectAssociation(stid, subjectId);

                                // Check if insertion was successful
                                if (success) {
                                    System.out.println("Student ID " + stid + " and Subject ID " + subjectId
                                            + " added successfully.");
                                } else {
                                    System.out.println("Failed to add Student ID " + stid + " and Subject ID "
                                            + subjectId + ".");
                                }

                            } else {
                                System.out.println("Failed to add user!");
                            }
                        } else {
                            System.out.println("Okay");
                        }

                    }

                    break;

                case 6:
                    sc.nextLine();
                    ExamRepository examRepository = new ExamRepository();
                    String studentName = null;
                    // Listing Exam
                    List<ExamModel> qlist = examService.getAllExam();
                    System.out.println("List Of Exams \nSelect Exam For Schedule\n");
                    System.out.println(
                            String.format("%-5s %-13s %-13s %-12s", "ID", "Name", "Total Marks", "Passing Marks"));

                    for (ExamModel m : qlist) {
                        System.out.println(String.format("%-5s %-12s  %-12s  %s", m.getId(), m.getName(),
                                m.getTotalMarks(), m.getPassingMarks()));
                    }
                    System.out.println();

                    System.out.println("Enter Exam ID For Schedule");
                    examName = sc.nextLine();

                    eModel = examService.getExamIdByName(examName);
                    System.out.println("Exam ID " + examName);

                    int selectedExamId = Integer.parseInt(examName);
                    System.out.println("Selected Exam " + selectedExamId);

                    boolean isExamIdAvailable = false; // Flag to track if the exam ID is available

                    // Check if the selected exam ID is available in the list
                    for (ExamModel m : qlist) {
                        if (selectedExamId == m.getId()) {
                            isExamIdAvailable = true;
                            break;
                        }
                    }

                    if (isExamIdAvailable) {
                        System.out.println("Selected Exam ID is available.");

                        int selectedScheduleId = 0;
                        boolean isScheduleIdAvailable = false;

                        // Display the schedule for the selected exam
                        try {
                            List<ScheduleModel> sModel = examRepository.getExamSchedule(selectedExamId);
                            SubjectService subjectService = new SubjectService(); // Assuming you have an instance of
                                                                                  // SubjectService
                            System.out.println("Enter Your Username");
                             studentName = sc.nextLine();
                            int schid = qService.getSchidByStudentName(studentName);
                            System.out.println("Your Exam Schedule ID "+schid);

                            System.out.println("Exam Schedule\n");
                            System.out.println(String.format(

                                    "%-12s %-7s %-12s %-12s %-12s %s", "Schedule ID", "ExamID", "ID Subject",
                                    "Start Time",
                                    "End Time", "Exam Date"));

                                    if (schid != -1) {
                                        for (ScheduleModel s : sModel) {
                                            if (s.getSchid() == schid) {
                                                String subjectName = subjectService.getSubjectNameById(s.getSid());
                                                System.out.println(String.format(
                                                        "%-12s %-7s %-12s %-12s %-12s %s",
                                                        s.getSchid(), s.getExamid(), s.getSid() + "  " + subjectName, s.getStartTime(),
                                                        s.getEndTime(),
                                                        s.getExamDate()));
                                                System.out.println();
                                            }
                                        }
                                    } else {
                                        System.out.println("No schedule found for the student.");
                                    }

                            System.out.println("Select Schedule ID");
                            selectedScheduleId = sc.nextInt();

                            // Check if the selected schedule ID is available in the list
                            for (ScheduleModel s2 : sModel) {
                                if (selectedScheduleId == s2.getSchid()) {
                                    isScheduleIdAvailable = true;
                                    break;
                                }
                            }

                        } catch (SQLException e) {
                            e.printStackTrace();
                        }

                        if (isScheduleIdAvailable) {
                            sc.nextLine();
                            System.out
                                    .println("Do You Want To Attempt Exam For Schedule ID " + selectedScheduleId
                                            + " ? Y or N");
                            String y = sc.nextLine();
                            if (y.equalsIgnoreCase("y")) {

                                examRepo = new ExamRepository();
                                // sc.nextLine();
                                
                                System.out.println("Hello "+studentName);
                                //System.out.println("Enter Username (Lowercase Letters)");
                                username = studentName;

                                System.out.println("\nEnter Password");
                                password = sc.nextLine();

                                // Creating a StudentModel object with the entered username and password
                                studentModel = new StudentModel();
                                studentModel.setUsername(username);
                                studentModel.setPassword(password);

                                // Call the isUserPresent method from ExamService
                                result = examService.isUserPresent(studentModel);

                                if (result == 1) {
                                    System.out.println("\nLogin successful");
                                    // You may want to perform further actions here for a successful login

                                    SubjectRepository subRepo = new SubjectRepository();

                                    QuestionRepository questionRepository = new QuestionRepository();
                                    SubjectService subjectService = new SubjectService();
                                    ScheduleModel sModel = new ScheduleModel();
                                    int sid = subRepo.getSidFromSchid(selectedScheduleId);

                                    System.out.println("Confirm Subject ID?");

                                    String subjectId = " " + sid;// Convert integer to string

                                    List<QuestionModel> questionsRepo = questionRepository
                                            .getQuestionsBySubjectId(subjectId);

                                    totalMarks = 0; // Variable to store the total marks

                                    if (questionsRepo.isEmpty()) {
                                        System.out.println("No questions found for the provided subject ID.");
                                    } else {
                                        System.out.println("Questions for Subject ID " + subjectId + ":\n");

                                        for (QuestionModel questionModel : questionsRepo) {
                                            System.out.println("Question: " + questionModel.getName());
                                            System.out.println("Option 1: " + questionModel.getOp1());
                                            System.out.println("Option 2: " + questionModel.getOp2());
                                            System.out.println("Option 3: " + questionModel.getOp3());
                                            System.out.println("Option 4: " + questionModel.getOp4());

                                            // Prompt the user for input
                                            System.out.println("Enter your answer (1, 2, 3, or 4): ");
                                            String userAnswerString = sc.nextLine();

                                            // Convert user's answer to int
                                            int userAnswer = Integer.parseInt(userAnswerString);

                                            // Compare user's answer with the correct answer
                                            if (userAnswer == questionModel.getAnswer()) {
                                                System.out.println("Correct!");
                                                totalMarks++; // Increment total marks for correct answer

                                            } else {
                                                System.out
                                                        .println("Incorrect. The correct answer is: "
                                                                + questionModel.getAnswer());
                                            }

                                            System.out.println(); // Add a new line for spacing
                                        }
                                    }

                                    System.out.println("Enter Your Student ID");
                                    int stid = examService.getStidByUsername(username);
                                    System.out.println("Printing " + stid);

                                    int finalTotalMarks = totalMarks * 10;
                                    System.out.println("Total Marks: " + finalTotalMarks);

                                    if (finalTotalMarks > 40) {
                                        System.out.println("You're Passed");
                                        int schid = selectedScheduleId;
                                        double obtainedPercentage = finalTotalMarks;
                                        double status = 1.0;
                                        System.out.println("Student " + stid + " Schedule ID " + schid + " Marks "
                                                + obtainedPercentage + " Status " + status);
                                        try {
                                            // Call the method in the service layer to update student marks
                                            sv.updateStudentMarks(stid, schid, obtainedPercentage, status);

                                            // Optionally, you can perform additional actions after updating student
                                            // marks
                                        } catch (Exception e) {
                                            // Handle any exceptions that might occur during the process
                                            e.printStackTrace();
                                        }

                                    } else {
                                        System.out.println("You're Failed");
                                        int schid = selectedScheduleId;
                                        double obtainedPercentage = finalTotalMarks;
                                        double status = 0.0;
                                        System.out.println("Student " + stid + " Schedule ID " + schid + " Marks "
                                                + obtainedPercentage + " Status " + status);

                                        try {
                                            // Call the method in the service layer to update student marks
                                            sv.updateStudentMarks(stid, schid, obtainedPercentage, status);

                                            // Optionally, you can perform additional actions after updating student
                                            // marks
                                        } catch (Exception e) {
                                            // Handle any exceptions that might occur during the process
                                            e.printStackTrace();
                                        }
                                    }

                                } else {

                                    System.out.println("\nUser does not exist");

                                }

                            } else {
                                // System.out.println("Selected Schedule is not available.");
                                System.out.println("No Exam Attempted");
                            }

                        } else {
                            System.out.println("Selected Schedule is not available.");
                            // System.out.println("Selected Exam ID is not available.");
                            // Handle the case where the selected exam ID is not available
                        }
                    } else {
                        System.out.println("Selected Exam ID is not available.");
                        // System.out.println("\nUser does not exist");

                    }

                    break;

                default:
                    System.out.println("Wrong Choice");
                    break;
            }

        } while (true); // End of main menu loop
    }
}