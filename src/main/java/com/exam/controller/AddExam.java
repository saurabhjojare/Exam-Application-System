package com.exam.controller;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.exam.model.ExamModel;
import com.exam.model.SubjectModel;
import com.exam.service.ExamService;
import com.exam.service.ExamServiceImpl;

@WebServlet("/addexam")
public class AddExam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    response.setContentType("text/html");
	    PrintWriter out = response.getWriter();
	    ExamService examService = new ExamServiceImpl();

	    String examName = request.getParameter("examName");
	    String totalMarksStr = request.getParameter("totalMarks");
	    String passingMarksStr = request.getParameter("passingMarks");

	    // Parse totalMarks and passingMarks to integers
	    int totalMarks = Integer.parseInt(totalMarksStr);
	    int passingMarks = Integer.parseInt(passingMarksStr);

	    ExamModel examModel = new ExamModel(examName, totalMarks, passingMarks);
	    int result = examService.isAddExam(examModel);
	    
	    if (result == 1) {
            request.setAttribute("message", "<span class=\"text-success\">Exam Added</span>");
        } else if (result == -1) {
            request.setAttribute("message", "<span class=\"text-body-secondary\">Exam Already Exist</span>");
        } else {
            request.setAttribute("message", "<span class=\"text-danger\">Exam Not Added</span>");
        }

        request.getRequestDispatcher("add-exam.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
