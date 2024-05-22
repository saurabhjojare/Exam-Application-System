package com.exam.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.exam.repository.*;
import com.exam.service.*;
import com.exam.model.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/submitExam")
public class ExamSubmitServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	StudentService sService = new StudentServiceImpl();
    	StudentModel sModel = new StudentModel();
    	
        String scheduleId = request.getParameter("scheduleId");
        String username = request.getParameter("username");
        String percentage = request.getParameter("percentage");
        percentage = percentage.replace("%", ""); // Remove the percentage symbol

        String passOrFail = request.getParameter("passOrFail");
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        List<StudentModel> students = sService.getStudentByUsername(username);
        int stid = -1; // Default value if not found
        
        if (students != null && !students.isEmpty()) {
            stid = students.get(0).getStid(); // Assuming username is unique, taking the first student
        }
        
        String StudentPassOrFail = "<p>Pass/Fail: " + (passOrFail.equals("Pass") ? "1.0" : "0.0") + "</p>";

        
        boolean insertionResult = sService.insertStudentExamRelation(stid, Integer.parseInt(scheduleId), Double.parseDouble(percentage), passOrFail.equals("Pass") ? 1.0 : 0.0);
        
        if(insertionResult) {
            request.getRequestDispatcher("exam-complete.jsp").forward(request, response);
        } else {
        	request.getRequestDispatcher("examSubmitFailed.jsp").forward(request, response);
        }

//        out.println("<html><body>");
//        out.println("<h1>Exam Submission Result</h1>");
//        out.println("<p>Schedule ID: " + scheduleId + "</p>");
//        out.println("<p>Username: " + username + "</p>");
//        out.println("<p>Student ID: " + stid + "</p>");
//        out.println("<p>Percentage: " + percentage + "</p>");
//        out.println("<p>Pass/Fail: " + passOrFail + "</p>");
//        out.println("<p>Pass/Fail: " + StudentPassOrFail + "</p>");
//        out.println("</body></html>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
