<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Navbar</title>
<link rel="icon" href="img/favicon.png" type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/style.css">
<style>
.navbar-brand {
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
}


@media (max-width: 1200px) {
 .navbar-nav {
      
          white-space: nowrap; 
          margin-top: 0px;
          text-align: center;
    } 
  
}


@media (max-width: 700px) {
    .navbar-nav {
        text-align: center;
        width: 100%;
    }
    
        .navbar-expand-lg .navbar-collapse {
        flex-basis: none;
    }
    
      .navbar-nav .nav-item .nav-link {
        white-space: nowrap; /* Prevent text wrapping */
    }
}
}
</style>
</head>
<body>
	<nav class="p-2 navbar navbar-expand-lg navbar-light bg-dark">
	<% String currentPage = request.getServletPath(); %>
	<% if(currentPage.equals("/exam.jsp")) { %>
<%-- 	 <span class="text-white userName"><%=username%></span> --%>
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

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>
