package com.exam.repository;

import java.util.List;
import java.util.Map;

import com.exam.model.ScheduleModel;
import com.exam.model.SubjectModel;

public interface SubjectRepository {
	boolean isAddSubject(SubjectModel model);

	boolean isSubjectPresent(String subName);

	List<Map<String, String>> getAllSubjectsId();
	
	public List<String> getAllSubjects();

	int getSidFromSchid(int schid);

	int getSubjectIdBySubjectName(String subjectName);

	String getSubjectNameById(int id);

	int getStidByName(String studentName);

	boolean addStudentSubject(int studentId, int subjectId);

	void updateStudentMarks(int stid, int schid, double obtainedPercentage, double status);
	
	public String getSubjectNameBySchid(int scheduleId);
	
	public List<ScheduleModel> getAllSchedule();
	
	public int getStidByUserName(String userName);
	
	public boolean isDeleteSubjectById(int id);

}
