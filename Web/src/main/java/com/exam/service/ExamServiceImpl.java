package com.exam.service;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import com.exam.model.ExamModel;
import com.exam.model.ResultModel;
import com.exam.model.ScheduleModel;
import com.exam.model.StudentModel;
import com.exam.repository.ExamRepository;
import com.exam.repository.ExamRepositoryImpl;

public class ExamServiceImpl implements ExamService {
	ExamRepository examRepo = new ExamRepositoryImpl();

	@Override
	public int isAddExam(ExamModel model) {

		if (examRepo.isExamPresent(model.getName())) {
			return -1;
		} else if (examRepo.isAddExam(model)) {
			return 1;
		} else {
			return 0;
		}
	}

	@Override
	public List<ExamModel> getAllExam() {
		return examRepo.getAllExam();
	}

	@Override
	public ExamModel getExamIdByName(String name) {
		return examRepo.getExamIdByName(name);
	}

	@Override
	public boolean isSetSchedule(ExamModel model, String subName) {
	    LocalDate currentDate = LocalDate.now();
	    ScheduleModel sModel = model.getScheduleModel();
	    String userDate = sModel.getExamDate();

	    // Adjust date parsing based on the format of the examDate string
	    LocalDate examDate = LocalDate.parse(userDate); // Adjust the parsing based on the format of examDate

	    System.out.println("Current Date: " + currentDate);
	    System.out.println("Exam Date: " + examDate);
	    System.out.println("Exam Name: " + model.getName());
	    System.out.println("Subject Name: " + subName);

	    if (examDate.isAfter(currentDate)) {
	        // If the exam date is after the current date, proceed with scheduling
	        System.out.println("Scheduling exam...");
	        boolean isScheduled = examRepo.isSetSchedule(model, subName);
	        if (isScheduled) {
	            System.out.println("Exam scheduled successfully.");
	            return true;
	        } else {
	            System.out.println("Failed to schedule exam.");
	            return false;
	        }
	    } else {
	        // If the exam date has passed, print a message indicating that scheduling is not possible
	        System.out.println("Cannot Schedule Exam: Exam date has already passed.");
	        return false;
	    }
	}


	@Override
	public int isUserPresent(StudentModel model) {
		if (examRepo.checkUsernameAndPassword(model.getUsername(), model.getPassword())) {
			return 1;
		} else {
			return 0;
		}
	}

	@Override
	public boolean addUser(StudentModel model) {
		if (isUserPresent(model) == 1) {
			return false;
		} else {
			return examRepo.addUser(model);
		}
	}

	@Override
	public List<ScheduleModel> getExamSchedule(int examId) throws SQLException {
		return examRepo.getExamSchedule(examId);
	}

	@Override
	public int getStidByUsername(String username) {
		int stid = -1;
		try {
			stid = examRepo.getStidByUsername(username);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return stid;
	}

	@Override
	public List<ResultModel> getResultsByUsername(String username) {
		return examRepo.getResult(username);
	}

	@Override
	public String getExamNameByExamId(int examId) {
		// TODO Auto-generated method stub
		return examRepo.getExamNameByExamId(examId);
	}

}
