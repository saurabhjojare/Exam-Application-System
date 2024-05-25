package com.exam.model;

public class QuestionModel {

	private int id;
	private String name;
	private String op1, op2, op3, op4;
	private int answer;

	public QuestionModel() {
	}

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

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getOp1() {
		return op1;
	}

	public void setOp1(String op1) {
		this.op1 = op1;
	}

	public String getOp2() {
		return op2;
	}

	public void setOp2(String op2) {
		this.op2 = op2;
	}

	public String getOp3() {
		return op3;
	}

	public void setOp3(String op3) {
		this.op3 = op3;
	}

	public String getOp4() {
		return op4;
	}

	public void setOp4(String op4) {
		this.op4 = op4;
	}

	public int getAnswer() {
		return answer;
	}

	public void setAnswer(int answer) {
		this.answer = answer;
	}

	@Override
	public String toString() {
		return "Question{" + "id=" + id + ", name='" + name + '\'' + ", op1='" + op1 + '\'' + ", op2='" + op2 + '\''
				+ ", op3='" + op3 + '\'' + ", op4='" + op4 + '\'' + ", answer=" + answer + '}';
	}
}
