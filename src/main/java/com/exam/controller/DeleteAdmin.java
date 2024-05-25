package com.exam.controller;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;

import com.exam.service.AdminService;
import com.exam.service.AdminServiceImpl;
import com.exam.repository.AdminRepository;
import com.exam.repository.AdminRepositoryImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/deleteAdmin")
public class DeleteAdmin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        AdminRepository aRepository = new AdminRepositoryImpl();
        AdminService aService = new AdminServiceImpl(aRepository);
        
        int id = Integer.parseInt(request.getParameter("id"));
        boolean b = aService.isDeleteAdminById(id); // Fix variable name from mid to id
        if (b) {
            request.setAttribute("successMessage", "Admin Deleted");
            RequestDispatcher r = request.getRequestDispatcher("view-admin.jsp");
            r.forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Admin Not Deleted");
            RequestDispatcher r = request.getRequestDispatcher("view-admin.jsp");
            r.forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
