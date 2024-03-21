package com.exam.model;

// This class represents the model for an exam
public class ExamModel {
    // Private fields to store exam details
    private int id; // Unique identifier for the exam
    private String name; // Name of the exam
    private ScheduleModel scheduleModel; // ScheduleModel object containing exam schedule details
    private int totalMarks; // Total marks for the exam
    private int passingMarks; // Marks required to pass the exam

    // Constructor without parameters
    public ExamModel() {

    }

    // Constructor with parameters to initialize name, totalMarks, and passingMarks
    public ExamModel(String name, int totalMarks, int passingMarks) {
        this.name = name;
        this.totalMarks = totalMarks;
        this.passingMarks = passingMarks;
    }

    // Getter method for retrieving the exam's schedule model
    public ScheduleModel getScheduleModel() {
        return scheduleModel;
    }

    // Setter method for setting the exam's schedule model
    public void setScheduleModel(ScheduleModel scheduleModel) {
        this.scheduleModel = scheduleModel;
    }

    // Getter method for retrieving the exam ID
    public int getId() {
        return id;
    }

    // Setter method for setting the exam ID
    public void setId(int id) {
        this.id = id;
    }

    // Getter method for retrieving the exam name
    public String getName() {
        return name;
    }

    // Setter method for setting the exam name
    public void setName(String name) {
        this.name = name;
    }

    // Getter method for retrieving the total marks of the exam
    public int getTotalMarks() {
        return totalMarks;
    }

    // Setter method for setting the total marks of the exam
    public void setTotalMarks(int totalMarks) {
        this.totalMarks = totalMarks;
    }

    // Getter method for retrieving the passing marks of the exam
    public int getPassingMarks() {
        return passingMarks;
    }

    // Setter method for setting the passing marks of the exam
    public void setPassingMarks(int passingMarks) {
        this.passingMarks = passingMarks;
    }
}
