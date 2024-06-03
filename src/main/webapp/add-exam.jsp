<%@ include file="existingSession.jsp"%>
<%@ include file="commonResources.jsp"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add Exam</title>
<link rel="stylesheet" type="text/css" href="css/addExam.css">
<link rel="stylesheet" type="text/css" href="css/customColor.css">
</head>
<body>
	<div class="d-flex">
		<div class="sidebar">
			<%@ include file="sidebar.jsp"%>
		</div>

		<!-- Main Content Area -->
		<div class="flex-grow-1 d-flex" style="height: 100vh; overflow: auto">
			<main>
				<section class="py-3 text-center">
					<div class="loginWidth">
						<div class="container-sm">
							<h1 class="display-6">New Exam</h1>
							<div class="animate__animated animate__shakeX">
								<span id="message">${message}</span>
							</div>
							<p class="lead">Enter details for the new exam.</p>
							<form name='form' action='addexam' method='POST' id="newExamForm">
								<div class="mb-3">
									<label for="examName" class="form-label">Exam Name</label> 
									<input type="text" class="form-control" id="examName" name="examName"
										placeholder="Enter exam name" required>
									<div class="text-start fw-light" id="ExamWarningMsg"></div>
								</div>
								<div class="mb-3">
									<label for="totalMarks" class="form-label">Total Marks</label>
									<input type="text" class="form-control" id="totalMarks" name="totalMarks"
										placeholder="Enter total marks" required>
									<div class="text-start fw-light" id="TotalWarningMsg"></div>
								</div>
								<div class="mb-3">
									<label for="passingMarks" class="form-label">Passing Marks</label> 
									<input type="text" class="form-control" id="passingMarks" name="passingMarks"
										placeholder="Enter passing marks" required>
									<div class="text-start fw-light" id="PassingWarningMsg"></div>
								</div>
								<div class="marginBottom">
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

	<script src="js/addExamValidation.js"></script>
</body>
</html>
