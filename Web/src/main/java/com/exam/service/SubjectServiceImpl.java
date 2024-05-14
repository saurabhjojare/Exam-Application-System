package com.exam.service;

import java.sql.SQLException;
// import java.io.*;
import java.util.List;

import com.exam.model.ScheduleModel;
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

	@Override
	public String getSubjectNameBySchid(int scheduleId) {
	    try {
	        // Assuming subjectRepository is your repository instance
	        return subRepo.getSubjectNameBySchid(scheduleId);
	    } catch (Exception e) {
	        // Handle exceptions appropriately, such as logging or throwing
	        e.printStackTrace();
	        return null; // or return an appropriate error code/message
	    }
	}

	@Override
	public List<ScheduleModel> getAllSchedule() {
	    try {
	        return subRepo.getAllSchedule(); // Assuming you have a method in your repository for this purpose
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null; // or return an appropriate error code/message
	    }
	}

	@Override
	public int getStidByUserName(String userName) {
		return this.subRepo.getStidByUserName(userName);
	}


}
