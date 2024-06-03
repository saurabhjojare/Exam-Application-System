<%@ include file="commonResources.jsp"%>
<%@ include file="userSession.jsp"%>
<%@ page import="java.net.URLDecoder" %>

<%
String NoExamMessage = request.getParameter("NoExamMessage");
if (NoExamMessage != null) {
    NoExamMessage = URLDecoder.decode(NoExamMessage, "UTF-8");
}
%>

<!doctype html>

<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Select Schedule</title>
<link rel="stylesheet" type="text/css" href="css/attemptExam.css">
<link rel="stylesheet" type="text/css" href="css/nextStep.css">
<link rel="stylesheet" type="text/css" href="css/customColor.css">
</head>
<body>

	<div id="toast-container"></div>

	<%@ include file="navbar.jsp"%>

	<!-- Body -->

	<main>
		<section class="mt-4 text-center">
			<div class="container-sm">

				<%-- 				<span class="lead" style="display:none;">Hello, <strong><%=username%></strong></span> --%>
				<h2>Select Your Schedule</h2>
				 <% if (NoExamMessage != null && NoExamMessage.trim().length() > 0) { %>
    <p id = "message"><%= NoExamMessage %></p>
<% } %>

				<p class="lead">Please select your exam and schedule.</p>

				<div class="attemptExam">
					<!-- 				<form id="examForm" method="post" action="fetchallquestions"> -->



					<div class="step active" id="step1">
						<div class="mb-2">
							<label for="examSelection" class="form-label">Select Exam</label>
							<select class="form-select" id="examSelection"
								name="examSelection">
								<%
								ExamService examService = new ExamServiceImpl();
								ExamRepository examRepository = new ExamRepositoryImpl();
								List<ExamModel> q1list = examService.getAllExam();
								if (q1list != null && !q1list.isEmpty()) {
									for (ExamModel exam : q1list) {
										out.println("<option value=\"" + exam.getId() + "\">" + exam.getName() + "</option>");
									}
								} else {
									out.println("<option value=\"\">Exam not available</option>");
								}
								%>

							</select>
						</div>


						<div class="mb-2">
							<label for="scheduleSelection" class="form-label">Select
								Schedule</label> <select class="form-select" id="scheduleSelection"
								name="scheduleSelection">
								<% 
								if (q1list != null && !q1list.isEmpty()) {
								%>
								<option value="" disabled selected>Loading</option>
								<% 
								} else {
								%>
								<option value="" disabled selected>Schedule not available</option>
								<%
								} 
								%>
							</select>
						</div>

						<input type="hidden" id="scheduleId" name="scheduleId" value="">

						<div class="mb-2">
						
							<label for="subjectSelection" class="form-label">Select
								Subject</label> <select class="form-select" id="subjectSelection"
								name="subjectSelection">
								<% 
								if (q1list != null && !q1list.isEmpty()) {
								%>
								<option value="" disabled selected>Loading</option>
								<% 
								} else {
								%>
								<option value="" disabled selected>Subject not available</option>
								<%
								} 
								%>
								<!-- Subject options will be dynamically populated here -->
							</select>
						
					
						</div>
						
						<div class="mb-3">
							<label for="timeSelection" class="form-label">Select Time</label>
							<select class="form-select" id="timeSelection"
								name="timeSelection">
								<% 
								if (q1list != null && !q1list.isEmpty()) {
								%>
								<option value="" disabled selected>Loading</option>
								<% 
								} else {
								%>
								<option value="" disabled selected>Time not available</option>
								<%
								} 
								%>
							</select>
						</div>

						<button type="button" class="btn btn-secondary mt-2 mb-3"
							onclick="window.location.href='profile.jsp';" style="float: inline-start;">Back</button>
						<button type="button" class="btn btn-primary mt-2 mb-3"
							onclick="nextStep()" style="float: inline-end;">Next</button>
						
							
							
					</div>


					<div class="step" id="step2">

						


						<!-- 					</form> -->


						<p class="mb-3">Please
							ensure you have a stable internet connection and a quiet
							environment before proceeding.</p>
							
							<button type="button" class="btn btn-secondary"
							onclick="prevStep()">Back</button>
						<a href="exam.jsp" class="btn btn-primary" id="startExamButton"
							data-bs-toggle="modal" data-bs-target="#confirmationModal">Start
							Exam</a>
						
					</div>
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
	<script src="js/hideMessge.js"></script>
