<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.exam.repository.QuestionRepository"%>
<%@ page import="com.exam.repository.QuestionRepositoryImpl"%>
<%@ page import="com.exam.service.QuestionService"%>
<%@ page import="com.exam.service.QuestionServiceImpl"%>
<%@ page import="com.exam.model.QuestionModel"%>

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
<title>View Question</title>
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
	padding-left: 100px;
	padding-right: 90px;
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
		margin-bottom: 42px;
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
			<div class="flex-grow-1 view-padding text-center">
				<h3 class="display-6 mt-2">Question Details</h3>


				<div class="d-flex justify-content-center mb-3">
					<div class="input-group" style="width: 400px;">
						<input type="text" class="form-control"
							placeholder="Search Question" aria-label="Search question"
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
							QuestionService questionService = new QuestionServiceImpl();
							QuestionRepository questionRepository = new QuestionRepositoryImpl();
							List<QuestionModel> listQuestion = questionService.getAllQuestion();
							if (listQuestion != null) {
								int count = 1;
								int totalQuestions = listQuestion.size();
								for (QuestionModel question : listQuestion) {
							%>
						
						<tr>
							<td class="key" style="padding: 15px">#</td>
							<td class="value" style="padding: 15px"><%=count++%></td>
						</tr>
						<tr>
							<td class="key" style="padding-left: 15px">Question</td>
							<td class="value" style="padding-right: 15px"><%=question.getName()%></td>
						</tr>
						<tr>
							<td class="key" style="padding-left: 15px">Option 1</td>
							<td class="value" style="padding-right: 15px"><%=question.getOp1()%></td>
						</tr>
						<tr>
							<td class="key" style="padding-left: 15px">Option 2</td>
							<td class="value" style="padding-right: 15px"><%=question.getOp2()%></td>
						</tr>
						<tr>
							<td class="key" style="padding-left: 15px">Option 3</td>
							<td class="value" style="padding-right: 15px"><%=question.getOp3()%></td>
						</tr>
						<tr>
							<td class="key" style="padding-left: 15px">Option 4</td>
							<td class="value" style="padding-right: 15px"><%=question.getOp4()%></td>
						</tr>
						<tr>
							<td class="key" style="padding-left: 15px">Answer</td>
							<td class="value" style="padding-right: 15px"><%=question.getAnswer()%></td>
						</tr>
						<tr>
							<td class="key" style="padding-left: 15px">Edit</td>
							<td>
								<button class="btn btn-primary">Update</button>
								<button class="btn btn-danger">Delete</button>
							</td>
						</tr>
						<%
						if (count <= totalQuestions) { // Check if it's not the last iteration
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
