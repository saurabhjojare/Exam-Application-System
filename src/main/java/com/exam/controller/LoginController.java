package com.exam.controller;

import java.io.IOException;

import com.exam.service.AdminService;
import com.exam.service.AdminServiceImpl;
import com.exam.repository.AdminRepositoryImpl;
import com.exam.service.StudentService;
import com.exam.service.StudentServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");

        StudentService examService = new StudentServiceImpl();
        AdminService adminService = new AdminServiceImpl(new AdminRepositoryImpl());

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        String email = request.getParameter("username");
        String message;

        boolean result = examService.loginStudent(username,password);
       
        boolean isValidAdmin = adminService.loginAdmin(email, password);
        
        if (isValidAdmin) {
            HttpSession session = request.getSession();
            session.setAttribute("adminUsername", email); 
            response.sendRedirect("admininfo");
        } else if (result){
        	 HttpSession session = request.getSession(); 
             session.setAttribute("username", username); 
             session = request.getSession();
             response.sendRedirect("profile.jsp");
        } else {
        	message = "<span class=\"text-danger\">User Not Found</span>";
            request.setAttribute("message", message);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
