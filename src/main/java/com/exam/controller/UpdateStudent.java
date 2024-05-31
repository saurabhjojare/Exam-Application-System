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
import com.exam.service.StudentService;
import com.exam.service.StudentServiceImpl;

@WebServlet("/updateStudent")
public class UpdateStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // Get the updated student details from the request
        PrintWriter out = response.getWriter();
        // Get the session and the current username
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        String oldUsername = (String) session.getAttribute("username");

        int stid = Integer.parseInt(request.getParameter("stid"));
        String newUsername = request.getParameter("username");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String contact = request.getParameter("contact");
        String password = request.getParameter("password");
        
        // Create a new student model object with the updated details
        StudentModel student = new StudentModel();
        student.setStid(stid);
        student.setUsername(newUsername);
        student.setName(name);
        student.setEmail(email);
        student.setContact(contact);
        student.setPassword(password);

        // Get the student service and update the student details
        StudentService studentService = new StudentServiceImpl();
        boolean isUpdated = studentService.updateStudentByStid(student);

        // Redirect to profile page or show success message
        if (isUpdated) {
            if (!oldUsername.equals(newUsername)) {
                session.setAttribute("username", newUsername);
            }
            response.sendRedirect("profile.jsp?success=true");
        } else {
            response.sendRedirect("profile.jsp?success=false");
        }
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
