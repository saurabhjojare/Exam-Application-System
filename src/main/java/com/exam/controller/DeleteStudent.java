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


@WebServlet("/deleteStudent")
public class DeleteStudent extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        StudentRepository aRepository = new StudentRepositoryImpl();
        StudentService aService = new StudentServiceImpl();
        
        int id = Integer.parseInt(request.getParameter("id"));
        boolean b = aService.isDeleteStudentById(id); // Fix variable name from mid to id
        if (b) {
            request.setAttribute("successMessage", "Student Deleted");
            RequestDispatcher r = request.getRequestDispatcher("view-student.jsp");
            r.forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Student Not Deleted");
            RequestDispatcher r = request.getRequestDispatcher("view-student.jsp");
            r.forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