<!-- 	<script src="js/attemptExam.js"></script> -->
<!-- 	<script src="js/examToast.js"></script> -->
<script>
//Declare startTime and endTime variables globally
	let startTime = '', endTime = '';
	var currentTime = new Date().toLocaleTimeString('en-GB', { hour: '2-digit', minute: '2-digit', second: '2-digit' });
// 	console.log(typeof(startTime));
// 	console.log(typeof(endTime));
// 	console.log(typeof(currentTime));
	// Function to make an XMLHttpRequest
	function makeRequest(method, url, callback) {
	    var xhr = new XMLHttpRequest();
	    xhr.open(method, url, true);
	    xhr.onreadystatechange = function() {
	        if (xhr.readyState === XMLHttpRequest.DONE) {
	            callback(xhr);
	        }
	    };
	    xhr.send();
	}

	// Function to handle successful response for fetching subjects
	function handleSubjectResponse(xhr) {
	    if (xhr.status === 200) {
	        var subjects = JSON.parse(xhr.responseText);
	        var subjectDropdown = document.getElementById('subjectSelection');
	        subjectDropdown.innerHTML = '';
	        if (subjects.length > 0) {
	            subjects.forEach(function(subject) {
	                var option = new Option(subject.name, subject.id);
	                subjectDropdown.add(option);
	            });
	        } else {
	            subjectDropdown.add(new Option('Subject not available', ''));
	        }
	    } else {
	        console.error('Error fetching subjects');
	    }
	}

	function handleScheduleResponse(xhr) {
	    if (xhr.status === 200) {
	        var schedules = JSON.parse(xhr.responseText);
	        var scheduleDropdown = document.getElementById('scheduleSelection');

	        // Object to store schedule counts
	        var scheduleCounts = {};

	        scheduleDropdown.innerHTML = '';
	        if (schedules.length > 0) {
	            schedules.forEach(function(schedule) {
	                // Increment count for each schedule
	                scheduleCounts[schedule.examDate] = (scheduleCounts[schedule.examDate] || 0) + 1;

	                // Create option element
	                var optionText = schedule.examDate + (scheduleCounts[schedule.examDate] > 1 ? ' (' + scheduleCounts[schedule.examDate] + ')' : '');
	                var option = new Option(optionText, schedule.schid);

	                // Add option to dropdown
	                scheduleDropdown.add(option);
	            });
	            // Automatically fetch subjects and times for the currently selected schedule
	            var selectedScheduleId = scheduleDropdown.value;
	            console.log('Selected Schedule ID:', selectedScheduleId); // Print the selected schedule ID to console on load
	            fetchSubjects(selectedScheduleId);
	            fetchTimes(selectedScheduleId);
	        } else {
	            scheduleDropdown.add(new Option('Schedule not available', ''));
	            // If no schedules available, clear subjects dropdown
	            var subjectDropdown = document.getElementById('subjectSelection');
	            subjectDropdown.innerHTML = '';
	            subjectDropdown.add(new Option('Subject not available', ''));
	            // Clear times dropdown
	            var timeDropdown = document.getElementById('timeSelection');
	            timeDropdown.innerHTML = '';
	            timeDropdown.add(new Option('Time not available', ''));
	        }
	    } else {
	        console.error('Error fetching schedules');
	    }
	}

	

	// Function to handle successful response for fetching times
	function handleTimeResponse(xhr) {
	    if (xhr.status === 200) {
// 	    	var currentTime = new Date().toLocaleTimeString('en-GB', { hour: '2-digit', minute: '2-digit', second: '2-digit' });
// 		    console.log("Current Time:", currentTime);
	        // console.log('Response received:', xhr.responseText); // Log the response
	        var times = JSON.parse(xhr.responseText);
	        // console.log('Parsed time data:', times); // Log the parsed time data
	        
	        // Extract and log start time and end time
	        if (times.length > 0) {
	            times.forEach(function(time) {
	                startTime = time.split(' - ')[0];
	                endTime = time.split(' - ')[1];
	                console.log('Start Time:', startTime);
	                console.log('End Time:', endTime);
	            });
	        }

	        var timeDropdown = document.getElementById('timeSelection');
	        timeDropdown.innerHTML = '';
	        if (times.length > 0) {
	            times.forEach(function(time) {
	                var option = new Option(time);
	                timeDropdown.add(option);
	            });
	        } else {
	            timeDropdown.add(new Option('Time not available', ''));
	        }
	    } else {
	        console.error('Error fetching times');
	    }
	}

	// Function to fetch subjects for the selected schedule
	function fetchSubjects(scheduleId) {
	    var url = 'fetchSubjects?scheduleId=' + scheduleId;
	    makeRequest('GET', url, handleSubjectResponse);
	}

	// Function to fetch schedules for the selected exam
	function fetchSchedules(examId) {
	    var url = 'fetchSchedules?examId=' + examId;
	    makeRequest('GET', url, handleScheduleResponse);
	}

	// Function to fetch times for the selected schedule
	function fetchTimes(scheduleId) {
	    var url = 'fetchTime?scheduleId=' + scheduleId;
	    makeRequest('GET', url, handleTimeResponse);
	}

	// Fetch schedules, subjects, and times when the schedule selection changes
	document.getElementById('scheduleSelection').addEventListener('change', function() {
// 	    console.log('Schedule selection changed'); // Verify the event listener is triggered
	    var scheduleId = this.value;
// 	    console.log('Selected Schedule ID:', scheduleId); // Print the selected schedule ID to console
	    fetchSubjects(scheduleId);
	    fetchTimes(scheduleId); // Also fetch times for the selected schedule
	});

	// Fetch schedules and times for the currently selected exam on page load
	window.addEventListener('load', function() {
	    var examSelection = document.getElementById('examSelection');
	    var selectedExamId = examSelection.value;
	    fetchSchedules(selectedExamId);
	});

	// Fetch schedules, subjects, and times when the exam selection changes
	document.getElementById('examSelection').addEventListener('change', function() {
	    var examId = this.value;
	    fetchSchedules(examId);
	});

	</script>
	
	<script>

	//Flag to track if a toast is currently being displayed
	let isToastVisible = false;

	function showToast(message) {
	    // If a toast is already visible, return early
	    if (isToastVisible) return;

	    // Set the flag to indicate a toast is being displayed
	    isToastVisible = true;

	    // Create toast element
	    var toast = document.createElement('div');
	    toast.classList.add('toast');
	    toast.textContent = message;

	    // Append toast to container
	    var container = document.getElementById('toast-container');
	    container.appendChild(toast);

	    // Show toast
	    setTimeout(function () {
	        toast.classList.add('show');
	    }, 100);

	    // Hide toast after 6 seconds
	    setTimeout(function () {
	        toast.classList.remove('show');
	        // Remove toast from DOM after transition and reset the flag
	        setTimeout(function () {
	            container.removeChild(toast);
	            isToastVisible = false;
	        }, 300);
	    }, 6000);
	}
	
	function isCurrentTimeWithinRange(startTime, endTime, currentTime) {
	    // Parsing start time
	    const [startHour, startMinute, startSecond] = startTime.split(':').map(Number);

	    // Parsing end time
	    const [endHour, endMinute, endSecond] = endTime.split(':').map(Number);

	    // Parsing current time
	    const [currentHour, currentMinute, currentSecond] = currentTime.split(':').map(Number);

	    // Creating start, end, and current Date objects
	    const start = new Date();
	    start.setHours(startHour, startMinute, startSecond, 0);

	    let end = new Date();
	    end.setHours(endHour, endMinute, endSecond, 0);

	    const current = new Date();
	    current.setHours(currentHour, currentMinute, currentSecond, 0);

	    // If end time is earlier than start time, assume it's the next day
	    if (end < start) {
	        end.setDate(end.getDate() + 1);
	    }

	    // Checking if the current time is within the range
	    return (current >= start && current <= end) || (end < start && (current >= start || current <= end));
	}

	
	

	document.getElementById('confirmStartExam').addEventListener('click', function () {
	    var selectedExamId = document.getElementById('examSelection').value;
	    var selectedExamName = document.getElementById('examSelection').options[document.getElementById('examSelection').selectedIndex].text;
	    var selectedScheduleId = document.getElementById('scheduleSelection').value;
	    var selectedScheduleText = document.getElementById('scheduleSelection').options[document.getElementById('scheduleSelection').selectedIndex].text;
	    var selectedSubject = document.getElementById('subjectSelection').options[document.getElementById('subjectSelection').selectedIndex].text;
	    var selectedTime = document.getElementById('timeSelection').value;

	    const now = new Date();
	    const localDate = new Date(now.getTime() - now.getTimezoneOffset() * 60000);
	    var currentDate = localDate.toISOString().split('T')[0];

	    // Extracting date part from the selected schedule ignoring the counter
	    var selectedSchedule = selectedScheduleText.split(' ')[0];

	    console.log("Current Time From Toast:", currentTime);
	    console.log('Start Time From Toast:', startTime);
	    console.log('End Time From Toast:', endTime);

	    if (selectedSchedule === currentDate && isCurrentTimeWithinRange(startTime, endTime, currentTime)) {
	        var encodedSubject = encodeURIComponent(selectedSubject);
	        var url = 'exam.jsp?examId=' + selectedExamId + 
	          '&scheduleId=' + selectedScheduleId + 
	          '&date=' + selectedSchedule + 
	          '&subname=' + encodedSubject + 
	          '&ename=' + encodeURIComponent(selectedExamName) + 
	          '&time=' + selectedTime;
	        window.open(url, '_blank'); 
	        var modal = document.getElementById('confirmationModal');
	        var bootstrapModal = bootstrap.Modal.getInstance(modal);
	        bootstrapModal.hide();
	        window.close();
	    } else {
	        var errorMessage = '';
	        if (selectedSchedule !== currentDate) {
	            console.log("Selected Date"+selectedSchedule);
	            console.log("Current Date"+currentDate);
	            errorMessage = 'No exams are scheduled for today.';
	        } else {
	            errorMessage = 'The exam is not available at the current time';
	        }
	        showToast(errorMessage);
	    }
	});



	document.addEventListener('DOMContentLoaded', function () {
	    var params = new URLSearchParams(window.location.search);
	    var errorMessage = params.get('errorMessage');

	    if (errorMessage) {
	        // Check if the toast has already been shown
	        var toastShown = sessionStorage.getItem('toastShown');

	        if (!toastShown) {
	            // Show toast message with the error message
	            showToast(errorMessage);
	            // Set flag to indicate that the toast has been shown
	            sessionStorage.setItem('toastShown', 'true');
	        }
	    }
	});

	</script>
	
	<script>
	// Function to close the current tab
	function closeTab() {
	    window.close();
	}
	// Clear parameters from URL and reload the page
	window.history.replaceState({}, document.title, window.location.pathname);

	// Alternatively, you can clear parameters without reloading the page
	// window.history.pushState({}, document.title, window.location.pathname);
	</script>
	
	
</body>
</html>