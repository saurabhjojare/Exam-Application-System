<%@ include file="common-resources.jsp"%>
<%@ include file="userSession.jsp"%>

<%@ page import="java.util.List"%>
<%@ page import="com.exam.model.StudentModel"%>
<%@ page import="com.exam.service.StudentService"%>
<%@ page import="com.exam.service.StudentServiceImpl"%>

<%
StudentService studService = new StudentServiceImpl();
List<StudentModel> listStudent = studService.getStudentByUsername(username);
StudentModel student = null;
if (listStudent != null && !listStudent.isEmpty()) {
	student = listStudent.get(0);
}
%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Profile</title>
<link rel="stylesheet" type="text/css" href="css/Profile.css">
<link rel="stylesheet" type="text/css" href="css/CustomColor.css">
</head>
<body>
	<%@ include file="navbar.jsp"%>

	<!-- Body -->
	<main class="d-flex align-items-center text-center mt-3 mb-3">
		<div class="container jumbWidth">
			<section class="text-center">
				<div class="container">
					<div
						class="position-relative p-4 text-center text-muted bg-body border border-dashed rounded-5">
						<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
							fill="currentColor" class="bi bi-person-bounding-box"
							viewBox="0 0 16 16">
                            <path
								d="M1.5 1a.5.5 0 0 0-.5.5v3a.5.5 0 0 1-1 0v-3A1.5 1.5 0 0 1 1.5 0h3a.5.5 0 0 1 0 1zM11 .5a.5.5 0 0 1 .5-.5h3A1.5 1.5 0 0 1 16 1.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 1-.5-.5M.5 11a.5.5 0 0 1 .5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 1 0 1h-3A1.5 1.5 0 0 1 0 14.5v-3a.5.5 0 0 1 .5-.5m15 0a.5.5 0 0 1 .5.5v3a1.5 1.5 0 0 1-1.5 1.5h-3a.5.5 0 0 1 0-1h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 1 .5-.5" />
                            <path
								d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm8-9a3 3 0 1 1-6 0 3 3 0 0 1 6 0" />
                        </svg>

						<%
						if (student != null) {
						%>
						<h1 class="text-body-emphasis mt-2 fw-light"><%=student.getName()%></h1>
						<p class="h4 mt-3 fw-lighter">
							<strong>Email: </strong><span class="text-lowercase"><%=student.getEmail()%></span>
						</p>
						<p class="h4 fw-lighter">
							<strong>Username: </strong><span class="text-lowercase"><%=student.getUsername()%></span>
						</p>
						<p class="h4 mx-auto mb-4 fw-lighter">
							<strong>Contact: </strong><%=student.getContact()%>
						</p>

						<ul class="nav justify-content-center">
							<li class="nav-item"><a class="nav-link text-primary-emphasis" href="select-subject.jsp">Add Subject</a></li>
							<li class="nav-item"><a class="nav-link text-primary-emphasis" href="result.jsp">View Result</a></li>
							<li class="nav-item"><a class="nav-link text-danger" href="#">Edit Profile</a></li>
							<li class="nav-item"><a class="nav-link text-success" href="logout">Sign Out</a></li>
						</ul>

					
						<br>
						<%
						} else {
						%>
						<br>
						<br>
						<p>No student information found.</p>
						<%
						}
						%>
					</div>
				</div>
			</section>
		</div>
	</main>

	<%@ include file="footer.jsp"%>
</body>
</html>
