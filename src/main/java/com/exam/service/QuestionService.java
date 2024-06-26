package com.exam.service;

import java.util.List;

import com.exam.model.QuestionModel;

public interface QuestionService {
	boolean isAddQuestion(QuestionModel qModel, String subName);

	boolean createFiles();

	boolean uploadBulkQuestion(String subName);

	List<QuestionModel> getQuestionsBySubjectId(String subjectId);

	int getSchidByStudentName(String studentName);

	int getQuestionId();
	
	public List<QuestionModel> getAllQuestion();
	
	public boolean isDeleteQuestionById(int id);
	
	public List<String[]> fetchQuestionsByCourse(int courseId);
	
}
