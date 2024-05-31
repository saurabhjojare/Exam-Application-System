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
<title>Edit Profile</title>

<link rel="stylesheet" type="text/css" href="css/Home.css">
<link rel="stylesheet" type="text/css" href="css/CustomColor.css">
<style>
.form-label {
	float: left;
}

.widthEdit {
	width: 40%;
}

@media (max-width: 967.98px) { 
.widthEdit {
	width: 95%;
}
 }

</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>

	<!-- Body -->
	<main class="d-flex align-items-center text-center">
		<div class="widthEdit mx-auto p-2">
			<div class="container">
				<section class="py-2 text-center">
					<div class="container">
						<h1 class="display-6">Edit Profile</h1>

						<form name='form' action='updateStudent' method='Post'>
						<%
							if (student != null) {
						%>
						    <input type="hidden" name="stid" value="<%=student.getStid()%>">
						
							<div class="mb-3">
								<label for="username" class="form-label">Username</label> <input
									type="text" name="username" class="form-control" id="username"
									placeholder="Enter your username" value="<%=student.getUsername()%>" autocomplete="off">
								<span class = "text-muted" id="usernameWarningMsg"></span>
									
							</div>
							<div class="mb-3">
								<label for="name" class="form-label">Full Name</label> <input
									type="text" name="name" class="form-control" id="fullName"
									placeholder="Enter your name" value="<%=student.getName()%>" autocomplete="off">
									<span class = "text-muted" id="fullNameWarningMsg"></span>
									
							</div>
							<div class="mb-3">
								<label for="email" class="form-label">Email</label> <input
									type="text" name="email" class="form-control" id="email"
									placeholder="Enter your email" value="<%=student.getEmail()%>" autocomplete="off">
								<span class = "text-muted" id="emailWarningMsg"></span>
								
							</div>
							<div class="mb-3">
								<label for="contact" class="form-label">Contact</label> <input
									type="text" name="contact" class="form-control" id="contact"
									placeholder="Enter your contact" value="<%=student.getContact()%>" autocomplete="off">
								<span class = "text-muted" id="contactWarningMsg"></span>
								
							</div>
							<div class="mb-3">
								<label for="password" class="form-label">Password</label> <input
									type="password" name="password" class="form-control" id="signupPassword"
									placeholder="Enter your username" value="<%=student.getPassword()%>" autocomplete="off">
								<span class = "text-muted" id="passwordWarningMsg1"></span>
								
							</div>
							<%
							} else {
							%>
							<p class="h4 mx-auto mb-4 fw-lighter">No student found.</p>
							<%
							}
							%>
							<button type="button" class="btn btn-secondary"
								onclick="window.location.href='profile.jsp';">Back</button>
							<button type="submit" value="Submit" class="btn btn-primary">Update</button>
							
						</form>
					</div>
				</section>
			</div>
		</div>
	</main>

	<%@ include file="footer.jsp"%>
	<script src="js/userSignupValidation.js"></script>	

</body>
</html>