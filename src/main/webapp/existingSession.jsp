	<%
    HttpSession existingSession = request.getSession(false);
    if (existingSession == null || existingSession.getAttribute("adminUsername") == null) {
        response.sendRedirect("admin-login.jsp");
    }
    String username = (String) existingSession.getAttribute("adminUsername");
%>