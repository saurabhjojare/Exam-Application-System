package com.exam.service;

import java.util.List;
import java.util.Map;

import com.exam.model.ScheduleModel;
import com.exam.model.SubjectModel;

public interface SubjectService {
	int addSubject(SubjectModel model);

	List<Map<String, String>> getAllSubjectsId();
	
	public List<String> getAllSubjects();

	String getSubjectNameById(int id);

	int getSubjectIdBySubjectName(String subjectName);

	int getStidByName(String studentName);

	boolean addStudentSubjectAssociation(int studentId, int subjectId);

	void updateStudentMarks(int stid, int schid, double obtainedPercentage, double status);
	
	public String getSubjectNameBySchid(int scheduleId);
	
	public List<ScheduleModel> getAllSchedule();
	
	public int getStidByUserName(String userName);
	
	public boolean isDeleteSubjectById(int id);
	
	
}
