<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<%
    HttpSession existingSession = request.getSession(false);
    if (existingSession == null || existingSession.getAttribute("adminUsername") == null) {
        response.sendRedirect("admin-login.jsp");
    }
    String username = (String) existingSession.getAttribute("adminUsername");
%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add Exam</title>
<link rel="icon" href="../img/favicon.png" type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/login.css">

<style>
        .body-content {
            margin-left: 280px;
            padding: 20px;
        }
        
        
.bottom-navbar{
display: none;
}

/* Hide sidebar on screens smaller than lg */
@media (max-width: 992px) {
    .sidebar {
        display: none;
    }
    .bottom-navbar{
display: block;
}

.marginBottom{
margin-bottom: 52px;
}
    
}
    </style>

</head>
<body>
	 <div class="d-flex">
	<div class="sidebar">
	<%@ include file="sidebar.jsp"%>
	</div>
	
	       <!-- Main Content Area -->
        <div class="flex-grow-1  d-flex" style = "height:100vh; overflow:auto">
           <main>
		<section class="py-3 text-center">
			<div class="loginWidth">
				<div class="container-sm">
					<h1 class="display-6">New Exam</h1>
					<span id="message">${message}</span>
					<p class="lead">Enter details for the new exam.</p>
					<form name='form' action='addexam' method='POST' id="newExamForm">
						<div class="mb-3">
							<label for="examName" class="form-label">Exam Name</label> <input
								type="text" class="form-control" id="examName" name="examName"
								placeholder="Enter exam name">
						</div>
						<div class="mb-3">
							<label for="totalMarks" class="form-label">Total Marks</label> <input
								type="number" class="form-control" id="totalMarks" name="totalMarks"
								placeholder="Enter total marks">
						</div>
						<div class="mb-3">
							<label for="passingMarks" class="form-label">Passing
								Marks</label> <input type="number" class="form-control"
								id="passingMarks" name="passingMarks" placeholder="Enter passing marks">
						</div>
						<div class = "marginBottom">
						<button type="submit" class="btn btn-primary">Create Exam</button>
						</div>
					</form>
				</div>
			</div>
		</section>
	</main>
        </div>
    </div>
    <div class="bottom-navbar">
	<%@ include file="navbar-bottom.jsp"%>
	</div>
	
	<!-- Body
	<main>
		<section class="py-5 text-center">
			<div class="loginWidth">
				<div class="container-sm">
					<h1 class="display-4">New Exam</h1>
					<p class="lead">Enter details for the new exam.</p>
					<form id="newExamForm">
						<div class="mb-3">
							<label for="examName" class="form-label">Exam Name</label> <input
								type="text" class="form-control" id="examName"
								placeholder="Enter exam name">
						</div>
						<div class="mb-3">
							<label for="totalMarks" class="form-label">Total Marks</label> <input
								type="number" class="form-control" id="totalMarks"
								placeholder="Enter total marks">
						</div>
						<div class="mb-3">
							<label for="passingMarks" class="form-label">Passing
								Marks</label> <input type="number" class="form-control"
								id="passingMarks" placeholder="Enter passing marks">
						</div>
						<button type="submit" class="btn btn-primary">Create Exam</button>
					</form>
				</div>
			</div>
		</section>
	</main>
	-->
		
		
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
		
		<script>
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