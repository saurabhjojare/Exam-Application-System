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
<title>Add Schedule</title>
<link rel="stylesheet" type="text/css" href="css/addSchedule.css">
<link rel="stylesheet" type="text/css" href="css/nextStep.css">
<link rel="stylesheet" type="text/css" href="css/customColor.css">
<style>
.toast {
    left: 50%;
    transform: translateX(-50%);
}
@media (max-width: 992px) {
.toast {
    left: 50%;
    transform: translateX(-50%);
    bottom:10%;
}
}

</style>

</head>
<body>

<div class="toast align-items-center text-dark bg-light fixed-bottom m-3" role="alert" aria-live="assertive" aria-atomic="true" data-autohide="true" data-delay="3000">
  <div class="toast-body">
    End time should be later than start time.
  </div>
</div>



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
					<h1 class="display-6">QuizConnect</h1>
				
					<h1 class="fw-light h3 mt-2">Create Schedule</h1>
					<div class="animate__animated animate__shakeX">
					<span id="message">${message}</span>
					</div>
<!-- 					<p class="lead">Schedule a new schedule.</p> -->
					<form name='form' action='addschedule' method='POST' id="examScheduleForm" onsubmit="return validateForm()">
						<div class="step active" id="step1">
						<div class="mb-3">
							<label for="examDate" class="form-label">Exam Date</label> 
							<input
								type="date" class="form-control" id="examDate" name="examDate"
								value="" required>
						</div>
						<div class="mb-3">
							<label for="startTime" class="form-label">Start Time</label> <input
								type="time" class="form-control" id="startTime" name="startTime" value="08:00" required>
						</div>
						<div class="mb-3">
							<label for="endTime" class="form-label">End Time</label> <input
								type="time" class="form-control" id="endTime" name="endTime" value="10:00" required>
								            <button type="button" class="btn btn-primary mt-3" onclick="nextStep()" style = "float:left;">Next</button>
								
						</div>
						</div>
						<div class="step" id="step2">
						<div class="mb-3">
							<label for="examName" class="form-label">Select Exam Name</label>
							<select class="form-select" id="examName" name="examName" required>
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
								Subject Name</label> <select class="form-select" id="subjectName" name="subjectName" required>
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
						<% 
                                                    if (!isLimitedAccess) { 
                                                    %>
						<button type="submit" class="btn btn-primary">Create
							Schedule</button>
							   <% 
                                                    } 
                                                    %>
                         <% 
                                                    if (isLimitedAccess) { 
                                                    %>
						<button class="btn btn-primary" disabled>Cannot Create
							Schedule</button>
							   <% 
                                                    } 
                                                    %>
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
<script>
//Get today's date
var today = new Date();

// Format date as YYYY-MM-DD
var dd = String(today.getDate()).padStart(2, '0');
var mm = String(today.getMonth() + 1).padStart(2, '0'); // January is 0!
var yyyy = today.getFullYear();

var formattedDate = yyyy + '-' + mm + '-' + dd;

// Set the value of the input field to today's date
document.getElementById("examDate").value = formattedDate;

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

// Add 2 hours to the current time
var endNow = new Date();
endNow.setHours(now.getHours() + 2);
endNow.setMinutes(0); // Set minutes to 0

// Format time as HH:MM
var endHh = String(endNow.getHours()).padStart(2, '0');
var endMm = String(endNow.getMinutes()).padStart(2, '0');

var endTime = endHh + ':' + endMm;

// Set the value of the input field "endTime" to 2 hours after the current time with minutes set to 00
document.getElementById("endTime").value = endTime;



function showCustomToast(message) {
    var toastElement = document.querySelector('.toast');
    var toastBody = toastElement.querySelector('.toast-body');
    toastBody.textContent = message;
    var bsToast = new bootstrap.Toast(toastElement);
    bsToast.show();
}

function validateEndTime() {
    console.log("Validating end time...");
    var startTime = document.getElementById("startTime").value;
    var endTime = document.getElementById("endTime").value;

    // Convert start and end time strings to Date objects
    var startDate = new Date('2000-01-01T' + startTime + ':00');
    var endDate = new Date('2000-01-01T' + endTime + ':00');

    // Compare start and end time
    if (endDate <= startDate) {
        showCustomToast("End time should be later than start time.");
        // Reset end time to be at least 1 minute after start time
        endDate.setMinutes(startDate.getMinutes() + 1);
        // Update end time input value
        var endHh = String(endDate.getHours()).padStart(2, '0');
        var endMm = String(endDate.getMinutes()).padStart(2, '0');
        document.getElementById("endTime").value = endHh + ':' + endMm;
        return false; // Return false if validation fails
    }
    return true; // Return true if validation passes
}


function validateForm() {
  
    // Call the validateEndTime function to ensure end time is later than start time
    return validateEndTime(); // Return the result of validateEndTime()
}

// Add event listener to the form submission event
document.getElementById("examScheduleForm").addEventListener("submit", function(event) {
    // Prevent form submission if validation fails
    if (!validateForm()) {
        event.preventDefault();
    }
});



// Add event listener to the end time input
document.getElementById("endTime").addEventListener("change", validateEndTime);


</script>

</body>
</html>