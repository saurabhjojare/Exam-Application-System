<%@ include file="existingSession.jsp"%>
<%@ include file="common-resources.jsp"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add Exam</title>
<link rel="stylesheet" type="text/css" href="css/addExam.css">
</head>
<body>
	<div class="d-flex">
		<div class="sidebar">
			<%@ include file="sidebar.jsp"%>
		</div>

		<!-- Main Content Area -->
		<div class="flex-grow-1  d-flex" style="height: 100vh; overflow: auto">
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
									<label for="totalMarks" class="form-label">Total Marks</label>
									<input type="number" class="form-control" id="totalMarks"
										name="totalMarks" placeholder="Enter total marks">
								</div>
								<div class="mb-3">
									<label for="passingMarks" class="form-label">Passing
										Marks</label> <input type="number" class="form-control"
										id="passingMarks" name="passingMarks"
										placeholder="Enter passing marks">
								</div>
								<div class="marginBottom">
									<button type="submit" class="btn btn-primary">Create
										Exam</button>
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
</body>
</html>