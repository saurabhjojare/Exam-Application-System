package com.exam.repository;

import java.util.List;

import com.exam.model.AdminModel;
import com.exam.model.StudentModel;

public interface StudentRepository {
	
	public List<StudentModel> getStudentByUsername(String username);
	
	 public boolean insertStudentExamRelation(int stid, int schid, double obtainedPercentage, double status);
	 
	 public List<String[]> fetchStudentsByCourse(int courseId);
	 
	 public List<String[]> fetchCourses();
	 
	 public List<String[]> fetchStudents();
	 
	 public boolean isDeleteStudentById(int id);
	    
	 boolean isStudentEnrolledInSubject(String studentName, String subjectName);
	 
	 public boolean loginStudent(String username, String password);
	 
	 public List<String[]> fetchStudentsWithoutSubjects();
	 
	 public List<String[]> fetchSubjectsByStudentUsername(String username);
	 
	 public boolean updateStudentByStid(int stid, String name, String email, String contact, String username, String password);
	 
	 public List<Object[]> searchResultByUserInput(String userInput);
	 
	 public boolean isStudentExamRecordExists(String username, int schid);
	 
	 public List<Object[]> searchStudentInfoByNamePattern(String namePattern);
	 
	 public List<StudentModel> getAllSecreteUser();
	   
	   
}
