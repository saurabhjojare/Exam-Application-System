<%@ include file="existingSession.jsp" %>
<%@ include file="common-resources.jsp" %>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add Schedule</title>
<link rel="stylesheet" type="text/css" href="css/addSchedule.css">
<link rel="stylesheet" type="text/css" href="css/nextStep.css">

</head>
<body>

	<div class="d-flex">
	    <div class="sidebar">
        <%@ include file="sidebar.jsp"%>
        </div>
	<div class="flex-grow-1 d-flex" style = "height:100vh; overflow:auto">
	<!-- Body -->
	<main>
		<section class="py-3 text-center">
			<div class="loginWidth marginBottom">
				<div class="container-sm">
					<h1 class="display-6">Create Exam Schedule</h1>
					<span id="message">${message}</span>
					<p class="lead">Schedule a new exam.</p>
					<form name='form' action='addschedule' method='POST' id="examScheduleForm">
						<div class="step active" id="step1">
						<div class="mb-3">
							<label for="examDate" class="form-label">Exam Date</label> 
							<input
								type="date" class="form-control" id="examDate" name="examDate"
								value="">
						</div>
						<div class="mb-3">
							<label for="startTime" class="form-label">Start Time</label> <input
								type="time" class="form-control" id="startTime" name="startTime" value="08:00">
						</div>
						<div class="mb-3">
							<label for="endTime" class="form-label">End Time</label> <input
								type="time" class="form-control" id="endTime" name="endTime" value="10:00">
								            <button type="button" class="btn btn-primary mt-3" onclick="nextStep()" style = "float:left;">Next</button>
								
						</div>
						</div>
						<div class="step" id="step2">
						<div class="mb-3">
							<label for="examName" class="form-label">Select Exam Name</label>
							<select class="form-select" id="examName" name="examName">
								<%
							ExamService examService = new ExamServiceImpl();
							ExamRepository examRepository = new ExamRepositoryImpl();
							List<ExamModel> q1list = examService.getAllExam();
							if (q1list != null && !q1list.isEmpty()) {
								for (ExamModel exam : q1list) {
									out.println("<option value=\"" + exam.getName() + "\">" + exam.getName() + "</option>");
								}
							} else {
								out.println("<option value=\"\">No subjects found</option>");
							}
							%>
							</select>
						</div>
						<div class="mb-3">
							<label for="subjectName" class="form-label">Select
								Subject Name</label> <select class="form-select" id="subjectName" name="subjectName">
									<%
							SubjectService subService = new SubjectServiceImpl();
							SubjectRepository subRepository = new SubjectRepositoryImpl();
							List<String> subjects = subService.getAllSubjects();
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
						<div class = "marginBottom">
						          <button type="button" class="btn btn-secondary" onclick="prevStep()">Back</button>
						
						<button type="submit" class="btn btn-primary">Create
							Schedule</button>
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
<script src="js/addSchedule.js"></script>

</body>
</html>