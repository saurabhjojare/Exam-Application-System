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
		Date d = new Date();

		LocalDate currentDate = LocalDate.now();

		String[] s = d.toLocaleString().split(",");
		String dsplit[] = currentDate.toString().split("-");

		ScheduleModel sModel = model.getScheduleModel();

		String userDate = sModel.getExamDate();

		String userDateArr[] = userDate.split("/");

		String userDates[] = userDateArr[0].split("-");

		int currentYear = Integer.parseInt(dsplit[0]);
		int currentMonth = Integer.parseInt(dsplit[1]);
		int currentDay = Integer.parseInt(dsplit[2]);

		int examYear = Integer.parseInt(userDateArr[0]);
		int examMonth = Integer.parseInt(userDateArr[1]);
		int examDay = Integer.parseInt(userDateArr[2]);

		if (examYear > currentYear || (examYear == currentYear && examMonth > currentMonth)
				|| (examYear == currentYear && examMonth == currentMonth && examDay > currentDay)) {

			return examRepo.isSetSchedule(model, subName) ? true : false;
		} else {
			// System.out.println("Cannot Schedule Exam");
		}

		return false;
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

}
