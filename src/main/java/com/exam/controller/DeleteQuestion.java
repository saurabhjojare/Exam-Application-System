package com.exam.controller;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;

import com.exam.service.*;
import com.exam.repository.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/deleteQuestion")
public class DeleteQuestion extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        QuestionRepository aRepository = new QuestionRepositoryImpl();
        QuestionService aService = new QuestionServiceImpl();
        
        int id = Integer.parseInt(request.getParameter("id"));
        boolean b = aService.isDeleteQuestionById(id); // Fix variable name from mid to id
        if (b) {
            request.setAttribute("successMessage", "Question Deleted");
            RequestDispatcher r = request.getRequestDispatcher("view-question.jsp");
            r.forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Question Not Deleted");
            RequestDispatcher r = request.getRequestDispatcher("view-question.jsp");
            r.forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
