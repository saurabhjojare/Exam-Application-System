package com.exam.repository;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

	@Override
	public List<ScheduleModel> getExamSchedule(int examId) throws SQLException {
		List<ScheduleModel> listSchedules = new ArrayList<>();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.prepareStatement("SELECT * FROM schedule WHERE examid = ?");
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

	@Override
	public boolean isSetSchedule(ExamModel model, String subName) {
		String examDate = null;
		Date sqlDate = null;
		ScheduleModel sModel = model.getScheduleModel();
		int subId = qRepo.getSubjectIdByName(subName);
		try {

			examDate = sModel.getExamDate();
			String[] dateSplit = examDate.split("/");

			int year = Integer.parseInt(dateSplit[0]);
			int month = Integer.parseInt(dateSplit[1]) - 1;
			int day = Integer.parseInt(dateSplit[2]);

			sqlDate = new Date(year - 1900, month, day);

			stmt = conn.prepareStatement(
					"INSERT INTO schedule (examid, date, starttime, endtime, sid) VALUES (?, ?, ?, ?, ?)");

			stmt.setInt(1, model.getId());
			stmt.setDate(2, sqlDate);
			stmt.setString(3, sModel.startTime);
			stmt.setString(4, sModel.endTime);
			stmt.setInt(5, subId);

			int rowsAffected = stmt.executeUpdate();
			return rowsAffected > 0;

		} catch (Exception e) {

			return false;
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
	public List<ResultModel> getResult(String username) {
		List<ResultModel> resultList = new ArrayList<>();

		try {
			String sql = "SELECT ser.* FROM studentexamrelation AS ser JOIN student AS s ON ser.stid = s.stid WHERE s.username = ?;";

			stmt = conn.prepareStatement(sql);
			stmt.setString(1, username);

			rs = stmt.executeQuery();

			while (rs.next()) {
				int stid = rs.getInt("stid");
				int schid = rs.getInt("schid");
				double obtainedPercentage = rs.getDouble("obtainedpercentage");
				Double status = rs.getDouble("status");

				ResultModel result = new ResultModel(stid, schid, obtainedPercentage, status);
				resultList.add(result);
			}

		} catch (Exception e) {
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
			} catch (Exception e) {
				System.out.println("Exception occurred while closing resources: ");
				e.printStackTrace();
			}
		}

		return resultList;
	}

}
