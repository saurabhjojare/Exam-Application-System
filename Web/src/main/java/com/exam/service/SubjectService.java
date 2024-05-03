package com.exam.service;

import java.util.List;

import com.exam.model.SubjectModel;

public interface SubjectService {
	int addSubject(SubjectModel model);

	List<String> getAllSubjects();

	String getSubjectNameById(int id);

	int getSubjectIdBySubjectName(String subjectName);

	int getStidByName(String studentName);

	boolean addStudentSubjectAssociation(int studentId, int subjectId);

	void updateStudentMarks(int stid, int schid, double obtainedPercentage, double status);
}
