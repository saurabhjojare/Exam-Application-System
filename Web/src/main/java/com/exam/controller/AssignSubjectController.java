package com.exam.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.exam.service.SubjectService;
import com.exam.service.SubjectServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/assignsubject")
public class AssignSubjectController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        SubjectService sv = new SubjectServiceImpl();

        // Get subject name and user ID from request parameters
        String subjectName = request.getParameter("subjectDropdown").trim();
        String studentName = request.getParameter("userId").trim();

        // Log input parameters for debugging
        System.out.println("Received subjectName: " + subjectName);
        System.out.println("Received studentName: " + studentName);

        // Fetch subject ID using the subject name
        int subjectId = sv.getSubjectIdBySubjectName(subjectName);
        int studentId = sv.getStidByUserName(studentName);
  
        // Call service method to add student subject association
        boolean success = sv.addStudentSubjectAssociation(studentId, subjectId);
        
        HttpSession session = request.getSession();
        if (success) {
            session.setAttribute("message", "Subject Assigned");
        } else {
            session.setAttribute("message", "Something Wrong");
        }
        response.sendRedirect("select-subject.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
