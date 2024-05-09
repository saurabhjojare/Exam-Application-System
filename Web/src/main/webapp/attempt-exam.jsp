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

@media only screen and (max-width: 768px) {
	.attemptExam {
		width: 100%;
	}
}
</style>
</head>
<body>

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
					<div class="mb-3">
						<label for="examSelection" class="form-label">Select Exam</label>
						<select class="form-select" id="examSelection">
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
						<label for="scheduleSelection" class="form-label">Select
							Schedule</label> <select class="form-select" id="scheduleSelection">
							<%
							SubjectService subjectService = new SubjectServiceImpl();
							List<ScheduleModel> sModel = examRepository.getExamSchedule(1);
							if (sModel != null && !sModel.isEmpty()) {
								for (ScheduleModel schedule : sModel) {
									out.println("<option value=\"" + schedule.getExamDate() + "\">" + schedule.getExamDate() + "</option>");
								}
							}
							%>
						</select>
					</div>
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

	<script>
		document.getElementById('confirmStartExam').addEventListener('click',
				function() {
					window.location.href = 'exam.jsp';
				});
	</script>
</body>
</html>