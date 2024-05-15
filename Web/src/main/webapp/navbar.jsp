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
	<nav class="p-2 navbar navbar-expand-lg navbar-light bg-dark">
	<% String currentPage = request.getServletPath(); %>
	<% if(currentPage.equals("/exam.jsp")) { %>
<%-- 	 <span class="text-white userName"><%=username%></span> --%>
     <span id="countdown"></span>
	 <% } %>
		<div class="p-4 container">
		            
		
			<!-- Centered Brand -->
			<% if (request.getAttribute("showNavbarBrand") != null) { %>
            <a href="home.jsp" class="navbar-brand text-white" style="font-size: 25px; font-weight: 300;">Exam Application System</a>
        <% } else { %>
            <span class="navbar-brand text-white" style="font-size: 25px; font-weight: 300;">Exam Application System</span>
        <% } %>
		</div>
		<!-- Right-aligned items -->
		<div class="navbar-collapse justify-content-end">
			<ul class="navbar-nav">
				
				<% if(currentPage.equals("/exam.jsp") || currentPage.equals("/attempt-exam.jsp") || currentPage.equals("/result.jsp")) { %>
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
