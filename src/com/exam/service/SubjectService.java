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

    public int getSubjectIdBySubjectName(String subjectName) {
        return this.subRepo.getSubjectIdBySubjectName(subjectName);
    }

    
    public int getStidByName(String studentName) {
        return this.subRepo.getStidByName(studentName);
    }


    public boolean addStudentSubjectAssociation(int studentId, int subjectId) {
        try {
            // Call the repository method to add the student-subject association
            boolean associationAdded = subRepo.addStudentSubject(studentId, subjectId);
            
            // Return the result of the association addition
            return associationAdded;
        } catch (Exception e) {
            e.printStackTrace();
            return false; // Return false if an exception occurs
        }
    }

    public void updateStudentMarks(int stid, int schid, double obtainedPercentage, double status) {
        try {
            // You can perform any validation or additional logic here before calling the repository method
            
            // Call the repository method to update student marks
            subRepo.updateStudentMarks(stid, schid, obtainedPercentage, status);
            
            // You can perform any post-processing logic here if needed
        } catch (Exception e) {
            // Handle exceptions or errors appropriately
            e.printStackTrace();
        }
    }

    

}
