package com.exam.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.exam.model.QuestionModel;
import com.exam.repository.QuestionRepository;
import com.exam.repository.QuestionRepositoryImpl;
import com.exam.service.QuestionService;
import com.exam.service.QuestionServiceImpl;
import com.exam.service.SubjectService;
import com.exam.service.SubjectServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addquestion")
public class AddQuestionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		SubjectService sv = new SubjectServiceImpl();
		QuestionService qService = new QuestionServiceImpl();
		QuestionRepository qRepo = new QuestionRepositoryImpl();
		
		String questionName = request.getParameter("questionName");
	    String option1 = request.getParameter("option1");
	    String option2 = request.getParameter("option2");
	    String option3 = request.getParameter("option3");
	    String option4 = request.getParameter("option4");
	    String answerStr = request.getParameter("answer"); 
	    int answer = Integer.parseInt(answerStr); 
	    String subjectName = request.getParameter("subjectName");
	       
	    QuestionModel qModel = new QuestionModel(questionName, option1, option2, option3, option4, answer);
	    boolean b = qService.isAddQuestion(qModel, subjectName);
	    
	    String message; 
	    
	    if (b) {
	        message = "<span class=\"text-success\">Question Added</span>";
	    } else {
	        message = "<span class=\"text-danger\">Question Not Added</span>";
	        request.setAttribute("message", message);
	        request.getRequestDispatcher("add-question.jsp").forward(request, response);
	        return; 
	    }
	    
	    request.setAttribute("message", message);
	    request.getRequestDispatcher("add-question.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
