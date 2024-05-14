<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.exam.repository.ExamRepository"%>
<%@ page import="com.exam.repository.ExamRepositoryImpl"%>
<%@ page import="com.exam.service.SubjectService"%>
<%@ page import="com.exam.service.SubjectServiceImpl"%>
<%@ page import="com.exam.service.ExamService"%>
<%@ page import="com.exam.service.ExamServiceImpl"%>
<%@ page import="com.exam.model.ExamModel"%>
<%@ page import="com.exam.model.ScheduleModel"%>
<%@ page import="com.exam.model.SubjectModel"%>
<%@ page import="com.exam.repository.SubjectRepositoryImpl"%>
<%@ page import="com.exam.repository.SubjectRepository"%>

<%
HttpSession existingSession = request.getSession(false);
if (existingSession == null || existingSession.getAttribute("username") == null) {
	response.sendRedirect("login.jsp");
	// Optional: You can use <jsp:forward> here if you want to ensure that the rest of the JSP page isn't processed.
	// <jsp:forward page="login.jsp" />
}
String username = (String) existingSession.getAttribute("username");
%>

<!doctype html>

<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Attempt Exam</title>
<link rel="icon" href="../img/favicon.png" type="image/x-icon">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/login.css">
<link rel="stylesheet" type="text/css" href="css/exam.css">

<style>
.attemptExam {
	width: 500px;
	margin: 0px auto;
}

#toast-container {
    position: fixed;
    bottom: 20px;
    left: 50%;
    transform: translateX(-50%);
    z-index: 9999;
}

.toast {
    background-color: #333;
    color: #fff;
    padding: 10px 20px;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
    opacity: 0;
    transition: opacity 0.3s ease-in-out;
}

.toast.show {
    opacity: 1;
}



@media only screen and (max-width: 768px) {
	.attemptExam {
		width: 100%;
	}
}
</style>
</head>
<body>
<div id="toast-container"></div>

	<%@ include file="navbar.jsp"%>

	<!-- Body -->

	<main>
		<section class="py-5 text-center">
			<div class="container-sm">
		
				<span class="lead">Hello, <strong><%=username%></strong></span>
				<h1>Attempt Exam</h1>
				<p class="lead">Please select the exam and schedule before
					starting.</p>

				<div class="attemptExam">
<!-- 				<form id="examForm" method="post" action="fetchallquestions"> -->
				
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
						</select>
					</div>
					
					<div class="mb-3">
						<label for="timeSelection" class="form-label">Select
							Time</label> <select class="form-select" id="timeSelection" name="timeSelection">
						</select>
					</div>

					<div class="mb-3">
						<label for="subjectSelection" class="form-label">Select
							Subject</label> <select class="form-select" id="subjectSelection" name="subjectSelection">
							<!-- Subject options will be dynamically populated here -->
						</select>
					</div>
