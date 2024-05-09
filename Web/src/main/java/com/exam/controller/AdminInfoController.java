package com.exam.controller;

import com.exam.repository.AdminRepository;
import com.exam.repository.AdminRepositoryImpl;
import com.exam.service.AdminService;
import com.exam.service.AdminServiceImpl;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admininfo")
public class AdminInfoController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdminRepository adminRepository;

    @Override
    public void init() throws ServletException {
        try {
            // Instantiate AdminRepository implementation
            adminRepository = new AdminRepositoryImpl();
            
            // Instantiate AdminService implementation
            AdminService adminService = new AdminServiceImpl(adminRepository);
            
            // Set the adminService attribute in the servlet context
            getServletContext().setAttribute("adminService", adminService);
        } catch (Exception e) {
            throw new ServletException("Error initializing AdminInfoController", e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // This servlet doesn't handle GET requests, so redirect to another page
        response.sendRedirect("profile-page.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Delegate to doGet() for handling POST requests
        doGet(request, response);
    }
}
