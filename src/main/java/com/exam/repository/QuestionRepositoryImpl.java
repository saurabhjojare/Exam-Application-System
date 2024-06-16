package com.exam.repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.exam.config.DBConfig;
import com.exam.model.QuestionModel;

public class QuestionRepositoryImpl extends DBConfig implements QuestionRepository {
	protected int questionId;
	
	List<QuestionModel> listQuestion = new ArrayList<>();
	PreparedStatement stmt;
	ResultSet rs;

	@Override
	public int getQuestionId() {
	    PreparedStatement stmt = null;
	    ResultSet rs = null;
	    int questionId = 0;

	    try {
	        stmt = getConnection().prepareStatement("SELECT MAX(qid) FROM question");
	        rs = stmt.executeQuery();

	        if (rs.next()) {
	            questionId = rs.getInt(1);
	        }
	    } catch (SQLException e) {
	        System.out.println(e);
	    } finally {
	        try {
	            if (rs != null) {
	                rs.close();
	            }
	        } catch (SQLException e) {
	            System.out.println(e);
	        }
	        try {
	            if (stmt != null) {
	                stmt.close();
	            }
	        } catch (SQLException e) {
	            System.out.println(e);
	        }
	    }

	    return questionId;
	}

	
	@Override
	public List<QuestionModel> getAllQuestion() {
	    PreparedStatement stmt = null;
	    ResultSet rs = null;
	    List<QuestionModel> listQuestion = new ArrayList<>();

	    try {
	        stmt = getConnection().prepareStatement("SELECT * FROM question");
	        rs = stmt.executeQuery();
	        while (rs.next()) {
	            QuestionModel model = new QuestionModel();
	            model.setId(rs.getInt("qid"));
	            model.setName(rs.getString("question"));
	            model.setOp1(rs.getString("op1"));
	            model.setOp2(rs.getString("op2"));
	            model.setOp3(rs.getString("op3"));
	            model.setOp4(rs.getString("op4"));
	            model.setAnswer(rs.getInt("answer"));
	            listQuestion.add(model);
	        }
	        return listQuestion.size() > 0 ? listQuestion : null;
	    } catch (SQLException e) {
	        System.out.println(e);
	        return null;
	    } finally {
	        try {
	            if (rs != null) {
	                rs.close();
	            }
	        } catch (SQLException e) {
	            System.out.println(e);
	        }
	        try {
	            if (stmt != null) {
	                stmt.close();
	            }
	        } catch (SQLException e) {
	            System.out.println(e);
	        }
	    }
	}


	@Override
	public int getSubjectIdByName(String name) {
	    PreparedStatement stmt = null;
	    ResultSet rs = null;

	    try {
	        stmt = getConnection().prepareStatement("SELECT sid FROM subject WHERE subjectname = ?");
	        stmt.setString(1, name);
	        rs = stmt.executeQuery();
	        if (rs.next()) {
	            return rs.getInt(1);
	        } else {
	            return -1;
	        }
	    } catch (SQLException e) {
	        System.out.println(e);
	        return 0;
	    } finally {
	        try {
	            if (rs != null) {
	                rs.close();
	            }
	        } catch (SQLException e) {
	            System.out.println(e);
	        }
	        try {
	            if (stmt != null) {
	                stmt.close();
	            }
	        } catch (SQLException e) {
	            System.out.println(e);
	        }
	    }
	}


