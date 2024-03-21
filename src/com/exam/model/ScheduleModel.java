package com.exam.model;

import java.util.Date;

// Model class for representing exam schedules
public class ScheduleModel {
    private int schid; // Unique identifier for the schedule
    private int examid; // Identifier for the exam associated with this schedule
    private Date examDate; // Date of the exam
    public String startTime; // Start time of the exam
    public String endTime; // End time of the exam

    // Default constructor
    public ScheduleModel() {

    }

    // Parameterized constructor
    public ScheduleModel(int schid, Date examDate, String startTime, String endTime, int examid) {
        this.examDate = examDate;
        this.startTime = startTime;
        this.endTime = endTime;
        this.examid = examid;
    }

    // Getter method for schid
    public int getSchid() {
        return schid;
    }

    // Setter method for schid
    public void setSchid(int schid) {
        this.schid = schid;
    }

    // Getter method for examid
    public int getExamid() {
        return examid;
    }

    // Setter method for examid
    public void setExamid(int examid) {
        this.examid = examid;
    }

    // Getter method for examDate
    public Date getExamDate() {
        return examDate;
    }

    // Setter method for examDate
    public void setExamDate(Date examDate) {
        this.examDate = examDate;
    }

    // Getter method for startTime
    public String getStartTime() {
        return startTime;
    }

    // Setter method for startTime
    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    // Getter method for endTime
    public String getEndTime() {
        return endTime;
    }

    // Setter method for endTime
    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }
}