<!-- 					</form> -->

				</div>
				<p style="width: 450px; margin: 0px auto;" class="mb-3">Please
					ensure you have a stable internet connection and a quiet
					environment before proceeding.</p>
				<a href="exam.jsp" class="btn btn-primary" id="startExamButton"
					data-bs-toggle="modal" data-bs-target="#confirmationModal">Start
					Exam</a>
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


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>

	<script>
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
                subjectDropdown.add(new Option('No subjects available', ''));
            }
        } else {
            console.error('Error fetching subjects');
        }
    }

    // Function to handle successful response for fetching schedules
    function handleScheduleResponse(xhr) {
        if (xhr.status === 200) {
            var schedules = JSON.parse(xhr.responseText);
            var scheduleDropdown = document.getElementById('scheduleSelection');
            scheduleDropdown.innerHTML = '';
            if (schedules.length > 0) {
                schedules.forEach(function(schedule) {
                    var option = new Option(schedule.examDate, schedule.schid);
                    scheduleDropdown.add(option);
                });
                // Automatically fetch subjects for the currently selected schedule
                var selectedScheduleId = scheduleDropdown.value;
                fetchSubjects(selectedScheduleId);
                // Fetch times for the currently selected schedule
                fetchTimes(selectedScheduleId);
            } else {
                scheduleDropdown.add(new Option('No schedules available', ''));
                // If no schedules available, clear subjects dropdown
                var subjectDropdown = document.getElementById('subjectSelection');
                subjectDropdown.innerHTML = '';
                subjectDropdown.add(new Option('No subjects available', ''));
                // Clear times dropdown
                var timeDropdown = document.getElementById('timeSelection');
                timeDropdown.innerHTML = '';
                timeDropdown.add(new Option('No time available', ''));
            }
        } else {
            console.error('Error fetching schedules');
        }
    }

    // Function to handle successful response for fetching times
    function handleTimeResponse(xhr) {
        if (xhr.status === 200) {
            console.log('Response received:', xhr.responseText); // Log the response
            var times = JSON.parse(xhr.responseText);
            console.log('Parsed time data:', times); // Log the parsed time data
            var timeDropdown = document.getElementById('timeSelection');
            timeDropdown.innerHTML = '';
            if (times.length > 0) {
                times.forEach(function(time) {
                    var option = new Option(time);
                    timeDropdown.add(option);
                });
            } else {
                timeDropdown.add(new Option('No time available', ''));
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

    // Fetch times when the schedule selection changes
    document.getElementById('scheduleSelection').addEventListener('change', function() {
        var scheduleId = this.value;
        fetchTimes(scheduleId);
    });

    // Fetch schedules and times for the currently selected exam on page load
    window.addEventListener('load', function() {
        var examSelection = document.getElementById('examSelection');
        var selectedExamId = examSelection.value;
        fetchSchedules(selectedExamId);
    });
    
 // Fetch subjects and times when the schedule selection changes
    document.getElementById('scheduleSelection').addEventListener('change', function() {
        var scheduleId = this.value;
        fetchSubjects(scheduleId);
        fetchTimes(scheduleId); // Also fetch times for the selected schedule
    });


    // Fetch schedules, subjects, and times when the exam selection changes
    document.getElementById('examSelection').addEventListener('change', function() {
        var examId = this.value;
        fetchSchedules(examId);
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/toastify-js"></script>



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

document.getElementById('confirmStartExam').addEventListener('click', function () {
    var selectedExamId = document.getElementById('examSelection').value;
    var selectedExamName = document.getElementById('examSelection').options[document.getElementById('examSelection').selectedIndex].text;
    var selectedSchedule = document.getElementById('scheduleSelection').options[document.getElementById('scheduleSelection').selectedIndex].text;
    var selectedSubject = document.getElementById('subjectSelection').options[document.getElementById('subjectSelection').selectedIndex].text;
    var selectedTime = document.getElementById('timeSelection').value;

    // Get the current date in yyyy-mm-dd format
    var currentDate = new Date().toISOString().split('T')[0];

    // Parse the selected date to yyyy-mm-dd format
    var selectedDateParts = selectedSchedule.split('-');
    var selectedDate = selectedDateParts[0] + '-' + selectedDateParts[1].padStart(2, '0') + '-' + selectedDateParts[2].padStart(2, '0');

    // Check if the selected date is before the current date or if the date is invalid
    if (selectedDate < currentDate) {
        // Log current date and selected date for debugging
        console.log("Current Date:", currentDate);
        console.log("Selected Date:", selectedDate);
        var errorMessage = 'This exam schedule has already passed or the selected date is invalid';

        // Show toast message
        showToast(errorMessage);
    } else {
        // Encode subject name
        var encodedSubject = encodeURIComponent(selectedSubject);
        // Redirect to the exam page with necessary parameters
        window.location.href = 'exam.jsp?examId=' + selectedExamId + '&date=' + selectedSchedule + '&subname=' + encodedSubject + '&ename=' + encodeURIComponent(selectedExamName) + '&time=' + selectedTime;
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
// 		document.getElementById('confirmStartExam').addEventListener('click',
// 				function() {
// 					window.location.href = 'exam.jsp';
// 				});
	</script>
</body>
</html>