package com.exam.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import com.exam.model.SubjectModel;
import com.exam.repository.SubjectRepository;
import com.exam.repository.SubjectRepositoryImpl;
import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/fetchSubjects")
public class FetchSubjectController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        int scheduleId = Integer.parseInt(request.getParameter("scheduleId"));

        SubjectRepository subjectRepository = new SubjectRepositoryImpl();
        String subjectName = subjectRepository.getSubjectNameBySchid(scheduleId);
        
        List<SubjectModel> subjects = new ArrayList<>();
        if (subjectName != null) {
            SubjectModel subject = new SubjectModel();
            subject.setName(subjectName);
            subjects.add(subject);
        }

        System.out.println("Fetched subjects for schedule Id: " + scheduleId);

        // Convert list of SubjectModel objects to JSON
        Gson gson = new Gson();
        String jsonSubjects = gson.toJson(subjects);

        PrintWriter out = response.getWriter();
        out.print(jsonSubjects);
        out.flush();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}