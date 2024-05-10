package com.exam.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.List;

import com.exam.helper.PathHelper;
import com.exam.model.QuestionModel;
import com.exam.repository.QuestionRepository;
import com.exam.repository.QuestionRepositoryImpl;

public class QuestionServiceImpl implements QuestionService {
	QuestionRepository qRepo = new QuestionRepositoryImpl();
	SubjectService ss = new SubjectServiceImpl();

	@Override
	public boolean isAddQuestion(QuestionModel qModel, String subName) {
		return qRepo.isAddQuestion(qModel, subName);
	}

	@Override
	public boolean createFiles() {
		try {
			String path = "C:\\Users\\Saurabh\\eclipse-workspace\\Exam-Application-System\\src\\main\\java\\com\\exam\\csv\\QuestionBank";
			File f = new File(path);
			if (!f.exists()) {
				f.mkdir();
			}
			List<String> subList = ss.getAllSubjects();
			if (subList != null) {
				for (String subName : subList) {
					f = new File(path + "\\" + subName + ".csv");
					if (!f.exists()) {
						f.createNewFile();
					}
				}
			} else {
				System.out.println("Subject Not Found");
			}
		} catch (Exception e) {
			System.out.println("Error is " + e);
		}
		return true;
	}

	@Override
	public boolean uploadBulkQuestion(String subName) {
		boolean b = this.createFiles();
		if (b) {
			File f = new File(
					"C:\\Users\\Saurabh\\eclipse-workspace\\Exam-Application-System\\src\\main\\java\\com\\exam\\csv\\QuestionBank");
			File[] fileList = f.listFiles();
			boolean flag = false;
			for (File file : fileList) {
				if (file.isFile()) {
					int index = file.toString().indexOf(subName);
					if (index != -1) {
						flag = true;
						break;
					}
				}
			}
			if (flag) {
				try {
					FileReader fr = new FileReader(PathHelper.filePath + "\\" + subName + ".csv");
					BufferedReader br = new BufferedReader(fr);
					String question;
					flag = false;
					while ((question = br.readLine()) != null) {
						String qwithop[] = question.split(",");
						flag = qRepo.uploadBulkQuestion(qwithop, subName);
					}
					br.close();
				} catch (Exception e) {
					System.out.println(e);
					e.printStackTrace();
				}
			} else {
				System.out.println("Subject File Not Found");
			}
			return true;
		} else {
			return false;
		}
	}

	@Override
	public List<QuestionModel> getQuestionsBySubjectId(String subjectId) {
		return qRepo.getQuestionsBySubjectId(subjectId);
	}

	@Override
	public int getSchidByStudentName(String studentName) {
		int schid = -1;
		try {
			schid = qRepo.getSchidByStudentName(studentName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return schid;
	}

	@Override
	public int getQuestionId() {
        return qRepo.getQuestionId();
	}

	 // Method to get all questions
    public List<QuestionModel> getAllQuestion() {
        return qRepo.getAllQuestion();
    }
}
