package com.exam.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.exam.model.SubjectModel;
import com.exam.service.SubjectServiceImpl;
import com.exam.service.SubjectService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addsubject")
public class AddSubjectController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		SubjectModel model = new SubjectModel();
		SubjectService sv = new SubjectServiceImpl();
		String subjectName = request.getParameter("subjectName");
		model.setName(subjectName);

		int result = sv.addSubject(model);

		if (result == 1) {
            request.setAttribute("message", "<span class=\"text-success\">Subject Added</span>");
        } else if (result == -1) {
            request.setAttribute("message", "<span class=\"text-body-secondary\">Subject Already Added</span>");
        } else {
            request.setAttribute("message", "<span class=\"text-danger\">Subject Not Added</span>");
        }

        request.getRequestDispatcher("add-subject.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