	@Override
	public boolean isAddQuestion(QuestionModel qModel, String subName) {
	    PreparedStatement stmt = null;

	    try {
	        int qid = this.getQuestionId() + 1;
	        if (qid != 0) {
	            stmt = getConnection().prepareStatement(
	                    "INSERT INTO question (qid, question, op1, op2, op3, op4, answer) VALUES (?, ?, ?, ?, ?, ?, ?)");
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
	                    stmt = getConnection().prepareStatement("INSERT INTO subjectquestionjoin (qid, sid) VALUES (?, ?)");
	                    stmt.setInt(1, qid);
	                    stmt.setInt(2, sid);
	                    return stmt.executeUpdate() > 0;
	                } else {
	                    return false;
	                }
	            } else {
	                return false;
	            }
	        } else {
	            return false;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    } finally {
	        try {
	            if (stmt != null) {
	                stmt.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}


	@Override
	public boolean uploadBulkQuestion(String question[], String subName) {
	    try {
	        int qid = this.getQuestionId() + 1;
	        if (qid != 0) {
	            stmt = getConnection().prepareStatement(
	                    "INSERT INTO question (qid, question, op1, op2, op3, op4, answer) VALUES (?, ?, ?, ?, ?, ?, ?)");
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
	                    PreparedStatement subjectStmt = getConnection().prepareStatement("INSERT INTO subjectquestionjoin (qid, sid) VALUES (?, ?)");
	                    subjectStmt.setInt(1, qid);
	                    subjectStmt.setInt(2, sid);
	                    int result = subjectStmt.executeUpdate();
	                    subjectStmt.close();
	                    return result > 0;
	                } else {
	                    System.out.println("Subject Not Found");
	                    return false;
	                }
	            } else {
	                return false;
	            }
	        } else {
	            return false;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    } finally {
	        try {
	            if (stmt != null) {
	                stmt.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}

	@Override
	public List<QuestionModel> getQuestionsBySubjectId(String sid) {
	    List<QuestionModel> questions = new ArrayList<>();
	    PreparedStatement stmt = null;
	    ResultSet rs = null;

	    try {
	        stmt = getConnection().prepareStatement(
	                "SELECT * FROM question JOIN subjectquestionjoin ON question.qid = subjectquestionjoin.qid WHERE sid = ?");
	        stmt.setString(1, sid);
	        rs = stmt.executeQuery();

	        while (rs.next()) {
	            int id = rs.getInt("qid");
	            String name = rs.getString("question");
	            String op1 = rs.getString("op1");
	            String op2 = rs.getString("op2");
	            String op3 = rs.getString("op3");
	            String op4 = rs.getString("op4");
	            int answer = rs.getInt("answer");

	            QuestionModel question = new QuestionModel(id, name, op1, op2, op3, op4, answer);
	            questions.add(question);
	        }
	    } catch (SQLException e) {
	        System.out.println("Error Retrieving Questions: " + e);
	    } finally {
	        try {
	            if (rs != null) {
	                rs.close();
	            }
	        } catch (SQLException e) {
	            System.out.println(e);
	        }
	        try {
	            if (stmt != null) {
	                stmt.close();
	            }
	        } catch (SQLException e) {
	            System.out.println(e);
	        }
	    }

	    return questions;
	}


	@Override
	public int getSchidByStudentName(String studentName) {
	    int schid = -1;
	    PreparedStatement stmt = null;
	    ResultSet rs = null;

	    try {
	        stmt = getConnection().prepareStatement(
	                "SELECT s.schid " + "FROM schedule s " + "JOIN studentsubjectjoin ss ON s.sid = ss.sid "
	                        + "JOIN student st ON ss.stid = st.stid " + "WHERE st.username = ?");
	        stmt.setString(1, studentName);
	        rs = stmt.executeQuery();
	        if (rs.next()) {
	            schid = rs.getInt("schid");
	        }
	    } catch (SQLException e) {
	        System.out.println(e);
	    } finally {
	        try {
	            if (rs != null) {
	                rs.close();
	            }
	        } catch (SQLException e) {
	            System.out.println(e);
	        }
	        try {
	            if (stmt != null) {
	                stmt.close();
	            }
	        } catch (SQLException e) {
	            System.out.println(e);
	        }
	    }
	    return schid;
	}

	
	@Override
	public boolean isDeleteQuestionById(int id) {
	    PreparedStatement stmt = null;
	    try {
	        stmt = getConnection().prepareStatement("DELETE FROM question WHERE qid = ?");
	        stmt.setInt(1, id);
	        int value = stmt.executeUpdate();
	        return value > 0;
	    } catch (SQLException ex) {
	        System.out.println(ex);
	        return false;
	    } finally {
	        try {
	            if (stmt != null) {
	                stmt.close();
	            }
	        } catch (SQLException e) {
	            System.out.println(e);
	        }
	    }
	}

	public List<String[]> fetchQuestionsByCourse(int courseId) {
	    List<String[]> questionData = new ArrayList<>();
	    PreparedStatement stmt = null;
	    ResultSet rs = null;

	    try {
	        String query = "SELECT q.qid, q.question, q.op1, q.op2, q.op3, q.op4, q.answer " +
	                       "FROM question q " +
	                       "JOIN subjectquestionjoin sqj ON q.qid = sqj.qid " +
	                       "WHERE sqj.sid = ?";

	        stmt = getConnection().prepareStatement(query);
	        stmt.setInt(1, courseId);
	        rs = stmt.executeQuery();

	        while (rs.next()) {
	            int qid = rs.getInt("qid");
	            String question = rs.getString("question");
	            String op1 = rs.getString("op1");
	            String op2 = rs.getString("op2");
	            String op3 = rs.getString("op3");
	            String op4 = rs.getString("op4");
	            int answer = rs.getInt("answer");

	            String[] questionRow = {String.valueOf(qid), question, op1, op2, op3, op4, String.valueOf(answer)};
	            questionData.add(questionRow);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (stmt != null) stmt.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return questionData;
	}


}
