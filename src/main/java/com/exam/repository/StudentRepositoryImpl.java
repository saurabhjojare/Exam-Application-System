package com.exam.repository;

import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.exam.config.DBConfig;
import com.exam.model.AdminModel;
import com.exam.model.StudentModel;

public class StudentRepositoryImpl extends DBConfig implements StudentRepository {
	PreparedStatement stmt;
	ResultSet rs;

	@Override
	public List<StudentModel> getStudentByUsername(String username) {
	    List<StudentModel> listStudent = new ArrayList<>();
	    PreparedStatement stmt = null;
	    ResultSet rs = null;

	    try {
	        stmt = getConnection().prepareStatement("SELECT * FROM student WHERE username = ?");
	        stmt.setString(1, username);
	        rs = stmt.executeQuery();

	        while (rs.next()) {
	            StudentModel model = new StudentModel();
	            model.setStid(rs.getInt("stid"));
	            model.setName(rs.getString("name"));
	            model.setEmail(rs.getString("email"));
	            model.setContact(rs.getString("contact"));
	            model.setUsername(rs.getString("username"));
	            model.setPassword(rs.getString("password"));
	            listStudent.add(model);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace(); // Consider using a logging framework
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (stmt != null) stmt.close();
	        } catch (SQLException e) {
	            e.printStackTrace(); // Consider using a logging framework
	        }
	    }

	    return listStudent.isEmpty() ? null : listStudent;
	}

    
    
