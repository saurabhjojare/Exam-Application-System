<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle text-white" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Admin Management
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="profile-page.jsp">Admin Profile</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="add-admin.jsp">Add Admins</a></li>
            <li><a class="dropdown-item" href="view-admin.jsp">View Admins</a></li>
          </ul>
        </li>
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle text-white" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Exam Management
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="add-exam.jsp">Add Exams</a></li>
            <li><a class="dropdown-item" href="view-exam.jsp">View Exams</a></li>
          </ul>
        </li>
        
        
         <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle text-white" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Question Management
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="add-question.jsp">Add Questions</a></li>
            <li><a class="dropdown-item" href="view-question.jsp">View Questions</a></li>
          </ul>
        </li>
        
        
         <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle text-white" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Schedule Management
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="add-schedule.jsp">Add Schedules</a></li>
            <li><a class="dropdown-item" href="view-schedule.jsp">View Schedules</a></li>
          </ul>
        </li>
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle text-white" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Subject Management
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="add-subject.jsp">Add Subjects</a></li>
            <li><a class="dropdown-item" href="view-subject.jsp">View Subjects</a></li>
          </ul>
        </li>
        
        
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle text-white" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Student Management
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="view-result.jsp">View Result</a></li>
            <li><a class="dropdown-item" href="view-student.jsp">View Students</a></li>
          </ul>
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

  
    <div class="flex-grow-1 ms-2">
       
    </div>
</body>
</html>
