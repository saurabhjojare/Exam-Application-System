package com.exam.controller;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;

import com.exam.service.ExamService;
import com.exam.service.ExamServiceImpl;
import com.exam.repository.ExamRepository;
import com.exam.repository.ExamRepositoryImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/deleteExam")
public class DeleteExam extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        ExamRepository aRepository = new ExamRepositoryImpl();
        ExamService aService = new ExamServiceImpl();
        
        int id = Integer.parseInt(request.getParameter("id"));
        boolean b = aService.isDeleteExamById(id); // Fix variable name from mid to id
        if (b) {
            request.setAttribute("successMessage", "Exam Deleted");
            RequestDispatcher r = request.getRequestDispatcher("view-exam.jsp");
            r.forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Exam Not Deleted");
            RequestDispatcher r = request.getRequestDispatcher("view-exam.jsp");
            r.forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
