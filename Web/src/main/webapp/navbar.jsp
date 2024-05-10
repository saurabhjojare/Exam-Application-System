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

#countdown {
    color: white;
    width:190px;
    
}

@media (max-width: 991px) {
.navbar-nav {
        text-align: center;
     
    }
    
    #countdown {
     width:100%;
    
    text-align: center;
    
}
}


</style>
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

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
	
	<script>
        // Set the date and time for the countdown (1 hour from now)
        var countdownDate = new Date();
        countdownDate.setHours(countdownDate.getHours() + 1);

        // Update the countdown every second
        var countdown = setInterval(function() {
            var now = new Date().getTime();
            var distance = countdownDate - now;
            
            // Calculate remaining time
            var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
            var seconds = Math.floor((distance % (1000 * 60)) / 1000);
            
            // Display the countdown
            document.getElementById("countdown").innerHTML = "Time Left: " 
            + minutes + "m " + seconds + "s ";
            
            // If the countdown is over, display a message
            if (distance < 0) {
                clearInterval(countdown);
                document.getElementById("countdown").innerHTML = "Time Out";
            }
        }, 1000);
    </script>
</body>
</html>
