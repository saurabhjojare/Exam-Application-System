package com.exam.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement; 
import java.sql.DatabaseMetaData; 

import com.exam.helper.PathHelper;

public class CreateDatabase{

    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost";

    static final String USER = "root";
    static final String PASS = "root"; 

    protected static Connection conn;
    protected static Statement stmt;
    protected static ResultSet rs;

    public static void main(String[] args)  {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            System.out.println("Connecting to database...");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            System.out.println("Creating database...");
            stmt = conn.createStatement();

            String sql = "CREATE DATABASE IF NOT EXISTS ExamApplicationSystemDemo";
            stmt.executeUpdate(sql);
            System.out.println("Database created successfully...");

            System.out.println("Switching to ExamApplicationSystem database...");
            stmt.executeUpdate("USE ExamApplicationSystem");

            // Create tables
            createTable(stmt, "subject", "(sid int(5) primary key auto_increment, subjectname varchar(200) not null unique)");
            createTable(stmt, "question", "(qid int(5) primary key auto_increment, question varchar(400) not null unique, op1 varchar(200) not null, op2 varchar(200) not null, op3 varchar(200) not null, op4 varchar(200) not null, answer int(5) not null)");
            createTable(stmt, "subjectquestionjoin", "(qid int(5), sid int(5), foreign key (qid) references question(qid) on delete cascade on update cascade, foreign key (sid) references subject(sid) on delete cascade on update cascade)");
            createTable(stmt, "exam", "(examid int(5) primary key auto_increment, examname varchar(200) not null unique, totalmarks int(5) not null, passingmarks int(5) not null)");
            createTable(stmt, "schedule", "(schid int(5) primary key auto_increment, examid int(5), foreign key (examid) references exam(examid) on delete cascade on update cascade, date date not null, starttime time not null, endtime time not null, sid int(5), foreign key (sid) references subject(sid) on delete cascade on update cascade)");
            createTable(stmt, "student", "(stid int(5) primary key, name varchar(200) not null unique, email varchar(200) not null unique, contact varchar(200) not null unique, username varchar(200) not null unique, password varchar(200) not null unique)");
            createTable(stmt, "studentsubjectjoin", "(stid int(5), sid int(5), foreign key (stid) references student(stid) on delete cascade on update cascade, foreign key (sid) references subject(sid) on delete cascade on update cascade)");
            createTable(stmt, "studentexamrelation", "(stid int(5), schid int(5), obtainedpercentage decimal(5,2) not null default 0.0, status decimal(5,2) default 0.0, foreign key (stid) references student(stid) on delete cascade on update cascade, foreign key (schid) references schedule(schid) on delete cascade on update cascade)");

            System.out.println("Tables created successfully...");

            stmt.close();
            conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
            } catch (SQLException se2) {
            }
            try {
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }

    static void createTable(Statement stmt, String tableName, String tableDefinition) throws SQLException {
        DatabaseMetaData meta = conn.getMetaData(); 
        ResultSet rs = meta.getTables(null, null, tableName, new String[]{"TABLE"});
        if (!rs.next()) {
            String sql = "CREATE TABLE " + tableName + tableDefinition;
            stmt.executeUpdate(sql);
            System.out.println("Table " + tableName + " created successfully...");
        } else {
            System.out.println("Table " + tableName + " already exists...");
        }
    }
}
