<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.exam.repository.ExamRepository"%>
<%@ page import="com.exam.repository.ExamRepositoryImpl"%>
<%@ page import="com.exam.service.SubjectService"%>
<%@ page import="com.exam.service.SubjectServiceImpl"%>
<%@ page import="com.exam.repository.SubjectRepository"%>
<%@ page import="com.exam.repository.SubjectRepositoryImpl"%>
<%@ page import="com.exam.service.ExamService"%>
<%@ page import="com.exam.service.ExamServiceImpl"%>
<%@ page import="com.exam.model.ExamModel"%>
<%@ page import="com.exam.model.ScheduleModel"%>

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
<title>Add Schedule</title>
<link rel="icon" href="../img/favicon.png" type="image/x-icon">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/login.css">

<style>

  .step {
        display: none;
    }
    .step.active {
        display: block;
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
margin-bottom: 110px;
}
    
}
</style>
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
							<div class="step" id="step2">
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
		
		<script>
    // Get tomorrow's date
    var tomorrow = new Date();
    tomorrow.setDate(tomorrow.getDate() + 1);

    // Format date as YYYY-MM-DD
    var dd = String(tomorrow.getDate()).padStart(2, '0');
    var mm = String(tomorrow.getMonth() + 1).padStart(2, '0'); // January is 0!
    var yyyy = tomorrow.getFullYear();

    tomorrow = yyyy + '-' + mm + '-' + dd;

    // Set the value of the input field to tomorrow's date
    document.getElementById("examDate").value = tomorrow;
</script>

<script>
    // Get current time
    var now = new Date();

    // Set minutes to 0
    now.setMinutes(0);

    // Format time as HH:00
    var hh = String(now.getHours()).padStart(2, '0');
    var mm = '00';

    var currentTime = hh + ':' + mm;

    // Set the value of the input field "startTime" to the current time with minutes set to 00
    document.getElementById("startTime").value = currentTime;
</script>


<script>
    // Get current time
    var now = new Date();

    // Add 2 hours to the current time
    now.setHours(now.getHours() + 2);
    now.setMinutes(0); // Set minutes to 0

    // Format time as HH:MM
    var hh = String(now.getHours()).padStart(2, '0');
    var mm = String(now.getMinutes()).padStart(2, '0');

    var endTime = hh + ':' + mm;

    // Set the value of the input field "endTime" to 2 hours after the current time with minutes set to 00
    document.getElementById("endTime").value = endTime;
</script>

<script>

function nextStep() {
    const currentStep = document.querySelector('.step.active');
    const nextStep = currentStep.nextElementSibling;
    if (nextStep && nextStep.classList.contains('step')) {
        currentStep.classList.remove('active');
        nextStep.classList.add('active');
    }
}

function prevStep() {
    const currentStep = document.querySelector('.step.active');
    const prevStep = currentStep.previousElementSibling;
    if (prevStep && prevStep.classList.contains('step')) {
        currentStep.classList.remove('active');
        prevStep.classList.add('active');
    }
}
</script>




</body>
</html>