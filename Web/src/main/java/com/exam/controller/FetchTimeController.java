package com.exam.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import com.exam.service.ExamService;
import com.exam.service.ExamServiceImpl;
import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/fetchTime")
public class FetchTimeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final ExamService examService = new ExamServiceImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        int scheduleId = Integer.parseInt(request.getParameter("scheduleId"));

        String time = examService.getTimeBySchId(scheduleId);
        
        List<String> timeList = new ArrayList<>();
        if (time != null) {
            timeList.add(time);
            // Log success message to Tomcat console
            System.out.println("Time retrieved successfully for schedule Id: " + scheduleId);
        } else {
            // Log error message to Tomcat console
            System.err.println("Error: Failed to retrieve time for schedule Id: " + scheduleId);
        }

        // Convert list of time strings to JSON
        Gson gson = new Gson();
        String jsonTime = gson.toJson(timeList);

        PrintWriter out = response.getWriter();
        out.print(jsonTime);
        out.flush();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
