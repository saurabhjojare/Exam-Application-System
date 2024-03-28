package com.exam.model;

public class ResultModel {

    private int stid;
    private int schid;
    private double obtainedPercentage;
    private Double status; // Using Double to allow null values

    public ResultModel() {

    }

    public ResultModel(int stid, int schid, double obtainedPercentage, Double status) {
        this.stid = stid;
        this.schid = schid;
        this.obtainedPercentage = obtainedPercentage;
        this.status = status;
    }

    // Getters and setters
    public int getStid() {
        return stid;
    }

    public void setStid(int stid) {
        this.stid = stid;
    }

    public int getSchid() {
        return schid;
    }

    public void setSchid(int schid) {
        this.schid = schid;
    }

    public double getObtainedPercentage() {
        return obtainedPercentage;
    }

    public void setObtainedPercentage(double obtainedPercentage) {
        this.obtainedPercentage = obtainedPercentage;
    }

    public Double getStatus() {
        return status;
    }

    public void setStatus(Double status) {
        this.status = status;
    }

    // toString method for debugging or printing
    @Override
    public String toString() {
        return "StudentExamRelation{" +
                "stid=" + stid +
                ", schid=" + schid +
                ", obtainedPercentage=" + obtainedPercentage +
                ", status=" + status +
                '}';
    }
}
