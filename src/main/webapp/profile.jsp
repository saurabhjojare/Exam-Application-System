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
<style>
.centered-text {
	display: inline-block; /* Make the text an inline-block element */
	text-align: left;
	/* Align the text to the left within the inline-block */
}

.hoverIcon:hover {
	transform: translate3d(0, -.125rem, 0);
}
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>

	<!-- Body -->
	<main class="d-flex align-items-center mt-3 mb-3">
		<div class="container jumbWidth">
			<section class="">
				<div class="container">
					<div
						class="position-relative p-4 text-center text-muted bg-body border border-dashed rounded-5"
						style="box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);">
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
						<div class="centered-text">
							<p class="h4 mt-3 fw-lighter">
								<strong>Email: </strong><span class="text-lowercase"><%=student.getEmail()%></span>
							</p>
							<p class="h4 fw-lighter">
								<strong>Username: </strong><span class="text-lowercase"><%=student.getUsername()%></span>
							</p>
							<p class="h4 mx-auto mb-2 fw-lighter">
								<strong>Contact: </strong><%=student.getContact()%>
							</p>

							<%
							// Instantiate the repository to fetch the subjects
							StudentRepositoryImpl studentRepository = new StudentRepositoryImpl();

							// Fetch subjects by student username
							List<String[]> subjects = studentRepository.fetchSubjectsByStudentUsername(username);
							%>

							<%
							if (subjects != null && !subjects.isEmpty()) {
								StringBuilder subjectsList = new StringBuilder();
								for (int i = 0; i < subjects.size(); i++) {
									String subjectName = subjects.get(i)[1];
									subjectsList.append(subjectName);
									if (i < subjects.size() - 1) {
								subjectsList.append(", ");
									}
								}
							%>
							<p class="h4 mx-auto mb-4 fw-lighter" ><strong>Subjects: </strong><%=subjectsList.toString()%></p>
							<%
							} else {
							%>
							<p class="h4 mx-auto mb-4 fw-lighter">No subjects found for this student</p>
							<%
							}
							%>
						</div>

						<ul class="nav justify-content-center">
							<li class="nav-item"><a
								class="nav-link text-primary-emphasis hoverIcon"
								href="select-subject.jsp">Add Subject</a></li>
							<li class="nav-item"><a
								class="nav-link text-primary-emphasis hoverIcon"
								href="result.jsp">View Result</a></li>
							<li class="nav-item"><a
								class="nav-link text-danger hoverIcon" href="editUser.jsp?stid=<%=student.getStid()%>">Edit
									Profile</a></li>
							<li class="nav-item"><a
								class="nav-link text-success hoverIcon" href="logout">Sign
									Out</a></li>
						</ul>


						<br>
						<%
						} else {
						%>
						<br> <br>
						<p>No student information found.</p>
						<%
						session.invalidate();
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
