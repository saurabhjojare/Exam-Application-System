package com.exam.service;

// import java.io.*;
import java.util.List;

import com.exam.model.SubjectModel;
import com.exam.repository.SubjectRepository;
import com.exam.repository.SubjectRepositoryImpl;

public class SubjectServiceImpl implements SubjectService {
	SubjectRepository subRepo = new SubjectRepositoryImpl();

	@Override
	public int addSubject(SubjectModel model) {
		if (subRepo.isSubjectPresent(model.getName())) {
			return -1;
		} else {
			boolean b = subRepo.isAddSubject(model);
			if (b) {
				return 1;
			} else {
				return 0;
			}
		}
	}

	@Override
	public List<String> getAllSubjects() {
		return this.subRepo.getAllSubjects();
	}

	@Override
	public String getSubjectNameById(int id) {
		return this.subRepo.getSubjectNameById(id);
	}

	@Override
	public int getSubjectIdBySubjectName(String subjectName) {
		return this.subRepo.getSubjectIdBySubjectName(subjectName);
	}

	@Override
	public int getStidByName(String studentName) {
		return this.subRepo.getStidByName(studentName);
	}

	@Override
	public boolean addStudentSubjectAssociation(int studentId, int subjectId) {
		try {

			boolean associationAdded = subRepo.addStudentSubject(studentId, subjectId);

			return associationAdded;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public void updateStudentMarks(int stid, int schid, double obtainedPercentage, double status) {
		try {

			subRepo.updateStudentMarks(stid, schid, obtainedPercentage, status);

		} catch (Exception e) {

			e.printStackTrace();
		}
	}

}
