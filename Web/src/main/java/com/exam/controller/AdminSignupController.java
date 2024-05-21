package com.exam.controller;

import com.exam.model.AdminModel;
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

@WebServlet("/adminsignup")
public class AdminSignupController extends HttpServlet {

    private AdminService adminService;

    // Initialize the AdminService in the constructor
    public AdminSignupController() {
        this.adminService = new AdminServiceImpl(new AdminRepositoryImpl());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("fullName");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String contact = request.getParameter("contact");
        String email = request.getParameter("email");
        String role = request.getParameter("role");
        String department = request.getParameter("department");
        String permissions = request.getParameter("permissions");

        // Check if passwords match
        if (!password.equals(confirmPassword)) {
            response.sendRedirect("admin-signup.jsp?error=Passwords do not match");
            return;
        }

        // Create an AdminModel object
        AdminModel admin = new AdminModel();
        admin.setfullName(fullName);
        admin.setPassword(password); // Remember to hash the password before setting it
        admin.setContact(contact);
        admin.setEmail(email);
        admin.setRole(role);
        admin.setDepartment(department);
        admin.setPermissions(permissions);

        // Call the service layer to insert the admin
        boolean success = adminService.insertAdmin(admin);

        // If registration is successful, display message without redirecting
        if (success) {
            // Set success message in request attribute
            request.setAttribute("message", "<span class=\"text-success\">Admin Added</span>");
        } else {
        	request.setAttribute("message", "<span class=\"text-danger\">Admin Not Added</span>");
        }

        // Forward the request to the JSP to display the message
        request.getRequestDispatcher("add-admin.jsp").forward(request, response);
    }
}
