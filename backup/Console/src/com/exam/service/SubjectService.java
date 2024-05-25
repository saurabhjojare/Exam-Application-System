package com.exam.service;

import com.exam.model.SubjectModel;
import com.exam.repository.SubjectRepository;
// import java.io.*;
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

    public String getSubjectNameById(int id) {
        return this.subRepo.getSubjectNameById(id);
    }

    public int getSubjectIdBySubjectName(String subjectName) {
        return this.subRepo.getSubjectIdBySubjectName(subjectName);
    }

    
    public int getStidByName(String studentName) {
        return this.subRepo.getStidByName(studentName);
    }

    public boolean addStudentSubjectAssociation(int studentId, int subjectId) {
        try {
            
            boolean associationAdded = subRepo.addStudentSubject(studentId, subjectId);
            
            return associationAdded;
        } catch (Exception e) {
            e.printStackTrace();
            return false; 
        }
    }

    public void updateStudentMarks(int stid, int schid, double obtainedPercentage, double status) {
        try {
        
            subRepo.updateStudentMarks(stid, schid, obtainedPercentage, status);
        
        } catch (Exception e) {
           
            e.printStackTrace();
        }
    }
}