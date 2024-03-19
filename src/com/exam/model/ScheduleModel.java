package com.exam.model;

import java.util.*;

public class ScheduleModel {
    private int schid;
    private int examid;
    private Date examDate;
    private String startTime, endTime;

    public ScheduleModel() {

    }

    public ScheduleModel(int schid, Date examDate, String startTime, String endTime, int examid) {
        this.examDate = examDate;
        this.startTime = startTime;
        this.endTime = endTime;
        this.examid = examid;
    } 

    public int getSchid() {
        return schid;
    }
    public void setSchid(int schid) {
        this.schid = schid;
    }
    public int getExamid() {
        return examid;
    }
    public void setExamid(int examid) {
        this.examid = examid;
    }
    public Date getExamDate() {
        return examDate;
    }
    public void setExamDate(Date examDate) {
        this.examDate = examDate;
    }
    public String getStartTime() {
        return startTime;
    }
    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }
    public String getEndTime() {
        return endTime;
    }
    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }
}
