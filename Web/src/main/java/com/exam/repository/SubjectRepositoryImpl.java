package com.exam.repository;

import java.util.ArrayList;
import java.util.List;

import com.exam.config.DBConfig;
import com.exam.model.SubjectModel;

public class SubjectRepositoryImpl extends DBConfig implements SubjectRepository {
	List<String> list = new ArrayList<>();

	@Override
	public boolean isAddSubject(SubjectModel model) {
		try {
			stmt = conn.prepareStatement("insert into subject values('0',?)");
			stmt.setString(1, model.getName());
			int value = stmt.executeUpdate();
			return value > 0;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}
	}
	
	@Override
	public String getSubjectNameBySchid(int scheduleId) {
	    try {
	        stmt = conn.prepareStatement("SELECT s.subjectname FROM schedule sc JOIN subject s ON sc.sid = s.sid WHERE sc.schid = ?");
	        stmt.setInt(1, scheduleId);
	        rs = stmt.executeQuery();
	        if (rs.next()) {
	            return rs.getString("subjectname");
	        } else {
	            return null; // or handle the case when no subject is found for the given scheduleId
	        }
	    } catch (Exception e) {
	        e.printStackTrace(); // Handle the exception properly
	        return null; // or return an appropriate error code/message
	    } finally {
	        // Close resources like stmt and rs here
	    }
	}


	@Override
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

	@Override
	public List<String> getAllSubjects() {
		try {
			stmt = conn.prepareStatement("select subjectname from subject");
			rs = stmt.executeQuery();
			while (rs.next()) {
				list.add(rs.getString(1));
			}
			return list.size() > 0 ? list : null;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	@Override
	public int getSidFromSchid(int schid) {
		int sid = -1;
		try {
			stmt = conn.prepareStatement("SELECT sid FROM schedule WHERE schid = ?");

			stmt.setInt(1, schid);

			rs = stmt.executeQuery();
			if (rs.next()) {
				sid = rs.getInt("sid");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return sid;
	}

	@Override
	public int getSubjectIdBySubjectName(String subjectName) {
		try {
			stmt = conn.prepareStatement("SELECT sid FROM subject WHERE subjectname = ?");
			stmt.setString(1, subjectName);
			rs = stmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			} else {
				return -1;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	@Override
	public String getSubjectNameById(int id) {
		try {
			stmt = conn.prepareStatement("select subjectname from subject where sid = ?");
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			} else {
				return null;
			}

		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	@Override
	public int getStidByName(String studentName) {
		int stid = -1;

		try {
			stmt = conn.prepareStatement("SELECT stid FROM student WHERE name=?");
			stmt.setString(1, studentName);
			rs = stmt.executeQuery();

			if (rs.next()) {
				stid = rs.getInt("stid");
			} else {
				System.out.println("No student found with the name: " + studentName);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (stmt != null) {
					stmt.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return stid;
	}

	@Override
	public boolean addStudentSubject(int studentId, int subjectId) {
		try {
			String sql = "INSERT INTO studentsubjectjoin (stid, sid) VALUES (?, ?)";
			stmt = conn.prepareStatement(sql);

			stmt.setInt(1, studentId);
			stmt.setInt(2, subjectId);

			int rowsAffected = stmt.executeUpdate();

			return rowsAffected > 0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void updateStudentMarks(int stid, int schid, double obtainedPercentage, double status) {

		try {
			String sql = "INSERT INTO studentexamrelation (stid, schid, obtainedpercentage, status) VALUES (?, ?, ?, ?)";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, stid);
			stmt.setInt(2, schid);
			stmt.setDouble(3, obtainedPercentage);
			stmt.setDouble(4, status);

			int rowsInserted = stmt.executeUpdate();
			if (rowsInserted > 0) {
				System.out.println("Student marks updated successfully.");
			}
		} catch (Exception e) {
			System.out.println();
		}
	}

}
