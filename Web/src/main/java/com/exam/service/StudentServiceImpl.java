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

}
