package com.exam.service;

import com.exam.model.SubjectModel;
import com.exam.repository.SubjectRepository;
import java.io.*;
import java.util.*;

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

    public List<String> getAllSubjects() {
        return this.subRepo.getAllSubjects();
    }

}
