package com.exam.controller;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/fetchallquestions")
public class FetchAllQuestions extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Get the parameters sent by the form
        String examSelection = request.getParameter("examSelection");
        String scheduleSelection = request.getParameter("scheduleSelection");
        String timeSelection = request.getParameter("timeSelection");
        String subjectSelection = request.getParameter("subjectSelection");

        // Print out the selections
        out.println(examSelection);
        out.println(scheduleSelection);
        out.println(timeSelection);
        out.println(subjectSelection);
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}

