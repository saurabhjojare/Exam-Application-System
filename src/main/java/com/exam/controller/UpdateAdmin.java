package com.exam.controller;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.exam.model.AdminModel;
import com.exam.service.AdminService;
import com.exam.service.AdminServiceImpl;
import com.exam.repository.AdminRepository;
import com.exam.repository.AdminRepositoryImpl;

@WebServlet("/updateAdmin")
public class UpdateAdmin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("adminUsername") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String oldUsername = (String) session.getAttribute("adminUsername");

        int stid = Integer.parseInt(request.getParameter("stid"));
        String newUsername = request.getParameter("email");
        String name = request.getParameter("name");
        String contact = request.getParameter("contact");
        String password = request.getParameter("password");

        AdminModel admin = new AdminModel();
        admin.setId(stid);
        admin.setEmail(newUsername);
        admin.setfullName(name);
        admin.setContact(contact);

        if (password != null && !password.isEmpty()) {
            admin.setPassword(password);
        }

        AdminRepository aRepo = new AdminRepositoryImpl();  // Assuming AdminRepositoryImpl exists
        AdminService adminService = new AdminServiceImpl(aRepo);
        boolean isUpdated = adminService.updateAdminById(stid, admin);

        if (isUpdated) {
            if (!oldUsername.equals(newUsername)) {
                session.setAttribute("adminUsername", newUsername);
            }
            response.sendRedirect("profile-page.jsp?success=true");
        } else {
            response.sendRedirect("profile-page.jsp?success=false");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
