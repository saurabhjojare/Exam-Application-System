package com.exam.repository;

import com.exam.model.SubjectModel;
import java.util.*;

public class SubjectRepository extends DBConfig {
    List<String> list = new ArrayList<>();
    public boolean isAddSubject(SubjectModel model) {
        try {
            stmt = conn.prepareStatement("insert into subject values('0',?)");
            stmt.setString(1, model.getName());
            int value = stmt.executeUpdate();
            if (value > 0) {
                return true;
            } else {
                return false;
            }

        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    public boolean isSubjectPresent(String subName) {
        try {
            stmt = conn.prepareStatement("select * from subject where subjectname = ?");
            stmt.setString(1, subName);
            rs = stmt.executeQuery();
            return rs.next();
        } catch (Exception e) {
            return false;
        }
    }

    public List<String> getAllSubjects() {
        try {
            stmt = conn.prepareStatement("select subjectname from subject");
            rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(rs.getString(1));
            }
            return list.size() > 0 ? list : null;
        } catch (Exception e) {
            System.out.println("Error is "+e);
            return null; 
        }
    } 
}
