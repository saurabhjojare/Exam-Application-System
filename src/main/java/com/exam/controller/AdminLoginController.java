package com.exam.controller;

import com.exam.service.AdminService;
import com.exam.service.AdminServiceImpl;
import com.exam.repository.AdminRepositoryImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/adminlogin")
public class AdminLoginController extends HttpServlet {

    private AdminService adminService;

    // Initialize the AdminService in the constructor
    public AdminLoginController() {
        this.adminService = new AdminServiceImpl(new AdminRepositoryImpl());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Check if the provided credentials are valid
        boolean isValidAdmin = adminService.loginAdmin(email, password);

        if (isValidAdmin) {
            // Create a session for the logged-in admin
            HttpSession session = request.getSession();
            session.setAttribute("adminUsername", email); // Store admin username in session
            
            // Redirect to admin dashboard or another admin page
            response.sendRedirect("admininfo");
        } else {
            // Redirect back to the login page with an error message
            response.sendRedirect("admin-login.jsp?InvalidCredential");
        }
    }
}
