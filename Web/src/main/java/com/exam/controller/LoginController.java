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

        String message;
        if (result == 1) {
            HttpSession session = request.getSession(); 
            session.setAttribute("username", username); 
            
            session = request.getSession();
            session.setMaxInactiveInterval(60 * 60); // Set the session timeout to one hour

            response.sendRedirect("profile.jsp");
          
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
