package com.exam.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.exam.service.SubjectService;
import com.exam.service.SubjectServiceImpl;

@WebServlet("/selectSubject")
public class SelectSubjectController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession existingSession = request.getSession(false);
        if (existingSession == null || existingSession.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String username = (String) existingSession.getAttribute("username");
        System.out.println(username);
        
        SubjectService subjectService = new SubjectServiceImpl();
        List<String> listSubject = subjectService.getAllSubjects();

        // Get the message from the session and remove it
        HttpSession session = request.getSession();
        String message = (String) session.getAttribute("message");
        session.removeAttribute("message");

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            request.getRequestDispatcher("common-resources.jsp").include(request, response);
            request.getRequestDispatcher("userSession.jsp").include(request, response);
            out.println("<!doctype html>");
            out.println("<html lang=\"en\">");
            out.println("<head>");
            out.println("<meta charset=\"utf-8\">");
            out.println("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">");
            out.println("<title>Select Subject</title>");
            out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"css/selectSubject.css\">");
            out.println("</head>");
            out.println("<body>");
            request.getRequestDispatcher("navbar.jsp").include(request, response);

            out.println("<main>");
            out.println("<section class=\"py-5\">");
            out.println("<div class=\"loginWidth\">");
            out.println("<div class=\"container-sm\">");
            out.println("<h1 class=\"display-4 text-center\">Select Subject</h1>");
            out.println("<center>");
            out.println("<span class=\"\" style=\"font-size: 1.9rem;font-weight: 300;\">Hello, <strong>" + username + "</strong></span><br>");
            if (message != null) {
                out.println("<span class=\"text-center\" id=\"message\">" + message + "</span>");
            }
            out.println("</center>");
            out.println("<p class=\"lead text-center\">Choose a subject</p>");
            out.println("<form id=\"signupForm\" name='form' action='assignsubject' method='POST'>");
            out.println("<input type=\"hidden\" id=\"userId\" name=\"userId\" value=\"" + username + "\">");
            out.println("<div class=\"mb-3\">");
            out.println("<label for=\"subjectDropdown\" class=\"form-label\">Select Subject</label>");
            out.println("<select class=\"form-select\" id=\"subjectDropdown\" name=\"subjectDropdown\" required>");
            out.println("<option selected disabled value=\"\">Choose a subject</option>");

            if (listSubject != null && !listSubject.isEmpty()) {
                for (String subject : listSubject) {
                    out.println("<option value=\"" + subject + "\">" + subject + "</option>");
                }
            } else {
                out.println("<option value=\"\">No subjects found.</option>");
            }

            out.println("</select>");
            out.println("<span class=\"text-muted\" id=\"subjectWarningMsg\"></span>");
            out.println("</div>");
            out.println("<center>");
            out.println("<button type=\"submit\" class=\"btn btn-primary\">Select Subject</button>");
            out.println("</center>");
            out.println("</form>");
            out.println("</div>");
            out.println("</div>");
            out.println("</section>");
            out.println("</main>");

            request.getRequestDispatcher("footer.jsp").include(request, response);

            out.println("<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz\" crossorigin=\"anonymous\"></script>");
            out.println("<script src=\"https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js\" integrity=\"sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r\" crossorigin=\"anonymous\"></script>");
            out.println("<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js\" integrity=\"sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy\" crossorigin=\"anonymous\"></script>");
            out.println("<script src=\"js/hideMessge.js\"></script>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
