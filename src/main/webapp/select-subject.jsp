<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.exam.service.SubjectService"%>
<%@ page import="com.exam.service.SubjectServiceImpl"%>
<%@ include file="userSession.jsp"%>
<%@ include file="common-resources.jsp"%>
<%
SubjectService subjectService = new SubjectServiceImpl();
List<String> listSubject = subjectService.getAllSubjects();

String message = (String) session.getAttribute("message");
session.removeAttribute("message");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Select Subject</title>
<link rel="stylesheet" type="text/css" href="css/selectSubject.css">
<link rel="stylesheet" type="text/css" href="css/CustomColor.css">
</head>
<body>

	<%@ include file="navbar.jsp"%>
	<main>
		<section class="py-5">
			<div class="loginWidth">
				<div class="container-sm">
					<h1 class="display-4 text-center">Select Subject</h1>
					<center>
						<%--                         <span class="" style="font-size: 1.9rem;font-weight: 300;">Hello, <strong><%= username %></strong></span><br> --%>
						<%
						if (message != null) {
						%>
						<div class="animate__animated animate__shakeX">
							<span class="text-center" id="message"><%=message%></span>
						</div>
						<%
						}
						%>
					</center>
					<p class="lead text-center">Choose a subject</p>
					<form id="signupForm" name='form' action='assignsubject'
						method='POST'>
						<input type="hidden" id="userId" name="userId"
							value="<%=username%>">
						<div class="mb-3">
							<label for="subjectDropdown" class="form-label">Select
								Subject</label> <select class="form-select" id="subjectDropdown"
								name="subjectDropdown" required>
								<option selected disabled value="">Choose a subject</option>
								<%
								if (listSubject != null && !listSubject.isEmpty()) {
									for (String subject : listSubject) {
								%>
								<option value="<%=subject%>"><%=subject%></option>
								<%
								}
								} else {
								%>
								<option value="">No subjects found</option>
								<%
								}
								%>
							</select> <span class="text-muted" id="subjectWarningMsg"></span>
						</div>
						<div class="input-group mb-3">
							<span class="input-group-text" id="basic-addon1">#</span> <input
								type="text" class="form-control" placeholder="Subject Pin"
								name="subjectpin" aria-label="subjectpin"
								aria-describedby="basic-addon1">
						</div>
						<center>
							<button type="submit" class="btn btn-primary">Select
								Subject</button>

							<button type="button" class="btn btn-secondary"
								onclick="window.location.href='profile.jsp';">Back</button>
						</center>
					</form>
				</div>
			</div>
		</section>
	</main>
	<%@ include file="footer.jsp"%>
	<script src="js/hideMessge.js"></script>
</body>
</html>
