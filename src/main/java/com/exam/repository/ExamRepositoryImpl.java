package com.exam.repository;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
//import java.util.Date;
import java.util.ArrayList;
import java.util.List;

import com.exam.config.DBConfig;
import com.exam.model.ExamModel;
import com.exam.model.ResultModel;
import com.exam.model.ScheduleModel;
import com.exam.model.StudentModel;

public class ExamRepositoryImpl extends DBConfig implements ExamRepository {
	List<ExamModel> listExams = new ArrayList<>();
	QuestionRepository qRepo = new QuestionRepositoryImpl();

	@Override
	public boolean isExamPresent(String examName) {
		try {
			stmt = conn.prepareStatement("select * from exam where examname = ?");
			stmt.setString(1, examName);
			rs = stmt.executeQuery();
			return rs.next();
		} catch (Exception e) {
			System.out.println("Error in isExamPresent: " + e.getMessage());
			return false;
		}
	}

	@Override
	public boolean isAddExam(ExamModel model) {
		try {
			stmt = conn.prepareStatement("insert into exam (examname, totalmarks, passingmarks) values (?,?,?)");
			stmt.setString(1, model.getName());
			stmt.setInt(2, model.getTotalMarks());
			stmt.setInt(3, model.getPassingMarks());

			int value = stmt.executeUpdate();
			return value > 0;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}
	}

