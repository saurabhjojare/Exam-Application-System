package com.exam.repository;

import java.sql.*;
import com.exam.model.ExamModel;
import com.exam.repository.DBConfig;
import java.sql.*;
import java.util.*;


public class ExamRepository extends DBConfig {
    List<ExamModel> listExams = new ArrayList<ExamModel>();
    public boolean isExamPresent(String examName) {
        try {
            stmt = conn.prepareStatement("select * from exam where examname = ?");
            stmt.setString(1, examName);
            rs = stmt.executeQuery();
            return rs.next();
        } catch (Exception e) {
            System.out.println("Error in isExamPresent: " + e.getMessage());
            return false;
        }
    }

    public boolean isAddExam(ExamModel model) {
        try {
            stmt = conn.prepareStatement("insert into exam (examname, totalmarks, passingmarks) values (?,?,?)");
            stmt.setString(1, model.getName());
            stmt.setInt(2, model.getTotalMarks());
            stmt.setInt(3, model.getPassingMarks());

            int value = stmt.executeUpdate();
            if (value > 0) {
                return true;
            }
            else {
                return false;
            }

        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    public List<ExamModel>  getAllExam() {
            try {
                stmt = conn.prepareStatement("Select * from exam");
                rs = stmt.executeQuery();
                while (rs.next()) {
                    ExamModel model = new ExamModel();
                    model.setId(rs.getInt(1));
                    model.setName(rs.getString(2));
                    model.setTotalMarks(rs.getInt(3));
                    model.setPassingMarks(rs.getInt(4));
                    listExams.add(model);
                }
                return listExams.size() > 0 ? listExams:null;
            } catch (Exception e) {
               System.out.println(e);
               return null;
            }
    }

    public ExamModel getExamIdByName(String name) {
        try {
            stmt = conn.prepareStatement("select * from exam where examname = '"+name+"'");
            rs = stmt.executeQuery();
            ExamModel model = null;
            if(rs.next()) {
                model = new ExamModel();
                if (rs.next()) {
                    model.setId(rs.getInt(1));
                    model.setName(rs.getString(2));
                    model.setTotalMarks(rs.getInt(3));
                    model.setPassingMarks(rs.getInt(4));
                }
                return model!=null?model:null;  
            }
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
        return null;
    }
}
