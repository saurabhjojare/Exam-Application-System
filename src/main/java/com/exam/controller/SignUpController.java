package com.exam.controller;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.exam.model.StudentModel;
import com.exam.service.ExamService;
import com.exam.service.ExamServiceImpl;

@WebServlet("/signup")
public class SignUpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    response.setContentType("text/html");
	    PrintWriter out = response.getWriter();

	    ExamService examService = new ExamServiceImpl();
	    StudentModel studentModel = new StudentModel();

	    String fullName = request.getParameter("fullName");
	    String username = request.getParameter("username");
	    String email = request.getParameter("email");
	    String contact = request.getParameter("contact");
	    String signupPassword = request.getParameter("signupPassword");

	    // Check if an existing session exists
	    HttpSession existingSession = request.getSession(false);
	    if (existingSession != null) {
	        // If an existing session exists, invalidate it
	        existingSession.invalidate();
	    }

	    // Create a new session
	    HttpSession session = request.getSession();
	    session.setAttribute("username", username);

	    studentModel.setName(fullName);
	    studentModel.setUsername(username);
	    studentModel.setEmail(email);
	    studentModel.setContact(contact);
	    studentModel.setPassword(signupPassword);

	    boolean result = examService.addUser(studentModel);

	    // Check if the result is true or false
	    if (result) {
	    	// If the addition failed, set an appropriate message and forward to sign-up.jsp
	        String message = "<span class=\"text-success\">Welcome Aboard</span>";
	        request.setAttribute("message", message);
	        request.getRequestDispatcher("login.jsp").forward(request, response);
	    } else {
	        // If the addition failed, set an appropriate message and forward to sign-up.jsp
	        String message = "<span class=\"text-danger\">Something Went Wrong</span>";
	        request.setAttribute("message", message);
	        request.getRequestDispatcher("sign-up.jsp").forward(request, response);
	    }
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
