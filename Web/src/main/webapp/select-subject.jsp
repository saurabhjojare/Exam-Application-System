<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.util.List"%>
<%@ page import="com.exam.repository.SubjectRepository"%>
<%@ page import="com.exam.repository.SubjectRepositoryImpl"%>
<%@ page import="com.exam.service.SubjectService"%>
<%@ page import="com.exam.service.SubjectServiceImpl"%>
<%@ page import="com.exam.model.ScheduleModel"%>
<%@ page import="com.exam.model.SubjectModel"%>
	
	<%
HttpSession existingSession = request.getSession(false);
if (existingSession == null || existingSession.getAttribute("username") == null) {
	response.sendRedirect("login.jsp");
	// Optional: You can use <jsp:forward> here if you want to ensure that the rest of the JSP page isn't processed.
	// <jsp:forward page="login.jsp" />
}
String username = (String) existingSession.getAttribute("username");
%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Select Subject</title>
<link rel="icon" href="../img/favicon.png" type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/login.css">
<link rel="stylesheet" type="text/css" href="css/sign-up.css">

</head>
<body>
    <%
    request.setAttribute("showNavbarBrand", true);
    %>
    <%@ include file="navbar.jsp"%>

    <!-- Body -->
    <main>
        <section class="py-5">
            <div class="loginWidth">
                <div class="container-sm">
                    <h1 class="display-4 text-center">Select Subject</h1>
                     <%  
                        SubjectService subjectService = new SubjectServiceImpl();
						SubjectRepository subjectRepository = new SubjectRepositoryImpl();
//                         int studentId = subjectService.getStidByUserName(username); 
                       %>
                    <center>
                        
                       
                        <span class="" style = "font-size: 1.9rem;font-weight: 300;">Hello, <strong><%=username%></strong></span><br>
                        <span class="text-center" id="message">${message}</span>
                    </center>
                    <p class="lead text-center">Choose a subject</p>
                    <form id="signupForm" name='form' action='assignsubject' method='POST'>
                            <input type = "hidden" id="userId" name="userId" value = "<%=username%>">

                        <div class="mb-3">
                            <label for="subjectDropdown" class="form-label">Select Subject</label>
                         
                            <select class="form-select" id="subjectDropdown" name="subjectDropdown" required>
         					<option selected disabled value="">Choose a subject</option>
         					  <%
							// Assuming examList contains a list of ExamModel objects
							
			                List<String> listSubject = subjectService.getAllSubjects();
			              
			                if (listSubject != null && !listSubject.isEmpty()) {
								int count = 1;
								int totalSubject = listSubject.size();
								for (String subject : listSubject) {
							%>
                                <option value="<%= subject %>"><%= subject %></option>
         					 <%
						if (count <= totalSubject) { // Check if it's not the last iteration
						%>
						<tr class="empty-row">
							<td colspan="2"></td>
							<!-- Add empty cells for space between each set of exam details -->
						</tr>
						<%
						} // End of if
						} // End of loop 
						} else {
						// Handle case where QuestionList is null
						out.println("<tr><td colspan='2'>No subjects found.</td></tr>");
						}
						%>
                            </select>
                            <span class="text-muted" id="subjectWarningMsg"></span>
                        </div>
                        <center>
                            <button type="submit" class="btn btn-primary">Select Subject</button>
                        </center>

                    </form>
                </div>
            </div>
        </section>
    </main>

    <%@ include file="footer.jsp"%>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

    <script src="js/userSignupValidation.js"></script>
    <script type="text/javascript">
        // JavaScript to hide the message after 4 seconds
        setTimeout(function() {
            var messageElement = document.getElementById('message');
            if (messageElement) {
                messageElement.style.display = 'none';
            }
        }, 4000); // 4 seconds
    </script>
    
  
</body>
</html>