	@Override
	public boolean insertStudentExamRelation(int stid, int schid, double obtainedPercentage, double status) {
	    PreparedStatement stmt = null;

	    try {
	        stmt = getConnection().prepareStatement("INSERT INTO studentexamrelation (stid, schid, obtainedpercentage, status) VALUES (?, ?, ?, ?)");
	        stmt.setInt(1, stid);
	        stmt.setInt(2, schid);
	        stmt.setDouble(3, obtainedPercentage);
	        stmt.setDouble(4, status);
	        
	        int rowsAffected = stmt.executeUpdate();
	        
	        return rowsAffected > 0;
	    } catch (SQLException e) {
	        e.printStackTrace(); // Consider using a logging framework
	    } finally {
	        try {
	            if (stmt != null) stmt.close();
	        } catch (SQLException e) {
	            e.printStackTrace(); // Consider using a logging framework
	        }
	    }

	    return false;
	}

    
	public List<String[]> fetchStudents() {
	    List<String[]> studentData = new ArrayList<>();
	    PreparedStatement stmt = null;
	    ResultSet rs = null;
	    
	    try {
	        String query = "SELECT * FROM student";
	        stmt = getConnection().prepareStatement(query);
	        rs = stmt.executeQuery();

	        while (rs.next()) {
	            int sid = rs.getInt("sid");
	            String name = rs.getString("name");
	            String email = rs.getString("email");
	            String contact = rs.getString("contact");
	            int courseId = rs.getInt("courseid");

	            String[] studentRow = {String.valueOf(sid), name, email, contact, String.valueOf(courseId)};
	            studentData.add(studentRow);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (stmt != null) stmt.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return studentData;
	}

    
	public List<String[]> fetchCourses() {
	    List<String[]> courseData = new ArrayList<>();
	    PreparedStatement stmt = null;
	    ResultSet rs = null;

	    try {
	        String query = "SELECT * FROM subject";
	        stmt = getConnection().prepareStatement(query);
	        rs = stmt.executeQuery();

	        while (rs.next()) {
	            int courseId = rs.getInt("sid");
	            String courseName = rs.getString("subjectname");

	            String[] courseRow = {String.valueOf(courseId), courseName};
	            courseData.add(courseRow);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (stmt != null) stmt.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return courseData;
	}

    
	public List<String[]> fetchStudentsByCourse(int courseId) {
	    List<String[]> studentData = new ArrayList<>();
	    PreparedStatement stmt = null;
	    ResultSet rs = null;

	    try {
	        String query = "SELECT student.stid, student.name, student.email, student.contact, student.username " +
	                       "FROM student " +
	                       "JOIN studentsubjectjoin ON student.stid = studentsubjectjoin.stid " +
	                       "JOIN subject ON studentsubjectjoin.sid = subject.sid " +
	                       "WHERE subject.sid = ?";
	        stmt = getConnection().prepareStatement(query);
	        stmt.setInt(1, courseId);
	        rs = stmt.executeQuery();

	        while (rs.next()) {
	            int sid = rs.getInt("stid");
	            String name = rs.getString("name");
	            String email = rs.getString("email");
	            String contact = rs.getString("contact");
	            String username = rs.getString("username");

	            String[] studentRow = {String.valueOf(sid), name, email, contact, username};
	            studentData.add(studentRow);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (stmt != null) stmt.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return studentData;
	}

    
	@Override
	public boolean isDeleteStudentById(int id) {
	    try {
	        stmt = getConnection().prepareStatement("DELETE FROM student WHERE stid = ?");
	        stmt.setInt(1, id);
	        int value = stmt.executeUpdate();
	        return value > 0;
	    } catch (Exception ex) {
	        System.out.println(ex);
	        return false;
	    } finally {
	        try {
	            if (stmt != null) stmt.close();
	            if (getConnection() != null) getConnection().close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}

	 
	@Override
	public boolean isStudentEnrolledInSubject(String studentName, String subjectName) {
	    PreparedStatement stmt = null;
	    ResultSet rs = null;

	    try {
	        String query = "SELECT s.username AS student_name, subj.subjectname AS subject_name " +
	                       "FROM student s " +
	                       "JOIN studentsubjectjoin ss ON s.stid = ss.stid " +
	                       "JOIN subject subj ON ss.sid = subj.sid " +
	                       "WHERE s.username = ? AND subj.subjectname = ?";
	        stmt = getConnection().prepareStatement(query);
	        stmt.setString(1, studentName);
	        stmt.setString(2, subjectName);
	        rs = stmt.executeQuery();

	        return rs.next();
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (stmt != null) stmt.close();
	            if (getConnection() != null) getConnection().close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}

	
	@Override
	public boolean loginStudent(String username, String password) {
	    PreparedStatement stmt = null;
	    ResultSet rs = null;

	    try {
	        String query = "SELECT * FROM student WHERE username = ? AND password = ?";
	        stmt = getConnection().prepareStatement(query);
	        stmt.setString(1, username);
	        stmt.setString(2, password); 

	        rs = stmt.executeQuery();
	        return rs.next(); 
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (stmt != null) stmt.close();
	            if (getConnection() != null) getConnection().close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}

	    
	public List<String[]> fetchStudentsWithoutSubjects() {
	    List<String[]> studentsWithoutSubjects = new ArrayList<>();
	    PreparedStatement stmt = null;
	    ResultSet rs = null;

	    try {
	        String query = "SELECT * " +
	                       "FROM student " +
	                       "LEFT JOIN studentsubjectjoin ON student.stid = studentsubjectjoin.stid " +
	                       "WHERE studentsubjectjoin.stid IS NULL";
	        stmt = getConnection().prepareStatement(query);
	        rs = stmt.executeQuery();

	        while (rs.next()) {
	            String[] studentData = new String[6]; // Assuming 6 fields in the student table
	            studentData[0] = String.valueOf(rs.getInt("stid"));
	            studentData[1] = rs.getString("name");
	            studentData[2] = rs.getString("email");
	            studentData[3] = rs.getString("contact");
	            studentData[4] = rs.getString("username");
	            studentData[5] = rs.getString("password");
	            studentsWithoutSubjects.add(studentData);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace(); // Consider using a logging framework
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (stmt != null) stmt.close();
	            if (getConnection() != null) getConnection().close();
	        } catch (SQLException e) {
	            e.printStackTrace(); // Consider using a logging framework
	        }
	    }

	    return studentsWithoutSubjects;
	}

	    
	public List<String[]> fetchSubjectsByStudentUsername(String username) {
	    List<String[]> subjects = new ArrayList<>();
	    PreparedStatement stmt = null;
	    ResultSet rs = null;

	    try {
	        String query = "SELECT subject.sid, subject.subjectname " +
	                       "FROM student " +
	                       "JOIN studentsubjectjoin ON student.stid = studentsubjectjoin.stid " +
	                       "JOIN subject ON studentsubjectjoin.sid = subject.sid " +
	                       "WHERE student.username = ?";
	        stmt = getConnection().prepareStatement(query);
	        stmt.setString(1, username);
	        rs = stmt.executeQuery();

	        while (rs.next()) {
	            String[] subjectData = new String[2]; // Assuming 2 fields in the subject table
	            subjectData[0] = String.valueOf(rs.getInt("sid"));
	            subjectData[1] = rs.getString("subjectname");
	            subjects.add(subjectData);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace(); // Consider using a logging framework
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (stmt != null) stmt.close();
	            if (getConnection() != null) getConnection().close();
	        } catch (SQLException e) {
	            e.printStackTrace(); // Consider using a logging framework
	        }
	    }

	    return subjects;
	}

	public boolean updateStudentByStid(int stid, String name, String email, String contact, String username, String password) {
	    PreparedStatement stmt = null;

	    try {
	        String query = "UPDATE student SET name = ?, email = ?, contact = ?, username = ?, password = ? WHERE stid = ?";
	        stmt = getConnection().prepareStatement(query);
	        stmt.setString(1, name);
	        stmt.setString(2, email);
	        stmt.setString(3, contact);
	        stmt.setString(4, username);
	        stmt.setString(5, password);
	        stmt.setInt(6, stid);

	        int rowsAffected = stmt.executeUpdate();
	        return rowsAffected > 0;
	    } catch (SQLException e) {
	        e.printStackTrace(); // Consider using a logging framework
	        return false;
	    } finally {
	        try {
	            if (stmt != null) stmt.close();
	            if (getConnection() != null) getConnection().close();
	        } catch (SQLException e) {
	            e.printStackTrace(); // Consider using a logging framework
	        }
	    }
	}

	public List<Object[]> searchResultByUserInput(String userInput) {
	    List<Object[]> resultList = new ArrayList<>();
	    PreparedStatement stmt = null;
	    ResultSet rs = null;

	    try {
	        String query = "SELECT e.examname, s.subjectname, sc.date, ser.obtainedpercentage, ser.status " +
	                       "FROM schedule sc " +
	                       "INNER JOIN exam e ON sc.examid = e.examid " +
	                       "INNER JOIN subject s ON sc.sid = s.sid " +
	                       "LEFT JOIN studentexamrelation ser ON sc.schid = ser.schid " +
	                       "WHERE sc.date LIKE ? " +
	                       "OR e.examname LIKE ? " +
	                       "OR s.subjectname LIKE ? " +
	                       "ORDER BY sc.date";
	        stmt = getConnection().prepareStatement(query);
	        stmt.setString(1, "%" + userInput + "%");
	        stmt.setString(2, "%" + userInput + "%");
	        stmt.setString(3, "%" + userInput + "%");
	        rs = stmt.executeQuery();

	        while (rs.next()) {
	            Object[] row = new Object[5]; // Assuming 5 columns are returned in the query
	            row[0] = rs.getString("examname");
	            row[1] = rs.getString("subjectname");
	            row[2] = rs.getDate("date");
	            row[3] = rs.getDouble("obtainedpercentage");
	            row[4] = rs.getDouble("status");
	            resultList.add(row);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace(); // Consider using a logging framework
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (stmt != null) stmt.close();
	            if (getConnection() != null) getConnection().close();
	        } catch (SQLException e) {
	            e.printStackTrace(); // Consider using a logging framework
	        }
	    }

	    return resultList;
	}

	    
	@Override
	public boolean isStudentExamRecordExists(String username, int schid) {
	    PreparedStatement stmt = null;
	    ResultSet rs = null;

	    try {
	        stmt = getConnection().prepareStatement("SELECT student.username, studentexamrelation.stid, studentexamrelation.schid " +
	                                     "FROM student " +
	                                     "JOIN studentexamrelation ON student.stid = studentexamrelation.stid " +
	                                     "WHERE student.username = ? AND studentexamrelation.schid = ?");
	        stmt.setString(1, username);
	        stmt.setInt(2, schid);
	        rs = stmt.executeQuery();
	        
	        // If there is at least one row in the result set, return true
	        return rs.next();
	    } catch (SQLException e) {
	        e.printStackTrace(); // Consider using a logging framework
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (stmt != null) stmt.close();
	            if (getConnection() != null) getConnection().close();
	        } catch (SQLException e) {
	            e.printStackTrace(); // Consider using a logging framework
	        }
	    }

	    // If an exception occurred or no rows were found, return false
	    return false;
	}

	    
	public List<Object[]> searchStudentInfoByNamePattern(String namePattern) {
	    List<Object[]> resultList = new ArrayList<>();
	    PreparedStatement stmt = null;
	    ResultSet rs = null;

	    try {
	        String query = "SELECT s.name AS student_name, s.email AS student_email, s.contact AS student_contact, " +
	                       "e.examname AS exam_name, sub.subjectname AS subject_name, " +
	                       "ser.obtainedpercentage AS obtained_marks, ser.status AS status, " +
	                       "sc.date AS schedule_date " +
	                       "FROM student s " +
	                       "JOIN studentexamrelation ser ON s.stid = ser.stid " +
	                       "JOIN schedule sc ON ser.schid = sc.schid " +
	                       "JOIN exam e ON sc.examid = e.examid " +
	                       "JOIN subject sub ON sc.sid = sub.sid " +
	                       "WHERE s.name LIKE ?";
	        stmt = getConnection().prepareStatement(query);
	        stmt.setString(1, "%" + namePattern + "%");
	        rs = stmt.executeQuery();

	        while (rs.next()) {
	            Object[] row = new Object[8]; // Assuming 8 columns are returned in the query
	            row[0] = rs.getString("student_name");
	            row[1] = rs.getString("student_email");
	            row[2] = rs.getString("student_contact");
	            row[3] = rs.getString("exam_name");
	            row[4] = rs.getString("subject_name");
	            row[5] = rs.getDouble("obtained_marks");
	            row[6] = rs.getDouble("status");
	            row[7] = rs.getDate("schedule_date");
	            resultList.add(row);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace(); // Consider using a logging framework
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (stmt != null) stmt.close();
	            if (getConnection() != null) getConnection().close();
	        } catch (SQLException e) {
	            e.printStackTrace(); // Consider using a logging framework
	        }
	    }

	    return resultList;
	}



	@Override
	public List<StudentModel> getAllSecreteUser() {
		 List<StudentModel> students = new ArrayList<>();
	        String query = "select username, password from student";

	        try (Connection conn = getConnection();
	             PreparedStatement stmt = conn.prepareStatement(query);
	             ResultSet rs = stmt.executeQuery()) {

	            while (rs.next()) {
	            	StudentModel student = new StudentModel();
	            	student.setUsername(rs.getString("username"));
	            	student.setPassword(rs.getString("password"));
	            	students.add(student);
	            }
	        } catch (SQLException e) {
	          
	            System.err.println("Error fetching admin secrets: " + e.getMessage());
	            e.printStackTrace();
	        }

	        return students;
	}

}
