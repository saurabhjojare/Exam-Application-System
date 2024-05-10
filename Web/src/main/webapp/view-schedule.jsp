<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.exam.repository.SubjectRepository"%>
<%@ page import="com.exam.repository.SubjectRepositoryImpl"%>
<%@ page import="com.exam.service.SubjectService"%>
<%@ page import="com.exam.service.SubjectServiceImpl"%>
<%@ page import="com.exam.model.ScheduleModel"%>
<%@ page import="com.exam.repository.ExamRepositoryImpl"%>
<%@ page import="com.exam.repository.ExamRepository"%>
<%@ page import="com.exam.service.ExamService"%>
<%@ page import="com.exam.service.ExamServiceImpl"%>

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
<title>View Schedule</title>
<link rel="icon" href="../img/favicon.png" type="image/x-icon">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/login.css">

<style>
/* Custom CSS for the body content */
.body-content {
	margin-left: 280px; /* Same width as the sidebar */
	padding: 20px; /* Adjust padding as needed */
	overflow-x: hidden; /* Prevent horizontal scrolling */
}

tbody tr {
	word-wrap: break-word; /* Allow long words to break and wrap */
}

/* Additional styling for the table */
th, td {
	text-align: center; /* Center align content */
	vertical-align: middle; /* Center align vertically */
}

.table th, .table td {
	padding: .75rem; /* Adjust padding as needed */
}

/* Align key-value pairs */
td.key {
	text-align: left;
	font-weight: bold;
}

/* Align data to the right */
td.value {
	text-align: right;
}

.empty-row td {
	border: none; /* Hide border for empty rows */
}

.bottom-navbar {
	display: none;
}

.view-padding {
	padding-left: 110px;
	padding-right: 100px;
}

 @media (min-width: 992px) { 
    .view-padding {
    height: 100vh; 
    overflow: auto;
    }
    }

/* Hide sidebar on screens smaller than lg */
@media ( max-width : 992px) {
	.sidebar {
		display: none;
	}
	.bottom-navbar {
		display: block;
	}
	.marginBottom {
		margin-bottom: 40px;
	}
}

@media ( max-width : 768px) {
	.view-padding {
		padding-left: 10px;
		padding-right: 10px;
	}
}
</style>

</head>
<body>

	<div class="marginBottom">
		<div class="d-flex">
			<div class="sidebar">
				<%@ include file="sidebar.jsp"%>
			</div>
			<!-- Main Content Area -->
			<div class="flex-grow-1 view-padding text-center"
				>
				<h3 class="display-6 mt-2">Schedule Details</h3>

				<div class="d-flex justify-content-center mb-3">
					<div class="input-group" style="width: 400px;">
						<input type="text" class="form-control"
							placeholder="Search Schedule" aria-label="Search schedule"
							aria-describedby="button-addon2">
						<!--         <button class="btn btn-outline-secondary" type="button" id="button-addon2">Search</button> -->
					</div>
				</div>

				<table class="table table-bordered">
					<thead>

					</thead>
					<tbody>
						<tr>
							<%
							// Assuming examList contains a list of ExamModel objects
							SubjectService subjectService = new SubjectServiceImpl();
							SubjectRepository subjectRepository = new SubjectRepositoryImpl();
							List<ScheduleModel> listSchedule = subjectService.getAllSchedule();
							if (listSchedule != null) {
								int count = 1;
								int totalSubject = listSchedule.size();
								for (ScheduleModel schedule : listSchedule) {
							%>
							<td class="key" style="padding: 15px">#</td>
							<td class="value" style="padding: 15px"><%=count++%></td>
						</tr>

						<tr>
							<td class="key" style="padding-left: 15px">Subject Name</td>
							<td class="value" style="padding-right: 15px">
								<%
								String subjectName = subjectRepository.getSubjectNameBySchid(schedule.getSchid());
								if (subjectName != null) {
									out.print(subjectName);
								} else {
									out.print("Subject not found"); // or handle the case when subject is not found
								}
								%>
							</td>
						</tr>
<!-- 						<tr> -->
<!-- 							<td class="key" style="padding-left: 15px">Schedule ID</td> -->
<%-- 							<td class="value" style="padding-right: 15px"><%=schedule.getSchid()%></td> --%>
<!-- 						</tr> -->
						<tr>
							<td class="key" style="padding-left: 15px">Exam</td>
							<td class="value" style="padding-right: 15px">
								<%
								ExamService ExamService = new ExamServiceImpl();
								ExamRepository examRepository = new ExamRepositoryImpl();
								String examName = examRepository.getExamNameByExamId(schedule.getExamid());
								if (examName != null) {
									out.print(examName);
								} else {
									out.print("Exam not found"); // or handle the case when the exam is not found
								}
								%>
							</td>
						</tr>
						<tr>
							<td class="key" style="padding-left: 15px">Date</td>
							<td class="value" style="padding-right: 15px"><%=schedule.getExamDate()%></td>
						</tr>
						<tr>
							<td class="key" style="padding-left: 15px">Start Time</td>
							<td class="value" style="padding-right: 15px"><%=schedule.getStartTime()%></td>
						</tr>
						<tr>
							<td class="key" style="padding-left: 15px">End Time</td>
							<td class="value" style="padding-right: 15px"><%=schedule.getEndTime()%></td>
						</tr>



						<tr>
							<td class="key" style="padding-left: 15px">Edit</td>
							<td>
								<button class="btn btn-primary">Update</button>
								<button class="btn btn-danger">Delete</button>
							</td>
						</tr>
						<%
						if (count <= totalSubject) { // Check if it's not the last iteration
						%>
						<tr class="empty-row">
							<td colspan="2">&nbsp;</td>
							<!-- Add empty cells for space between each set of exam details -->
						</tr>
						<%
						} // End of if
						} // End of loop 
						} else {
						// Handle case where QuestionList is null
						out.println("<tr><td colspan='2'>No questions found.</td></tr>");
						}
						%>
					</tbody>
				</table>
			</div>
			<div></div>
		</div>
	</div>
	<div class="bottom-navbar">
		<%@ include file="navbar-bottom.jsp"%>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
		integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
		crossorigin="anonymous"></script>
</body>
</html>
