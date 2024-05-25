package com.exam.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.exam.model.ExamModel;
import com.exam.model.ScheduleModel;
import com.exam.service.ExamService;
import com.exam.service.ExamServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addschedule")
public class AddScheduleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    response.setContentType("text/html");
	    PrintWriter out = response.getWriter();
	    ScheduleModel sModel = new ScheduleModel();
	    ExamService examService = new ExamServiceImpl();

	    String examName = request.getParameter("examName");
	    String examDate = request.getParameter("examDate");
	    String startTime = request.getParameter("startTime");
	    String endTime = request.getParameter("endTime");
	    String subjectName = request.getParameter("subjectName");
	    	    
	    try {
	        // Get the ExamModel by name
	        ExamModel eModel = examService.getExamIdByName(examName);

	        // Set the properties of ScheduleModel
	        sModel.setExamid(eModel.getId());
	        sModel.setExamDate(examDate);
	        sModel.setStartTime(startTime);
	        sModel.setEndTime(endTime);
	        eModel.setScheduleModel(sModel);

	        // Check if the schedule is set successfully
	        boolean b = examService.isSetSchedule(eModel, subjectName);

	        String message; 
		    
		    if (b) {
		        message = "<span class=\"text-success\">Schedule Added</span>";
		    } else {
		        message = "<span class=\"text-danger\">Schedule Not Added</span>";
		        request.setAttribute("message", message);
		        request.getRequestDispatcher("add-schedule.jsp").forward(request, response);
		        return; 
		    }
		    
		    request.setAttribute("message", message);
		    request.getRequestDispatcher("add-schedule.jsp").forward(request, response);
		    
	    } catch (Exception e) {
	        e.printStackTrace(); // Handle the exception properly
	        out.println("Error: " + e.getMessage());
	    }
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
