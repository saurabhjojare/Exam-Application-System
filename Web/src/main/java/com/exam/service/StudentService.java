package com.exam.service;

import java.util.List;

import com.exam.model.StudentModel;

public interface StudentService {
	public List<StudentModel> getStudentByUsername(String username);
}
