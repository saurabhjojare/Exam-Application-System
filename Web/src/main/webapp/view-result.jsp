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
ExamService examService = new ExamServiceImpl();
List<String[]> results = examService.getAllResults();
%>

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
<title>View Result</title>
<link rel="icon" href="../img/favicon.png" type="image/x-icon">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/login.css">

<style>
.spacer-row {
    height: 20px; /* Adjust the height of the space between rows */
}
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


.bottom-navbar {
	display: none;
}

.view-padding {
	padding-left: 110px;
	padding-right: 100px;
}

@media ( min-width : 992px) {
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
		margin-bottom: 45px;
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
		<div class="d-flex marginBottom">
			<div class="sidebar">
				<%@ include file="sidebar.jsp"%>
			</div>
			<!-- Main Content Area -->
			<div class="flex-grow-1 view-padding text-center">
				<h3 class="display-6 mt-2">Schedule Details</h3>


				<div class="d-flex justify-content-center mb-3">
					<div class="input-group" style="width: 400px;">
						<input type="text" class="form-control" id="searchInput"
							placeholder="Search Result" aria-label="Search result"
							aria-describedby="button-addon2"
							onkeyup="searchByName(this.value)">
						<!-- <button class="btn btn-outline-secondary" type="button" id="button-addon2">Search</button> -->
					</div>
				</div>


				<table class="table table-bordered" id="resultsTable">
					<thead>
					</thead>
					<tbody id="resultsBody">
						<%
						if (results.isEmpty()) {
						%>
						<tr>
							<td colspan="2" style="text-align: center;">No results
								found.</td>
						</tr>
						<%
						} else {
						%>
						<%
						for (String[] result : results) {
						%>
						<tr>
							<td class="key" style="padding: 15px">#</td>
							<td class="value" style="padding: 15px">1</td>
						</tr>

						<tr>
							<td class="key" style="padding-left: 15px">Student Name</td>
							<td class="value" style="padding-right: 15px"><%=result[0]%></td>
						</tr>

						<tr>
							<td class="key" style="padding-left: 15px">Exam Name</td>
							<td class="value" style="padding-right: 15px"><%=result[1]%></td>
						</tr>

						<tr>
							<td class="key" style="padding-left: 15px">Subject Name</td>
							<td class="value" style="padding-right: 15px"><%=result[2]%></td>
						</tr>
						<tr>
							<td class="key" style="padding-left: 15px">Exam Date</td>
							<td class="value" style="padding-right: 15px"><%=result[3]%></td>
						</tr>
						<tr>
							<td class="key" style="padding-left: 15px">Marks</td>
							<%
							double obtainedPercentage = Double.parseDouble(result[4]);
							String formattedPercentage = String.format("%.2f", obtainedPercentage);
							%>
							<td class="value" style="padding-right: 15px"><%=formattedPercentage%>
								%</td>
						</tr>
						<tr>
							<td class="key" style="padding-left: 15px">Status</td>
							<%
							double status = Double.parseDouble(result[5]);
							String statusText = (status == 1.0) ? "Pass" : "Fail";
							%>
							<td class="value" style="padding-right: 15px"><%=statusText%></td>
						</tr>
						<tr>
							<td class="key" style="padding-left: 15px">Edit</td>
							<td>
								<button class="btn btn-primary">Update</button>
								<button class="btn btn-danger">Delete</button>
							</td>
						</tr>
						<tr class="empty-row" style = "border:0px solid #fff;">
							<td colspan="2"></td>
						</tr>
						<%
						}
						%>
						<%
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
</body>
</html>
