<%@ include file="existingSession.jsp"%>
<%@ include file="common-resources.jsp"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Import Question</title>
<link rel="stylesheet" type="text/css" href="css/addQuestion.css">
<link rel="stylesheet" type="text/css" href="css/CustomColor.css">
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
							<h1 class="display-6">Import Questions</h1>
							<span id="message">${message}</span>
							<p class="lead">Please select subject and file to import</p>
							<form name='form' id="importForm" action='importQuestion'
								method='POST' enctype='multipart/form-data'>
								<div>
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
								<div class="mt-3">
									<!-- Hidden input field to store selected subject -->
									<input type="hidden" id="selectedSubject" name="subject">
									<input type="file" id="fileInput" name="fileInput"
										accept=".csv" style="display: none;">
									<button type="button" class="btn btn-secondary"
										id="importQuestionsBtn">Import Questions</button>
									<button type="submit" class="btn btn-primary">Submit</button>
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

	<script>
	document.getElementById('importQuestionsBtn').addEventListener('click', function() {
	    document.getElementById('fileInput').click();
	});

	// Function to update hidden input field with selected subject
	document.querySelector('#subjectName').addEventListener('change', function() {
	    var selectedSubject = this.value;
	    console.log("Selected Subject:", selectedSubject);
	    document.getElementById('selectedSubject').value = selectedSubject;
	});


	</script>
</body>
</html>
