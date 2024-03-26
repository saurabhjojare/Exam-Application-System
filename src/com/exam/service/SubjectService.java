package com.exam.service;

import com.exam.model.SubjectModel;
import com.exam.repository.SubjectRepository;
// import java.io.*;
import java.util.*;

/**
 * Service class responsible for handling operations related to subjects.
 */
public class SubjectService {
    SubjectRepository subRepo = new SubjectRepository();

    /**
     * Adds a new subject to the system.
     * 
     * @param model The SubjectModel object representing the subject to be added.
     * @return An integer value indicating the result of the operation:
     *         -1 if the subject already exists,
     *         0 if subject addition fails,
     *         1 if subject addition is successful.
     */
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

    /**
     * Retrieves a list of all subjects available in the system.
     * 
     * @return A List containing names of all subjects.
     */
    public List<String> getAllSubjects() {
        return this.subRepo.getAllSubjects();
    }

    public String getSubjectNameById(int id) {
        return this.subRepo.getSubjectNameById(id);
    }


}
