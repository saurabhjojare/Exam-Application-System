package com.exam.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.exam.model.ScheduleModel;
import com.exam.repository.ExamRepository;
import com.exam.repository.ExamRepositoryImpl;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/fetchSchedules")
public class FetchSchedules extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int examId = Integer.parseInt(request.getParameter("examId"));
        ExamRepository examRepository = new ExamRepositoryImpl();
        try {
            List<ScheduleModel> schedules = examRepository.getExamSchedule(examId);
            // Convert schedules to JSON and send the response
            ObjectMapper mapper = new ObjectMapper();
            String json = mapper.writeValueAsString(schedules);
            response.setContentType("application/json");
            response.getWriter().write(json);
        } catch (SQLException e) {
            // Handle SQLException
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Error fetching schedules");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
