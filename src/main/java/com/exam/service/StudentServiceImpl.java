package com.exam.service;

import java.util.List;

import com.exam.model.StudentModel;
import com.exam.repository.StudentRepository;
import com.exam.repository.StudentRepositoryImpl;

public class StudentServiceImpl implements StudentService{
	StudentRepository studRepo = new StudentRepositoryImpl();

	@Override
	public List<StudentModel> getStudentByUsername(String username) {
		return this.studRepo.getStudentByUsername(username);
	}

	@Override
	public boolean insertStudentExamRelation(int stid, int schid, double obtainedPercentage, double status) {
		// TODO Auto-generated method stub
		return this.studRepo.insertStudentExamRelation(stid, schid, obtainedPercentage, status);
	}

	@Override
	public List<String[]> fetchStudentsByCourse(int courseId) {
		// TODO Auto-generated method stub
		return this.studRepo.fetchStudentsByCourse(courseId);
	}

	@Override
	public List<String[]> fetchCourses() {
		// TODO Auto-generated method stub
		return this.studRepo.fetchCourses();
	}

	@Override
	public List<String[]> fetchStudents() {
		// TODO Auto-generated method stub
		return this.studRepo.fetchStudents();
	}

	@Override
	public boolean isDeleteStudentById(int id) {
		// TODO Auto-generated method stub
		return this.studRepo.isDeleteStudentById(id);
	}

	@Override
	public boolean isStudentEnrolledInSubject(String studentName, String subjectName) {
		// TODO Auto-generated method stub
		return this.studRepo.isStudentEnrolledInSubject(studentName, subjectName);
	}

	@Override
	public boolean loginStudent(String username, String password) {
		// TODO Auto-generated method stub
		return this.studRepo.loginStudent(username, password);
	}

	@Override
	public List<String[]> fetchStudentsWithoutSubjects() {
		// TODO Auto-generated method stub
		return this.studRepo.fetchStudentsWithoutSubjects();
	}

	@Override
	public List<String[]> fetchSubjectsByStudentUsername(String username) {
		// TODO Auto-generated method stub
		return this.studRepo.fetchSubjectsByStudentUsername(username);
	}
	
	

}
