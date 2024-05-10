package com.exam.repository;

import java.sql.SQLException;
import java.util.List;

import com.exam.model.ExamModel;
import com.exam.model.ResultModel;
import com.exam.model.ScheduleModel;
import com.exam.model.StudentModel;

public interface ExamRepository {
	boolean isExamPresent(String examName);

	boolean isAddExam(ExamModel model);

	List<ExamModel> getAllExam();

	List<ScheduleModel> getExamSchedule(int examId) throws SQLException;

	ExamModel getExamIdByName(String name);

	boolean isSetSchedule(ExamModel model, String subName);

	boolean checkUsernameAndPassword(String username, String password);

	boolean addUser(StudentModel model);

	int getStidByUsername(String username) throws SQLException;

	List<ResultModel> getResult(String username);
	
	public String getExamNameByExamId(int examId);
}
