package com.exam.controller;

import java.io.IOException;

import com.exam.model.StudentModel;
import com.exam.service.ExamService;
import com.exam.service.ExamServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");

        ExamService examService = new ExamServiceImpl();
        StudentModel studentModel = new StudentModel();

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        studentModel.setUsername(username);
        studentModel.setPassword(password);

        int result = examService.isUserPresent(studentModel);

        // Set appropriate message based on the result
        String message;
        if (result == 1) {
            HttpSession session = request.getSession(); // Start a new session or get an existing one
            session.setAttribute("username", username); // Store username in the session

            // Redirect the response to attempt-exam.jsp
            response.sendRedirect("attempt-exam.jsp");
        } else {
            message = "User Does Not Exist";
            request.setAttribute("message", message);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
