package com.exam.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;

@WebServlet("/importQuestion")
@MultipartConfig
public class ImportQuestionController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the selected subject from the form
        String selectedSubject = request.getParameter("subject");

        // Get the uploaded file
        Part filePart = request.getPart("fileInput");

        // Validate inputs
        if (selectedSubject == null || selectedSubject.isEmpty() || filePart == null || filePart.getSize() == 0) {
            request.setAttribute("message", "Please select a subject and upload a valid file.");
            request.getRequestDispatcher("importQuestion.jsp").forward(request, response);
            return;
        }

        // Get the file input stream
        InputStream fileContent = filePart.getInputStream();
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        // Process the file content (for example, read CSV and save questions to database)
        // Your file processing code goes here

        // Set success message and forward to the same page or another page
        request.setAttribute("message", "Questions imported successfully!");
        request.getRequestDispatcher("importQuestion.jsp").forward(request, response);
    }
}