	@Override
	public List<ExamModel> getAllExam() {
		try {
			stmt = conn.prepareStatement("Select * from exam");
			rs = stmt.executeQuery();
			while (rs.next()) {
				ExamModel model = new ExamModel();
				model.setId(rs.getInt(1));
				model.setName(rs.getString(2));
				model.setTotalMarks(rs.getInt(3));
				model.setPassingMarks(rs.getInt(4));
				listExams.add(model);
			}
			return listExams.size() > 0 ? listExams : null;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	public List<String[]> getAllResults() {
        List<String[]> data = new ArrayList<>();
        
        try {
            // Query to fetch data
            String query = "SELECT student.name AS student_name, exam.examname AS exam_name, subject.subjectname AS subject_name, schedule.date AS schedule_date, studentexamrelation.obtainedpercentage, studentexamrelation.status " +
                           "FROM studentexamrelation " +
                           "INNER JOIN student ON studentexamrelation.stid = student.stid " +
                           "INNER JOIN schedule ON studentexamrelation.schid = schedule.schid " +
                           "INNER JOIN exam ON schedule.examid = exam.examid " +
                           "INNER JOIN subject ON schedule.sid = subject.sid;";
            
            // Creating prepared statement
            stmt = conn.prepareStatement(query);
            
            // Executing query
            rs = stmt.executeQuery();
            
            // Processing result set
            while (rs.next()) {
                String[] row = {
                    rs.getString("student_name"),
                    rs.getString("exam_name"),
                    rs.getString("subject_name"),
                    rs.getString("schedule_date"),
                    String.valueOf(rs.getDouble("obtainedpercentage")),
                    String.valueOf(rs.getDouble("status"))
                };
                data.add(row);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                // Closing resources
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return data;
    }
	
	public List<String[]> getAllQuestion(String subjectName) {
        List<String[]> data = new ArrayList<>();
        
        try {
            // Query to fetch data
        	String query = "SELECT q.* FROM question q JOIN subjectquestionjoin sqj ON q.qid = sqj.qid JOIN subject s ON sqj.sid = s.sid WHERE s.subjectname = ?";

            
            // Creating prepared statement
            stmt = conn.prepareStatement(query);
            
         // Set the subjectName parameter
            stmt.setString(1, subjectName);
            
         // Executing query
            rs = stmt.executeQuery();
            
            // Processing result set
            while (rs.next()) {
                String[] row = {
                	String.valueOf(rs.getInt("qid")),
                    rs.getString("question"),
                    rs.getString("op1"),
                    rs.getString("op2"),
                    rs.getString("op3"),
                    rs.getString("op4"),
                    String.valueOf(rs.getInt("answer")),
                };
                data.add(row);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                // Closing resources
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return data;
    }



	@Override
	public List<ScheduleModel> getExamSchedule(int examId) throws SQLException {
		List<ScheduleModel> listSchedules = new ArrayList<>();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.prepareStatement("SELECT * FROM schedule WHERE examid = ? AND date >= CURDATE()");
			stmt.setInt(1, examId);
			rs = stmt.executeQuery();
			while (rs.next()) {
				ScheduleModel model = new ScheduleModel();
				model.setSchid(rs.getInt("schid"));
				model.setExamid(rs.getInt("examid"));
				model.setExamDate(rs.getString("date"));
				model.setStartTime(rs.getString("starttime"));
				model.setEndTime(rs.getString("endtime"));
				model.setSid(rs.getInt("sid"));
				listSchedules.add(model);
			}
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
		}
		return listSchedules;
	}

	@Override
	public ExamModel getExamIdByName(String name) {
		try {
			stmt = conn.prepareStatement("select * from exam where examname = '" + name + "'");
			rs = stmt.executeQuery();
			ExamModel model = null;

			if (rs.next()) {
				model = new ExamModel();

				model.setId(rs.getInt(1));
				model.setName(rs.getString(2));
				model.setTotalMarks(rs.getInt(3));
				model.setPassingMarks(rs.getInt(4));

				return model != null ? model : null;
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
		return null;
	}
	
	public String getExamNameByExamId(int examId) {
	    try {
	        stmt = conn.prepareStatement("SELECT examname FROM exam WHERE examid = ?");
	        stmt.setInt(1, examId); // Set the parameter for the examId
	        rs = stmt.executeQuery();
	        if (rs.next()) {
	            return rs.getString(1); // Return the examname directly
	        } else {
	            return null; // Return null if the exam is not found
	        }
	    } catch (SQLException e) {
	        System.out.println(e);
	        return null;
	    }
	}


	@Override
	public boolean isSetSchedule(ExamModel model, String subName) {
	    String examDate = null;
	    Date sqlDate = null;
	    ScheduleModel sModel = model.getScheduleModel();
	    int subId = qRepo.getSubjectIdByName(subName);
	    
	    try {
	        examDate = sModel.getExamDate();
	        // Adjust date parsing based on the correct format (yyyy-MM-dd)
	        LocalDate localDate = LocalDate.parse(examDate);
	        sqlDate = java.sql.Date.valueOf(localDate);

	        stmt = conn.prepareStatement(
	                "INSERT INTO schedule (examid, date, starttime, endtime, sid) VALUES (?, ?, ?, ?, ?)");

	        stmt.setInt(1, model.getId());
	        stmt.setDate(2, sqlDate);
	        stmt.setString(3, sModel.startTime);
	        stmt.setString(4, sModel.endTime);
	        stmt.setInt(5, subId);

	        int rowsAffected = stmt.executeUpdate();
	        return rowsAffected > 0;

	    } catch (SQLException e) {
	        System.out.print("SQL Error From Exam Repo: " + e.getMessage());
	        return false;
	    } catch (NullPointerException e) {
	        System.out.println("Null Pointer Exception: " + e.getMessage());
	        return false;
	    } catch (Exception e) {
	        System.out.println("Error From Exam Repo: " + e.getMessage());
	        return false;
	    } finally {
	        try {
	            if (stmt != null) {
	                stmt.close();
	            }
	        } catch (SQLException e) {
	            System.out.println("Error closing statement: " + e.getMessage());
	        }
	    }
	}


	@Override
	public boolean checkUsernameAndPassword(String username, String password) {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		boolean userExists = false;

		try {
			stmt = conn.prepareStatement("SELECT * FROM student WHERE username=? AND password =?");
			stmt.setString(1, username);
			stmt.setString(2, password);

			rs = stmt.executeQuery();

			if (rs.next()) {
				userExists = true;
			} else {
				userExists = false;
			}
		} catch (SQLException e) {
			System.out.println("Error: " + e.getMessage());
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (stmt != null) {
					stmt.close();
				}
			} catch (SQLException e) {
				System.out.println("Error closing resources: " + e.getMessage());
			}
		}

		return userExists;
	}

	@Override
	public boolean addUser(StudentModel model) {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int nextStid = 1;

		try {
			stmt = conn.prepareStatement("Select max(stid) as max_stid from student");
			rs = stmt.executeQuery();

			if (rs.next()) {
				int maxStid = rs.getInt("max_stid");
				nextStid = maxStid + 1;
			}

			stmt = conn.prepareStatement(
					"insert into student (stid, name, email, contact, username, password) values (?,?,?,?,?,?)");
			stmt.setInt(1, nextStid);
			stmt.setString(2, model.getName());
			stmt.setString(3, model.getEmail());
			stmt.setString(4, model.getContact());
			stmt.setString(5, model.getUsername());
			stmt.setString(6, model.getPassword());

			int rowsAffected = stmt.executeUpdate();
			if (rowsAffected > 0) {
				return true;
			} else {
				System.out.println("Failed to add user!");
				return false;
			}

		} catch (SQLException e) {
			System.out.println("Error: " + e.getMessage());
			System.out.println(nextStid);
			return false;

		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (stmt != null) {
					stmt.close();
				}
			} catch (SQLException e) {
				System.out.println("Error closing resources: " + e.getMessage());
			}
		}
	}

	@Override
	public int getStidByUsername(String username) throws SQLException {
		int stid = -1;

		try {
			String query = "SELECT stid FROM student WHERE username = ?";
			stmt = conn.prepareStatement(query);
			stmt.setString(1, username);
			try (ResultSet resultSet = stmt.executeQuery()) {
				if (resultSet.next()) {
					stid = resultSet.getInt("stid");
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return stid;
	}

	@Override
	public List<String[]> getResult(String username) {
	    List<String[]> resultList = new ArrayList<>();
	    PreparedStatement stmt = null;
	    ResultSet rs = null;

	    try {
	        String sql = "SELECT e.examname, subj.subjectname, ser.obtainedpercentage, ser.status, sch.date " +
	                     "FROM studentexamrelation AS ser " +
	                     "JOIN student AS s ON ser.stid = s.stid " +
	                     "JOIN schedule AS sch ON ser.schid = sch.schid " +
	                     "JOIN exam AS e ON sch.examid = e.examid " +
	                     "JOIN subject AS subj ON sch.sid = subj.sid " +
	                     "WHERE s.username = ?";

	        stmt = conn.prepareStatement(sql);
	        stmt.setString(1, username);

	        rs = stmt.executeQuery();

	        while (rs.next()) {
	            String examName = rs.getString("examname");
	            String subjectName = rs.getString("subjectname");
	            double obtainedPercentage = rs.getDouble("obtainedpercentage");
	            double status = rs.getDouble("status");
	            String date = rs.getString("date");

	            String[] result = new String[5];
	            result[0] = examName;
	            result[1] = subjectName;
	            result[2] = String.valueOf(obtainedPercentage);
	            result[3] = String.valueOf(status);
	            result[4] = date;

	            resultList.add(result);
	        }

	    } catch (SQLException e) {
	        System.out.println("Exception occurred while fetching result: ");
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) {
	                rs.close();
	            }
	            if (stmt != null) {
	                stmt.close();
	            }
	        } catch (SQLException e) {
	            System.out.println("Exception occurred while closing resources: ");
	            e.printStackTrace();
	        }
	    }

	    return resultList;
	}

	@Override
	public String[] getTimeBySchId(int schId) {
	    try {
	        stmt = conn.prepareStatement("SELECT starttime, endtime FROM schedule WHERE schid = ? AND date >= CURDATE()");
	        stmt.setInt(1, schId);
	        rs = stmt.executeQuery();
	        if (rs.next()) {
	            String startTime = rs.getString("starttime");
	            String endTime = rs.getString("endtime");
	            return new String[]{startTime, endTime}; // Return array with start and end time
	        } else {
	            return null; // Return null if the schedule is not found
	        }
	    } catch (SQLException e) {
	        System.out.println(e);
	        return null;
	    }
	}

	
	 @Override
	    public int[] getMarksByExamId(int examId) {
	        int[] marks = new int[2]; // Array to hold total marks and passing marks
	        PreparedStatement stmt = null;
	        ResultSet rs = null;

	        try {
	            stmt = conn.prepareStatement("SELECT totalmarks, passingmarks FROM exam WHERE examid = ?");
	            stmt.setInt(1, examId);
	            rs = stmt.executeQuery();

	            if (rs.next()) {
	                marks[0] = rs.getInt("totalmarks"); // Total marks
	                marks[1] = rs.getInt("passingmarks"); // Passing marks
	            }
	        } catch (SQLException e) {
	            System.out.println("Error retrieving marks by exam ID: " + e.getMessage());
	        } finally {
	            try {
	                if (rs != null) {
	                    rs.close();
	                }
	                if (stmt != null) {
	                    stmt.close();
	                }
	            } catch (SQLException e) {
	                System.out.println("Error closing resources: " + e.getMessage());
	            }
	        }

	        return marks;
	    }
	 
	  @Override
		public boolean isDeleteExamById(int id) {
			try {
				stmt = conn.prepareStatement("DELETE FROM exam WHERE examid = ?");
				stmt.setInt(1, id);
				int value = stmt.executeUpdate();
				return value > 0;
			} catch (Exception ex) {
				System.out.println(ex);
				return false;
			}
		}
	  

	  @Override
		public boolean isDeleteScheduleById(int id) {
			try {
				stmt = conn.prepareStatement("DELETE FROM schedule WHERE schid = ?");
				stmt.setInt(1, id);
				int value = stmt.executeUpdate();
				return value > 0;
			} catch (Exception ex) {
				System.out.println(ex);
				return false;
			}
		}
	  
	  public List<String[]> fetchResultByCourse(int courseId) {
		    List<String[]> data = new ArrayList<>();
		    PreparedStatement stmt = null;
		    ResultSet rs = null;
		    
		    try {
		        // SQL query to fetch the required data
		        String query = "SELECT s.name AS student_name, s.email, s.contact, s.username, e.examname, sub.subjectname, ser.obtainedpercentage, ser.status, sch.date " +
		                       "FROM student s " +
		                       "JOIN studentExamRelation ser ON s.stid = ser.stid " +
		                       "JOIN schedule sch ON ser.schid = sch.schid " +
		                       "JOIN exam e ON sch.examid = e.examid " +
		                       "JOIN subject sub ON sch.sid = sub.sid " +
		                       "WHERE sub.sid = ?";
		        
		        // Prepare the statement with the query
		        stmt = conn.prepareStatement(query);
		        stmt.setInt(1, courseId); // Set the courseId parameter
		        
		        // Execute the query
		        rs = stmt.executeQuery();
		        
		        // Process the result set
		        while (rs.next()) {
		            String[] row = {
		                rs.getString("student_name"),
		                rs.getString("email"),
		                rs.getString("contact"),
		                rs.getString("username"),
		                rs.getString("examname"),
		                rs.getString("subjectname"),
		                String.valueOf(rs.getDouble("obtainedpercentage")),
		                String.valueOf(rs.getDouble("status")),
		                rs.getString("date")
		            };
		            data.add(row);
		        }
		        
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {
		        try {
		            // Close the resources
		            if (rs != null) rs.close();
		            if (stmt != null) stmt.close();
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		    }
		    
		    return data;
		}
	  
	  public List<String[]> fetchScheduleBySid(int courseId) {
		    List<String[]> data = new ArrayList<>();
		    PreparedStatement stmt = null;
		    ResultSet rs = null;

		    try {
		        // SQL query to fetch the required data
		        String query = "SELECT e.examname, s.date, s.starttime, s.endtime, sub.subjectname, s.schid " +
		                       "FROM schedule s " +
		                       "JOIN subject sub ON s.sid = sub.sid " +
		                       "JOIN exam e ON s.examid = e.examid " +
		                       "WHERE s.sid = ?";
		        
		        // Prepare the statement with the query
		        stmt = conn.prepareStatement(query);
		        stmt.setInt(1, courseId); // Set the sid parameter
		        
		        // Execute the query
		        rs = stmt.executeQuery();
		        
		        // Process the result set
		        while (rs.next()) {
		            String[] row = {
		                rs.getString("examname"),
		                rs.getString("date"),
		                rs.getString("starttime"),
		                rs.getString("endtime"),
		                rs.getString("subjectname"),
		                String.valueOf(rs.getInt("schid"))
		            };
		            data.add(row);
		        }
		        
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {
		        try {
		            // Close the resources
		            if (rs != null) rs.close();
		            if (stmt != null) stmt.close();
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		    }
		    
		    return data;
		}
}
