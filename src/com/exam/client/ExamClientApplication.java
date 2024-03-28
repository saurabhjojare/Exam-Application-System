package com.exam.client;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

import com.exam.model.ExamModel;
import com.exam.model.QuestionModel;
import com.exam.model.ResultModel;
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
        SubjectService sv = new SubjectService();
        QuestionService qService = new QuestionService();
        ExamService examService = new ExamService();

        do {
            System.out.println("1: Register Subject ");
            System.out.println("2: Create Question ");
            System.out.println("3: Create New Exam ");
            System.out.println("4: Create Exam Schedule ");
            System.out.println("5. Add New Student");
            System.out.println("6. Attempt Exam");
            System.out.println("7. Show The Result");

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

                            QuestionModel qModel = new QuestionModel(question, op1, op2, op3, op4, answer);
                            boolean b = qService.isAddQuestion(qModel, subName);

                            if (b) {
                                System.out.println("Question Added");
                            } else {
                                System.out.println("Something Wrong");
                            }
                            break;

                        case 2:
                            sc.nextLine();
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

                case 4:
                    sc.nextLine();
                    List<ExamModel> list = examService.getAllExam();
                    System.out.println("List Of Exams");

                    for (ExamModel m : list) {
                        System.out.println(String.format("%-5s %-12s  %-5s  %s", m.getId(), m.getName(),
                                m.getTotalMarks(), m.getPassingMarks()));

                    }
                    list.clear();
                    System.out.println("Enter Exam Name");
                    examName = sc.nextLine();
                    ExamModel eModel = examService.getExamIdByName(examName);
                    System.out.println(eModel.getName());

                    if (eModel != null) {
                        System.out.println("Enter Exam Date (dd-MMMM-yyyy)");
                        String dateFormat = sc.nextLine();

                        Date d1 = new Date(dateFormat);
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");

                        String formattedDate = sdf.format(d1);

                        System.out.println("Enter Start Time");
                        String startTime = sc.nextLine();

                        System.out.println("Enter End Time");
                        String endTime = sc.nextLine();

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
                            System.out.println("Schedule Created");
                        } else {
                            System.out.println("Schedule Not Created");
                        }
                    }
                    break;

                case 5:
                    ExamRepository examRepo = new ExamRepository();
                    sc.nextLine();
                    System.out.println("Enter Username (Lowercase Letters)");
                    String username = sc.nextLine();

                    System.out.println("Enter Password");
                    String password = sc.nextLine();

                    StudentModel studentModel = new StudentModel();
                    studentModel.setUsername(username);
                    studentModel.setPassword(password);

                    result = examService.isUserPresent(studentModel);

                    if (result == 1) {
                        System.out.println("Account Already Exists");
                    } else {
                        System.out.println("User does not exist");
                        System.out.println("Create New Account?");
                        System.out.println(" Press Y Or N");
                        String y = sc.nextLine();
                        if (y.equalsIgnoreCase("y")) {
                            System.out.println("Enter First Name & Last Name");
                            String name = sc.nextLine();
                            System.out.println("Enter Email");
                            String email = sc.nextLine();
                            System.out.println("Enter Contact");
                            String contact = sc.nextLine();

                            studentModel.setName(name);
                            studentModel.setEmail(email);
                            studentModel.setContact(contact);
                            studentModel.setUsername(username);
                            studentModel.setPassword(password);

                            if (examService.addUser(studentModel)) {
                                System.out.println("User added successfully!");

                                List<String> subjects = sv.getAllSubjects();

                                System.out.println("Select Subject");
                                if (subjects != null && !subjects.isEmpty()) {
                                    for (String subject : subjects) {
                                        System.out.println(subject);
                                    }
                                } else {

                                    System.out.println("No subjects found.");
                                }

                                System.out.print("Enter the subject name: ");
                                String subjectName = sc.nextLine();

                                int subjectId = sv.getSubjectIdBySubjectName(subjectName);

                                System.out.println("Your Subject ID " + subjectId);

                                int stid = sv.getStidByName(name);
                                System.out.println("Your Student ID " + stid);

                                boolean success = sv.addStudentSubjectAssociation(stid, subjectId);

                                if (success) {
                                    System.out.println("Subject Assigned Successfully");
                                } else {
                                    System.out.println("Failed To Add Subject");
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
                    List<ExamModel> q1list = examService.getAllExam();
                    System.out.println("List Of Exams");

                    System.out.println(
                            String.format("%-5s %-13s %-13s %-12s", "ID", "Name", "Total Marks", "Passing Marks"));

                    for (ExamModel m : q1list) {
                        System.out.println(String.format("%-5s %-12s  %-12s  %s", m.getId(), m.getName(),
                                m.getTotalMarks(), m.getPassingMarks()));
                    }

                    q1list.clear();

                    System.out.println("Enter Exam ID");
                    examName = sc.nextLine();

                    eModel = examService.getExamIdByName(examName);

                    int selectedExamId = Integer.parseInt(examName);

                    boolean isExamIdAvailable = false;

                    List<ExamModel> q2list = examService.getAllExam();

                    for (ExamModel m : q2list) {
                        if (selectedExamId == m.getId()) {
                            isExamIdAvailable = true;
                            break;
                        }
                    }

                    q2list.clear();

                    if (isExamIdAvailable) {

                        int selectedScheduleId = 0;
                        boolean isScheduleIdAvailable = false;

                        try {
                            List<ScheduleModel> sModel = examRepository.getExamSchedule(selectedExamId);
                            SubjectService subjectService = new SubjectService();
                            System.out.println("Enter Your Username");
                            studentName = sc.nextLine();
                            int schid = qService.getSchidByStudentName(studentName);

                            System.out.println("Exam Schedule");
                            // Print the header
                            System.out.println(String.format("%-12s %-7s %-12s %-12s %-12s %s",
                                    "Schedule ID", "Exam ID", "Subject", "Start Time", "End Time", "Exam Date"));
                            // Print the separator
                            System.out.println(String.format("%-12s %-7s %-12s %-12s %-12s %s",
                                    "------------", "-------", "----------", "----------", "--------", "---------"));

                            if (schid != -1) {
                                for (ScheduleModel s : sModel) {
                                    if (s.getSchid() == schid) {
                                        String subjectName = subjectService.getSubjectNameById(s.getSid());
                                        System.out.println(String.format(
                                                "%-12s %-7s %-12s %-12s %-12s %s",
                                                s.getSchid(), s.getExamid(), subjectName /* + "  " + s.getSid() */,
                                                s.getStartTime(),
                                                s.getEndTime(),
                                                s.getExamDate()));
                                    }
                                }
                            } else {
                                System.out.println("No schedule found for the student.");
                            }

                            System.out.println("Enter Schedule ID");
                            selectedScheduleId = sc.nextInt();

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
                                            + "? \nPress Y for Yes or N for No");
                            String y = sc.nextLine();
                            if (y.equalsIgnoreCase("y")) {

                                examRepo = new ExamRepository();

                                System.out.println("Hello " + studentName);
                                username = studentName;

                                System.out.println("Enter Your Password");
                                password = sc.nextLine();

                                studentModel = new StudentModel();
                                studentModel.setUsername(username);
                                studentModel.setPassword(password);

                                result = examService.isUserPresent(studentModel);

                                if (result == 1) {
                                    System.out.println("Login successful");

                                    SubjectRepository subRepo = new SubjectRepository();

                                    QuestionRepository questionRepository = new QuestionRepository();
                                    SubjectService subjectService = new SubjectService();
                                    ScheduleModel sModel = new ScheduleModel();
                                    int sid = subRepo.getSidFromSchid(selectedScheduleId);

                                    String subjectId = " " + sid;

                                    List<QuestionModel> questionsRepo = questionRepository
                                            .getQuestionsBySubjectId(subjectId);

                                    totalMarks = 0;

                                    if (questionsRepo.isEmpty()) {
                                        System.out.println("No questions found for the provided subject ID.");
                                    } else {

                                        for (QuestionModel questionModel : questionsRepo) {
                                            System.out.println("Question: " + questionModel.getName());
                                            System.out.println("Option 1: " + questionModel.getOp1());
                                            System.out.println("Option 2: " + questionModel.getOp2());
                                            System.out.println("Option 3: " + questionModel.getOp3());
                                            System.out.println("Option 4: " + questionModel.getOp4());

                                            System.out.println("Enter your answer (1, 2, 3, or 4): ");
                                            String userAnswerString = sc.nextLine();

                                            int userAnswer = Integer.parseInt(userAnswerString);

                                            if (userAnswer == questionModel.getAnswer()) {
                                                System.out.println("Correct!");
                                                totalMarks++;

                                            } else {
                                                System.out
                                                        .println("Incorrect. The correct answer is: "
                                                                + questionModel.getAnswer());
                                            }
                                            System.out.println();
                                        }
                                    }

                                    int stid = examService.getStidByUsername(username);

                                    int finalTotalMarks = totalMarks * 10;
                                    System.out.println("Total Marks: " + finalTotalMarks);

                                    if (finalTotalMarks > 40) {
                                        System.out.println("You're Passed");
                                        int schid = selectedScheduleId;
                                        double obtainedPercentage = finalTotalMarks;
                                        double status = 1.0;
                                        System.out.println("Student ID | Schedule ID | Marks | Status");
                                        System.out.println("-----------------------------------------");
                                        System.out.printf("%-10s | %-12s | %-5.2f | %-6s%n", stid, schid,
                                                obtainedPercentage, status);

                                        try {
                                            sv.updateStudentMarks(stid, schid, obtainedPercentage, status);
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }

                                    } else {
                                        System.out.println("You're Failed");
                                        int schid = selectedScheduleId;
                                        double obtainedPercentage = finalTotalMarks;
                                        double status = 0.0;
                                        System.out.println(String.format("%-20s %-20s %-20s %s", "Student ID",
                                                "Schedule ID", "Marks", "Status"));
                                        System.out.println(String.format("%-20s %-20s %-20s %s", "-----------",
                                                "------------", "-----", "------"));
                                        System.out.println(String.format("%-20s %-20s %-20s %s", stid, schid,
                                                obtainedPercentage, status));

                                        try {
                                            sv.updateStudentMarks(stid, schid, obtainedPercentage, status);
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    }

                                } else {

                                    System.out.println("\nUser does not exist");
                                }

                            } else {
                                System.out.println("No Exam Attempted");
                            }

                        } else {
                            System.out.println("Selected Schedule is not available.");
                        }
                    } else {
                        System.out.println("Selected Exam ID is not available.");
                    }

                    break;

                case 7:
                    sc.nextLine();
                    ExamRepository resultExamRepo = new ExamRepository();

                    System.out.println("Enter Your Username");
                    username = sc.nextLine();

                    List<ResultModel> resultList = resultExamRepo.getResult(username);
                    if (!resultList.isEmpty()) {
                        System.out.println("Results for username '" + username + "':");
                        System.out.println("+------+-------+--------------------+--------+");
                        System.out.println("| stid | schid | obtainedPercentage | status |");
                        System.out.println("+------+-------+--------------------+--------+");
                        for (ResultModel resultModel : resultList) {
                            System.out.printf("| %-4d | %-5d | %-18.2f | %-6.2f |\n",
                                    resultModel.getStid(), resultModel.getSchid(),
                                    resultModel.getObtainedPercentage(), resultModel.getStatus());
                        }
                        System.out.println("+------+-------+--------------------+--------+");
                    } else {
                        System.out.println("No results found for username '" + username + "'.");
                    }
                    break;

                default:
                    System.out.println("Wrong Choice");
                    break;
            }

        } while (true);
    }
}