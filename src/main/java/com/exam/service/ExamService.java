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

	public List<String[]> getResult(String username);
	
	public String getExamNameByExamId(int examId);
	
	public List<String[]> getAllResults();
	
	public String[] getTimeBySchId(int schId);
	
	public List<String[]> getAllQuestion(String subjectName);
	
	public int[] getMarksByExamId(int examId);
	
	public boolean isDeleteExamById(int id);
	
	public boolean isDeleteScheduleById(int id);

}
