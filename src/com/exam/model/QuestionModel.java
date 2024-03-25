package com.exam.model;

// This class represents a model for a question object
public class QuestionModel {

    // Fields to store question information
    private int id; // Unique identifier for the question
    private String name; // Text of the question
    private String op1, op2, op3, op4; // Options for the question
    private int answer; // Correct answer option number

    // Default constructor
    public QuestionModel() {
        // Empty constructor
    }

    // Parameterized constructor to initialize the question with details
    public QuestionModel(String name, String op1, String op2, String op3, String op4, int answer) {
        this.name = name;
        this.op1 = op1;
        this.op2 = op2;
        this.op3 = op3;
        this.op4 = op4;
        this.answer = answer;
    }

    public QuestionModel(int id, String name, String op1, String op2, String op3, String op4, int answer) {
        this.id = id;
        this.name = name;
        this.op1 = op1;
        this.op2 = op2;
        this.op3 = op3;
        this.op4 = op4;
        this.answer = answer;
    }

    // Getter method for retrieving the question ID
    public int getId() {
        return id;
    }

    // Setter method for setting the question ID
    public void setId(int id) {
        this.id = id;
    }

    // Getter method for retrieving the question text
    public String getName() {
        return name;
    }

    // Setter method for setting the question text
    public void setName(String name) {
        this.name = name;
    }

    // Getter method for retrieving option 1
    public String getOp1() {
        return op1;
    }

    // Setter method for setting option 1
    public void setOp1(String op1) {
        this.op1 = op1;
    }

    // Getter method for retrieving option 2
    public String getOp2() {
        return op2;
    }

    // Setter method for setting option 2
    public void setOp2(String op2) {
        this.op2 = op2;
    }

    // Getter method for retrieving option 3
    public String getOp3() {
        return op3;
    }

    // Setter method for setting option 3
    public void setOp3(String op3) {
        this.op3 = op3;
    }

    // Getter method for retrieving option 4
    public String getOp4() {
        return op4;
    }

    // Setter method for setting option 4
    public void setOp4(String op4) {
        this.op4 = op4;
    }

    // Getter method for retrieving the correct answer option number
    public int getAnswer() {
        return answer;
    }

    // Setter method for setting the correct answer option number
    public void setAnswer(int answer) {
        this.answer = answer;
    }

    // toString method
    @Override
    public String toString() {
        return "Question{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", op1='" + op1 + '\'' +
                ", op2='" + op2 + '\'' +
                ", op3='" + op3 + '\'' +
                ", op4='" + op4 + '\'' +
                ", answer=" + answer +
                '}';
    }
}
