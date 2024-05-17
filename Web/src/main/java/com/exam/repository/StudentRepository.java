package com.exam.repository;

import java.util.List;

import com.exam.model.StudentModel;

public interface StudentRepository {
	
	public List<StudentModel> getStudentByUsername(String username);
}
