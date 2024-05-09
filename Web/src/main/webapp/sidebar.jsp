<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sidebar</title>
<link rel="icon" href="../img/favicon.png" type="image/x-icon">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>
    <div class="d-flex">
        <!-- Sidebar -->
        <div class="d-flex flex-column flex-shrink-0 p-3 text-bg-dark" style="width: 280px; height: 100vh;">
            <a href="#" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
                <svg class="bi pe-none me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
                <span class="fs-4">Dashboard</span>
            </a>
            <hr>
            <ul class="nav nav-pills flex-column mb-auto">
                <li class="nav-item">
                    <a href="profile-page.jsp" class="nav-link text-white <%=(request.getRequestURI().endsWith("profile-page.jsp")) ? "active" : "" %>" aria-current="page">
                        <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#home"></use></svg>
                        Admin
                    </a>
                </li>
                <li>
                    <a href="add-exam.jsp" class="nav-link text-white <%=(request.getRequestURI().endsWith("add-exam.jsp")) ? "active" : "" %>"">
                        <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#speedometer2"></use></svg>
                        Add Exam
                    </a>
                </li>
                <li>
                    <a href="view-exam.jsp" class="nav-link text-white <%=(request.getRequestURI().endsWith("view-exam.jsp")) ? "active" : "" %>"">
                        <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#speedometer2"></use></svg>
                        View Exam
                    </a>
                </li>
                <li>
                    <a href="add-question.jsp" class="nav-link text-white <%=(request.getRequestURI().endsWith("add-question.jsp")) ? "active" : "" %>"">
                        <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#table"></use></svg>
                        Add Question
                    </a>
                </li>
                 <li>
                    <a href="view-question.jsp" class="nav-link text-white <%=(request.getRequestURI().endsWith("view-question.jsp")) ? "active" : "" %>"">
                        <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#table"></use></svg>
                        View Question
                    </a>
                </li>
                <li>
                    <a href="add-schedule.jsp" class="nav-link text-white <%=(request.getRequestURI().endsWith("add-schedule.jsp")) ? "active" : "" %>"">
                        <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#grid"></use></svg>
                        Add Schedule
                    </a>
                </li>
                <li>
                    <a href="view-schedule.jsp" class="nav-link text-white <%=(request.getRequestURI().endsWith("view-schedule.jsp")) ? "active" : "" %>"">
                        <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#grid"></use></svg>
                        View Schedule
                    </a>
                </li>
                <li>
                    <a href="add-subject.jsp" class="nav-link text-white <%=(request.getRequestURI().endsWith("add-subject.jsp")) ? "active" : "" %>"">
                        <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#people-circle"></use></svg>
                        Add Subject
                    </a>
                </li>
                 <li>
                    <a href="view-subject.jsp" class="nav-link text-white <%=(request.getRequestURI().endsWith("view-subject.jsp")) ? "active" : "" %>"">
                        <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#people-circle"></use></svg>
                        View Subject
                    </a>
                </li>
            </ul>
            <hr>
            <a class="dropdown-item text-center" href="adminlogout">Sign Out</a></li>
        </div>
        
        <!-- Main Content Area -->
        <div class="flex-grow-1 ms-2">
            <!-- Your main content here -->
        </div>
    </div>
</body>
</html>