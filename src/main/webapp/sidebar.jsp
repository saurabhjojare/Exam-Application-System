<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sidebar</title>
<link rel="stylesheet" type="text/css" href="css/Sidebar.css">
<style>

.nav-link {
       color: #fff;
 }
 
 .nav-link:hover {
       color: #fff;
 }
 

.text-bg-dark {
    color: #fff !important;
    background-color: transparent;
    background: linear-gradient(to right, #1a2980, #26d0ce);
}

.nav-pills .nav-link.active, .nav-pills .show>.nav-link {
    color: #000;
    background-color: #fff;
    transition: none;
}
</style>



</head>
<body>
    <div class="d-flex">
        <!-- Sidebar -->
        <div class="d-flex flex-column flex-shrink-0 p-3 text-bg-dark sidebar" style="width: 280px;">
        <div class="sidebar-content">
            <a href="#" class="d-flex align-items-center mb-md-0 me-md-auto text-white text-decoration-none">
                <svg class="bi pe-none me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
                <span class="fs-4">Dashboard</span>
            </a>
<!--             <hr style = "margin-bottom: 0px;"> -->
            <ul class="nav nav-pills flex-column mb-auto">
                <li class="nav-item mt-2">
                    <a href="profile-page.jsp" class="nav-link <%=(request.getRequestURI().endsWith("profile-page.jsp")) ? "active" : "" %>" aria-current="page">
                        <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#home"></use></svg>
                        Profile
                    </a>
                </li>
                <li class="nav-item">
                    <a href="add-admin.jsp" class="nav-link <%=(request.getRequestURI().endsWith("add-admin.jsp")) ? "active" : "" %>" aria-current="page">
                        <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#home"></use></svg>
                        Add Admin
                    </a>
                </li>
                 <li class="nav-item">
                    <a href="view-admin.jsp" class="nav-link <%=(request.getRequestURI().endsWith("view-admin.jsp")) ? "active" : "" %>" aria-current="page">
                        <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#home"></use></svg>
                        View Admin
                    </a>
                </li>
                <hr style = "margin-top: 5px; margin-bottom: 5px;">
                <li>
                    <a href="add-exam.jsp" class="nav-link <%=(request.getRequestURI().endsWith("add-exam.jsp")) ? "active" : "" %>"">
                        <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#speedometer2"></use></svg>
                        Add Exam
                    </a>
                </li>
                <li>
                    <a href="view-exam.jsp" class="nav-link <%=(request.getRequestURI().endsWith("view-exam.jsp")) ? "active" : "" %>"">
                        <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#speedometer2"></use></svg>
                        View Exam
                    </a>
                </li>
                <li>
                    <a href="add-question.jsp" class="nav-link <%=(request.getRequestURI().endsWith("add-question.jsp")) ? "active" : "" %>"">
                        <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#table"></use></svg>
                        Add Question
                    </a>
                </li>
                 <li>
                    <a href="view-question.jsp" class="nav-link <%=(request.getRequestURI().endsWith("view-question.jsp")) ? "active" : "" %>"">
                        <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#table"></use></svg>
                        View Question
                    </a>
                </li>
                <li>
                    <a href="add-schedule.jsp" class="nav-link <%=(request.getRequestURI().endsWith("add-schedule.jsp")) ? "active" : "" %>"">
                        <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#grid"></use></svg>
                        Add Schedule
                    </a>
                </li>
                <li>
                    <a href="view-schedule.jsp" class="nav-link <%=(request.getRequestURI().endsWith("view-schedule.jsp")) ? "active" : "" %>"">
                        <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#grid"></use></svg>
                        View Schedule
                    </a>
                </li>
                <li>
                    <a href="add-subject.jsp" class="nav-link <%=(request.getRequestURI().endsWith("add-subject.jsp")) ? "active" : "" %>"">
                        <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#people-circle"></use></svg>
                        Add Subject
                    </a>
                </li>
                 <li>
                    <a href="view-subject.jsp" class="nav-link <%=(request.getRequestURI().endsWith("view-subject.jsp")) ? "active" : "" %>"">
                        <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#people-circle"></use></svg>
                        View Subject
                    </a>
                    <hr style = "margin-top: 5px; margin-bottom: 5px;">
                </li>
                 <li>
                    <a href="view-result.jsp" class="nav-link <%=(request.getRequestURI().endsWith("view-result.jsp")) ? "active" : "" %>"">
                        <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#people-circle"></use></svg>
                        View Result
                    </a>
                </li>
            </ul>
            <hr>
            <a class="dropdown-item text-center" href="adminlogout">Sign Out</a></li>
        </div>
        </div>
        
        <!-- Main Content Area -->
        <div class="flex-grow-1 ms-2">
            <!-- Your main content here -->
        </div>
    </div>
</body>
</html>