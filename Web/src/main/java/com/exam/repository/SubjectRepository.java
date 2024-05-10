package com.exam.repository;

import java.util.List;

import com.exam.model.ScheduleModel;
import com.exam.model.SubjectModel;

public interface SubjectRepository {
	boolean isAddSubject(SubjectModel model);

	boolean isSubjectPresent(String subName);

	List<String> getAllSubjects();

	int getSidFromSchid(int schid);

	int getSubjectIdBySubjectName(String subjectName);

	String getSubjectNameById(int id);

	int getStidByName(String studentName);

	boolean addStudentSubject(int studentId, int subjectId);

	void updateStudentMarks(int stid, int schid, double obtainedPercentage, double status);
	
	public String getSubjectNameBySchid(int scheduleId);
	
	public List<ScheduleModel> getAllSchedule();

}
