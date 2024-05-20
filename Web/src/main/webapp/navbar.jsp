<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Navbar</title>
<link rel="stylesheet" type="text/css" href="css/Navbar.css">
</head>
<body>
	<nav class="p-2 navbar navbar-expand-lg navColor">
	<% String currentPage = request.getServletPath(); %>
	<% if(currentPage.equals("/exam.jsp")) { %>
<%-- 	 <span class="text-white userName"><%=username%></span> --%>
<!--      <span id="countdown"></span> -->
	 <% } %>
	 <% if(currentPage.equals("/profile.jsp")  || currentPage.equals("/select-subject.jsp") || currentPage.equals("/attempt-exam.jsp") || currentPage.equals("/exam-complete.jsp") || currentPage.equals("/result.jsp")  || currentPage.equals("/examSubmitFailed.jsp")) { %>
	 <div class = "profileName">
     <span class ="text-white"><a href="profile.jsp" class="text-decoration-none text-white">Home</a></span>
     </div>
	 <% } %>
		<div class="p-4 container ">
			<!-- Centered Brand -->
			<% if (request.getAttribute("showNavbarBrand") != null) { %>
            <a href="home.jsp" class="navbar-brand text-white" style="font-size: 25px; font-weight: 300;">QuizConnect</a>
        <% } else { %>
            <span class="navbar-brand text-white" style="font-size: 25px; font-weight: 300;">QuizConnect</span>
        <% } %>
		</div>
		<!-- Right-aligned items -->
		<div class="navbar-collapse justify-content-end">
			<ul class="navbar-nav">
				<% if(currentPage.equals("/profile.jsp") || currentPage.equals("/add-subject.jsp") || currentPage.equals("/student-result.jsp")) { %>
					<li class="nav-item">
						<a class="nav-link text-white" href="attempt-exam.jsp" style = "white-space: nowrap;">Exams</a>
					</li>
				<% } %>
				
				<% if(currentPage.equals("/exam.jsp") || currentPage.equals("/attempt-exam.jsp") || currentPage.equals("/result.jsp") || currentPage.equals("/select-subject.jsp") || currentPage.equals("/examSubmitFailed.jsp")) { %>
					<li class="nav-item">
						<a class="nav-link text-white" href="logout" style = "white-space: nowrap;">Sign Out</a>
						
					</li>
				<% } %>
				
			</ul>
		</div>
	</nav>
    
    <script src="js/Timer.js"></script>
</body>
</html>
