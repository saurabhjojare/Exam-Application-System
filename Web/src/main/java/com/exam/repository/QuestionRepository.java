package com.exam.repository;

import java.util.List;

import com.exam.model.QuestionModel;

public interface QuestionRepository {
	boolean isAddQuestion(QuestionModel qModel, String subName);

	boolean uploadBulkQuestion(String[] question, String subName);

	List<QuestionModel> getQuestionsBySubjectId(String sid);

	int getSchidByStudentName(String studentName);

	int getQuestionId();

	int getSubjectIdByName(String name);
}
