<%@ include file="existingSession.jsp" %>
<%@ include file="commonResources.jsp" %>


<%
													
	AdminService adminService = (AdminService) request.getServletContext().getAttribute("adminService");
	// Fetch limited access status using the service method
	boolean isLimitedAccess = adminService.isLimitedAccessByEmail(username);
%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add Subject</title>
<link rel="stylesheet" type="text/css" href="css/addSubject.css">
<link rel="stylesheet" type="text/css" href="css/customColor.css">
</head>
<body>

 <div class="d-flex">
	 <div class="sidebar">
        <%@ include file="sidebar.jsp"%>
        </div>
        <div class="flex-grow-1 d-flex" style = "height:100vh; overflow:auto">

	<main>
		<section class="py-3 text-center">
			<div class="loginWidth">
				<div class="container-sm">
				<h1 class="display-6">QuizConnect</h1>
					<h1 class="fw-light h3 mt-2">Add Subject</h1>
					<div class="animate__animated animate__shakeX">
					<span id="message">${message}</span>
					</div>
<!-- 					<p class="lead">Please enter the details for the new subject.</p> -->
					<form name='form' action='addsubject' method='POST'>
						<div class="mb-3">
							<label for="subjectName" class="form-label">Subject Name</label>
							<input type="text" class="form-control" id="subjectName" name="subjectName" 
								placeholder="Enter subject name" required>
							<div class="text-start fw-light" id="SubjectWarningMsg"></div>
								
						</div>
						<div class = "marginBottom">
						<% 
                                                    if (!isLimitedAccess) { 
                                                    %>
						<button type="submit" class="btn btn-primary">Add Subject</button>
						   <% 
                                                    } 
                                                    %>
                                                    	<% 
                                                    if (isLimitedAccess) { 
                                                    %>
						<button class="btn btn-primary" disabled>Cannot Add Subject</button>
						   <% 
                                                    } 
                                                    %>
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
		
		<script src="js/hideMessge.js"></script>
		<script src="js/addSubjectValidation.js"></script>
</body>
</html>