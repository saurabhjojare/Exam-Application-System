package com.exam.service;

import com.exam.model.SubjectModel;
import com.exam.repository.SubjectRepository;

public class SubjectService {
    SubjectRepository subRepo = new SubjectRepository();

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
}
