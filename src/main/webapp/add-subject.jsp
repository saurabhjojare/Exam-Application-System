<%@ include file="existingSession.jsp" %>
<%@ include file="common-resources.jsp" %>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add Subject</title>
<link rel="stylesheet" type="text/css" href="css/addSubject.css">
<link rel="stylesheet" type="text/css" href="css/CustomColor.css">
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
					<h1 class="display-6">Add Subject</h1>
					<div class="animate__animated animate__shakeX">
					<span id="message">${message}</span>
					</div>
					<p class="lead">Please enter the details for the new subject.</p>
					<form name='form' action='addsubject' method='POST'>
						<div class="mb-3">
							<label for="subjectName" class="form-label">Subject Name</label>
							<input type="text" class="form-control" id="subjectName" name="subjectName" 
								placeholder="Enter subject name" required>
							<div class="text-start fw-light" id="SubjectWarningMsg"></div>
								
						</div>
						<div class = "marginBottom">
						<button type="submit" class="btn btn-primary">Add Subject</button>
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
		<script src="js/AddSubjectValidation.js"></script>
</body>
</html>