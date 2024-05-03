package com.exam.service;

import java.sql.SQLException;
import java.util.List;

import com.exam.model.ExamModel;
import com.exam.model.ResultModel;
import com.exam.model.ScheduleModel;
import com.exam.model.StudentModel;

public interface ExamService {
	int isAddExam(ExamModel model);

	List<ExamModel> getAllExam();

	ExamModel getExamIdByName(String name);

	boolean isSetSchedule(ExamModel model, String subName);

	int isUserPresent(StudentModel model);

	boolean addUser(StudentModel model);

	List<ScheduleModel> getExamSchedule(int examId) throws SQLException;

	int getStidByUsername(String username);

	List<ResultModel> getResultsByUsername(String username);
}
