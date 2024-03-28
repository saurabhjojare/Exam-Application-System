package com.exam.model;

import java.util.Date;

public class ScheduleModel {
    private int schid; 
    private int examid; 
    private String examDate; 
    public String startTime; 
    public String endTime; 
    public int sid; 

    public ScheduleModel() {

    }

    public ScheduleModel(int schid, String examDate, String startTime, String endTime, int examid) {
        this.examDate = examDate;
        this.startTime = startTime;
        this.endTime = endTime;
        this.examid = examid;
    }

    public ScheduleModel(int schid, String examDate, String startTime, String endTime, int examid, int sid) {
        this.sid = sid;
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

    public String getExamDate() {
        return examDate;
    }

    public void setExamDate(String d1) {
        this.examDate = d1;
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

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }
}
