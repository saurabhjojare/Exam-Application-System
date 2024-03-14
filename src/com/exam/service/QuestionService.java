package com.exam.service;

import com.exam.model.QuestionModel;
import com.exam.repository.QuestionRepository;

public class QuestionService {
    QuestionRepository qRepo = new QuestionRepository();
    public boolean isAddQuestion(QuestionModel qModel, String subName) {
        return qRepo.isAddQuestion(qModel, subName);
    }
}
