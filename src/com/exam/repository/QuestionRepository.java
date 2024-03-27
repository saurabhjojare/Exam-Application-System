package com.exam.repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.exam.model.QuestionModel;

// Repository class for managing questions in the database
public class QuestionRepository extends DBConfig {
    private int questionId; // Field to store the current question ID

    // Method to get the latest question ID from the database
    private int getQuestionId() {
        try {
            stmt = conn.prepareStatement("Select max(qid) from question");
            rs = stmt.executeQuery();

            if (rs.next()) {
                questionId = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
            return 0; // Return 0 if an exception occurs
        }
        return questionId; // Return the retrieved question ID
    }

    // Method to retrieve subject ID by subject name from the database
    public int getSubjectIdByName(String name) {
        try {
            stmt = conn.prepareStatement("select sid from subject where subjectname = ?");
            stmt.setString(1, name);
            rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1); // Return the retrieved subject ID
            } else {
                return -1; // Return -1 if subject is not found
            }

        } catch (Exception e) {
            System.out.println(e);
            return 0; // Return 0 if an exception occurs
        }
    }


    // Method to add a single question to the database
    public boolean isAddQuestion(QuestionModel qModel, String subName) {
        try {
            int qid = this.getQuestionId() + 1;
            if (qid != 0) {
                stmt = conn.prepareStatement(
                        "insert into question (qid, question, op1, op2, op3, op4, answer) values (?,?,?,?,?,?,?)");
                stmt.setInt(1, qid);
                stmt.setString(2, qModel.getName());
                stmt.setString(3, qModel.getOp1());
                stmt.setString(4, qModel.getOp2());
                stmt.setString(5, qModel.getOp3());
                stmt.setString(6, qModel.getOp4());
                stmt.setInt(7, qModel.getAnswer());
                int value = stmt.executeUpdate();
                if (value > 0) {
                    int sid = this.getSubjectIdByName(subName);
                    if (sid != -1) {
                        stmt = conn.prepareStatement("insert into subjectquestionjoin (qid, sid) values (?, ?)");
                        stmt.setInt(1, sid);
                        stmt.setInt(2, qid);
                        return stmt.executeUpdate() > 0 ? true : false; // Return true if insertion is successful
                    } else if (sid == -1) {
                        //System.out.println("Subject Not Found"); // Print error message if subject is not found
                        return false;
                    } else {
                        //System.out.println("Something Wrong"); // Print error message if something goes wrong
                        return false;
                    }
                } else {
                    return false;
                }
            } else {
                return false;
            }
        } catch (Exception e) {
            return false; // Return false if an exception occurs
        }
    }

    // Method to upload bulk questions to the database
    public boolean uploadBulkQuestion(String question[], String subName) {
        try {
            int qid = this.getQuestionId() + 1;
            if (qid != 0) {
                stmt = conn.prepareStatement(
                        "insert into question (qid, question, op1, op2, op3, op4, answer) values (?,?,?,?,?,?,?)");
                stmt.setInt(1, qid);
                stmt.setString(2, question[0]);
                stmt.setString(3, question[1]);
                stmt.setString(4, question[2]);
                stmt.setString(5, question[3]);
                stmt.setString(6, question[4]);
                stmt.setInt(7, Integer.parseInt(question[5].trim()));
                int value = stmt.executeUpdate();
                if (value > 0) {
                    int sid = this.getSubjectIdByName(subName);
                    if (sid != -1) {
                        PreparedStatement subjectStmt = conn
                                .prepareStatement("insert into subjectquestionjoin (qid, sid) values (?, ?)");
                        subjectStmt.setInt(1, qid);
                        subjectStmt.setInt(2, sid);
                        int result = subjectStmt.executeUpdate();
                        subjectStmt.close(); // Close the statement after execution
                        return result > 0; // Return true if insertion is successful
                    } else if (sid == -1) {
                        System.out.println("Subject Not Found"); // Print error message if subject is not found
                        return false;
                    } else {
                        System.out.println("Something Wrong"); // Print error message if something goes wrong
                        return false;
                    }
                } else {
                    return false;
                }
            } else {
                return false;
            }
        } catch (Exception e) {
            return false; // Return false if an exception occurs
        }
    }

    public List<QuestionModel> getQuestionsBySubjectId(String sid) {
        List<QuestionModel> questions = new ArrayList<>();

        try {
            stmt = conn.prepareStatement(
                    "SELECT * FROM question JOIN subjectquestionjoin ON question.qid = subjectquestionjoin.qid WHERE sid = ?");
            stmt.setString(1, sid);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("qid");
                String name = rs.getString("question");
                String op1 = rs.getString("op1");
                String op2 = rs.getString("op2");
                String op3 = rs.getString("op3");
                String op4 = rs.getString("op4");
                int answer = rs.getInt("answer");

                // Create a QuestionModel object and add it to the list
                QuestionModel question = new QuestionModel(id, name, op1, op2, op3, op4, answer);
                questions.add(question);
            }
        } catch (SQLException e) {
            System.out.println("Error Retrieving Questions: " + e);
        }

        return questions;
    }

}
