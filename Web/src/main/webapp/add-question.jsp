<%@ include file="existingSession.jsp"%>
<%@ include file="common-resources.jsp"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add Question</title>
<link rel="stylesheet" type="text/css" href="css/addQuestion.css">
<link rel="stylesheet" type="text/css" href="css/nextStep.css">
</head>
<body>
	<div class="d-flex">
		<div class="sidebar">
			<%@ include file="sidebar.jsp"%>
		</div>
		<div class="flex-grow-1 d-flex" style="height: 100vh; overflow: auto">

			<!-- Body -->
			<main>
				<section class="py-3 text-center">

					<div class="loginWidth">

						<div class="container-sm">
							<h1 class="display-6">Add Question</h1>
							<span id="message">${message}</span>
							<p class="lead">Please enter the details for the new
								question.</p>
							<form name='form' action='addquestion' method='POST'>

								<div class="step active" id="step1">
									<div class="mb-3">
										<label for="questionName" class="form-label">Question
											Name</label> <input type="text" class="form-control"
											id="questionName" name="questionName"
											placeholder="Enter question text">
									</div>
									<div class="mb-3">
										<label for="option1" class="form-label">Option 1</label> <input
											type="text" class="form-control" id="option1" name="option1"
											placeholder="Enter option 1 text">
									</div>
									<div class="mb-3">
										<label for="option2" class="form-label">Option 2</label> <input
											type="text" class="form-control" id="option2" name="option2"
											placeholder="Enter option 2 text">
									</div>
									<div class="mb-3">
										<label for="option3" class="form-label">Option 3</label> <input
											type="text" class="form-control" id="option3" name="option3"
											placeholder="Enter option 3 text">
									</div>
									<div class="mb-0">
										<label for="option4" class="form-label">Option 4</label> <input
											type="text" class="form-control" id="option4" name="option4"
											placeholder="Enter option 4 text">
									</div>
									<div class="marginBottom">
										<button type="button" class="btn btn-primary mt-3"
											onclick="nextStep()" style="float: inline-start;">Next</button>
									</div>

								</div>

								<div class="step" id="step2">
									<div class="mb-3">
										<label for="answer" class="form-label">Enter Option As
											Answer</label> <select id="answer" class="form-control" name="answer">
											<option value="1">Option 1</option>
											<option value="2">Option 2</option>
											<option value="3">Option 3</option>
											<option value="4">Option 4</option>
										</select>
									</div>
									<div class="mb-3">
										<label for="subjectName" class="form-label">Subject
											Name</label> <select id="subjectName" class="form-control"
											name="subjectName">
											<option value="">Select Subject</option>
											<%
											SubjectService sv = new SubjectServiceImpl();
											List<String> subjects = sv.getAllSubjects();
											if (subjects != null && !subjects.isEmpty()) {
												for (String subject : subjects) {
													out.println("<option value=\"" + subject + "\">" + subject + "</option>");
												}
											} else {
												out.println("<option value=\"\">No subjects found</option>");
											}
											%>
										</select>
									</div>
									<div class="marginBottom">
										<button id="submitButton" type="submit"
											class="btn btn-primary">Add Question</button>
										<!-- Button for importing bulk questions -->
										<input type="file" id="fileInput" accept=".csv"
											style="display: none;">
										<button type="button" class="btn btn-secondary"
											id="importQuestionsBtn">Import Questions</button>
										<button type="button" class="btn btn-secondary"
											onclick="prevStep()">Back</button>

									</div>
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

	<script src="js/nextButton.js"></script>
	<script src="js/hideMessge.js"></script>
	<script src="js/addQuestions.js"></script>

</body>
</html>