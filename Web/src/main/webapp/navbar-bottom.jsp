<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bottom Navbar</title>
<link rel="stylesheet" type="text/css" href="css/navbarBottom.css">
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-dark bg-dark navbar-bottom" aria-label="First navbar example">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Dashboard</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample01" aria-controls="navbarsExample01" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarsExample01">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a href="profile-page.jsp" class="nav-link text-white <%=(request.getRequestURI().endsWith("profile-page.jsp")) ? "active" : "" %>">
<!--                 <i class="bi bi-house-door"></i> -->
                <span>Admin</span>
            </a>
          </li>
          <li class="nav-item">
            <a href="add-admin.jsp" class="nav-link text-white <%=(request.getRequestURI().endsWith("add-admin.jsp")) ? "active" : "" %>">
<!--                 <i class="bi bi-house-door"></i> -->
                <span>Add Admin</span>
            </a>
            <hr style = "color:#fff; margin-top:10px; margin-bottom:10px;">
          </li>
          <li class="nav-item">
            <a href="add-exam.jsp" class="nav-link text-white <%=(request.getRequestURI().endsWith("add-exam.jsp")) ? "active" : "" %>">
                
                <span>Add Exam</span>
            </a>
          </li>
          <li class="nav-item">
            <a href="view-exam.jsp" class="nav-link text-white <%=(request.getRequestURI().endsWith("view-exam.jsp")) ? "active" : "" %>">
                
                <span>View Exam</span>
            </a>
          </li>
          <li class="nav-item">
            <a href="add-question.jsp" class="nav-link text-white <%=(request.getRequestURI().endsWith("add-question.jsp")) ? "active" : "" %>">
              
                <span>Add Question</span>
            </a>
          </li>
          <li class="nav-item">
            <a href="view-question.jsp" class="nav-link text-white <%=(request.getRequestURI().endsWith("view-question.jsp")) ? "active" : "" %>">
                
                <span>View Question</span>
            </a>
          </li>
          <li class="nav-item">
            <a href="add-schedule.jsp" class="nav-link text-white <%=(request.getRequestURI().endsWith("add-schedule.jsp")) ? "active" : "" %>">
                
                <span>Add Schedule</span>
            </a>
          </li>
          <li class="nav-item">
            <a href="view-schedule.jsp" class="nav-link text-white <%=(request.getRequestURI().endsWith("view-schedule.jsp")) ? "active" : "" %>">
               
                <span>View Schedule</span>
            </a>
          </li>
          <li class="nav-item">
            <a href="add-subject.jsp" class="nav-link text-white <%=(request.getRequestURI().endsWith("add-subject.jsp")) ? "active" : "" %>">
               
                <span>Add Subject</span>
            </a>
          </li>
          <li class="nav-item">
            <a href="view-subject.jsp" class="nav-link text-white <%=(request.getRequestURI().endsWith("view-subject.jsp")) ? "active" : "" %>">
                
                <span>View Subject</span>
                <hr style = "color:#fff; margin-top:18px; margin-bottom:0px;">
            </a>
          </li>
           <li class="nav-item">
            <a href="view-result.jsp" class="nav-link text-white <%=(request.getRequestURI().endsWith("view-result.jsp")) ? "active" : "" %>">
                
                <span>View Result</span>
                <hr style = "color:#fff; margin-top:18px; margin-bottom:0px; border: 1.9px solid #fff">
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-white text-center" href="adminlogout">
            
                <span>Sign Out</span>
            </a>
          </li>
        </ul>
<!--         <form role="search"> -->
<!--           <input class="form-control" type="search" placeholder="Search" aria-label="Search"> -->
<!--         </form> -->
      </div>
    </div>
</nav>

    <!-- Main Content Area -->
    <div class="flex-grow-1 ms-2">
        <!-- Your main content here -->
    </div>
</body>
</html>
