package com.exam.repository;

import com.exam.model.SubjectModel;

public class SubjectRepository extends DBConfig {

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
}
