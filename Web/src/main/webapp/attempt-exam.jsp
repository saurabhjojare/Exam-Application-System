<%@ include file="common-resources.jsp" %>
<%@ include file="userSession.jsp" %>

<!doctype html>

<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Attempt Exam</title>
<link rel="stylesheet" type="text/css" href="css/attemptExam.css">
<link rel="stylesheet" type="text/css" href="css/nextStep.css">
</head>
<body>
<div id="toast-container"></div>

	<%@ include file="navbar.jsp"%>

	<!-- Body -->

	<main>
		<section class="py-5 text-center">
			<div class="container-sm">
		
<%-- 				<span class="lead" style="display:none;">Hello, <strong><%=username%></strong></span> --%>
				<h1>Attempt Exam</h1>
				<p class="lead">Please select the exam and schedule before
					starting.</p>

				<div class="attemptExam">
<!-- 				<form id="examForm" method="post" action="fetchallquestions"> -->
				
				

				<div class="step active" id="step1">
					<div class="mb-3">
						<label for="examSelection" class="form-label">Select Exam</label>
						<select class="form-select" id="examSelection" name="examSelection">
							<%
							ExamService examService = new ExamServiceImpl();
							ExamRepository examRepository = new ExamRepositoryImpl();
							List<ExamModel> q1list = examService.getAllExam();
							if (q1list != null && !q1list.isEmpty()) {
								for (ExamModel exam : q1list) {
									out.println("<option value=\"" + exam.getId() + "\">" + exam.getName() + "</option>");
								}
							} else {
								out.println("<option value=\"\">No subjects found</option>");
							}
							%>

						</select>
					</div>
					
					
					<div class="mb-3">
						<label for="scheduleSelection" class="form-label">Select
							Schedule</label> <select class="form-select" id="scheduleSelection" name="scheduleSelection">
					   <option value="" disabled selected>Loading</option>
							
						</select>
					</div>
					
					<input type="hidden" id="scheduleId" name="scheduleId" value="">
					
					<div class="mb-0">
						<label for="subjectSelection" class="form-label">Select
							Subject</label> <select class="form-select" id="subjectSelection" name="subjectSelection">
					    <option value="" disabled selected>Loading</option>
							
							<!-- Subject options will be dynamically populated here -->
						</select>
					</div>
					
					
					<button type="button" class="btn btn-primary mt-2 mb-3" onclick="nextStep()" style="float: inline-start;">Next</button>
					</div>
					
					
					<div class="step" id="step2">
					
					<div class="mb-3">
						<label for="timeSelection" class="form-label">Select
							Time</label> <select class="form-select" id="timeSelection" name="timeSelection">
							        <option value="" disabled selected>Loading</option>	
						</select>
					</div>
					
					
<!-- 					</form> -->

				
				<p style="width: 450px; margin: 0px auto;" class="mb-3">Please
					ensure you have a stable internet connection and a quiet
					environment before proceeding.</p>
				<a href="exam.jsp" class="btn btn-primary" id="startExamButton"
					data-bs-toggle="modal" data-bs-target="#confirmationModal">Start
					Exam</a>
					<button type="button" class="btn btn-secondary"
											onclick="prevStep()">Back</button>
			</div>
			</div>
			
	
			
			
			<div class="modal fade" id="confirmationModal" tabindex="-1"
				aria-labelledby="confirmationModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="confirmationModalLabel">Confirm
								Exam Attempt</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<p>Are you sure you want to start the selected exam?</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary"
								id="confirmStartExam">Start Exam</button>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>

	<%@ include file="footer.jsp"%>
	
	<script src="js/nextButton.js"></script>
	<script src="js/attemptExam.js"></script>
	<script src="js/examToast.js"></script>
</body>
</html>