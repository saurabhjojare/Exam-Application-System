<%@ include file="commonResources.jsp"%>
<%@ include file="existingSession.jsp"%>
<%
													
	AdminService adminService = (AdminService) request.getServletContext().getAttribute("adminService");
	// Fetch limited access status using the service method
	boolean isLimitedAccess = adminService.isLimitedAccessByEmail(username);
%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add Admin</title>
<link rel="stylesheet" type="text/css" href="css/addAdmin.css">
<link rel="stylesheet" type="text/css" href="css/nextStep.css">
<link rel="stylesheet" type="text/css" href="css/customColor.css">

</head>
<body>
	<div class="d-flex">
		<div class="sidebar">
			<%@ include file="sidebar.jsp"%>
		</div>

		<!-- Main Content Area -->
		<div class="flex-grow-1  d-flex" style="height: 100vh; overflow: auto">
			<main>
				<section class="py-3">
					<div class="loginWidth">
						<div class="container">
							<div class="row justify-content-center">
								<div class="col-lg-6">
									<div class="signup-form">
										<!-- <div class="p-5 text-center bg-body-tertiary rounded-3"> -->
										<!--     <h1 class="text-body-emphasis">Basic jumbotron</h1> -->
										<!--     <p class="lead"> -->
										<!--       This is a simple Bootstrap jumbotron that sits within a <code>.container</code>, recreated with built-in utility classes. -->
										<!--     </p> -->
										<!--   </div> -->
										<h1 class="display-6 text-center">QuizConnect</h1>

										<h1 class="fw-light h3 mt-2 text-center">Add Admin</h1>
										<div class="animate__animated animate__shakeX">
											<center>
												<span id="message">${message}</span>
											</center>
										</div>

										<!-- 										<p class="lead text-center">Enter details for the new -->
										<!-- 											admin.</p> -->
										<form id="signupForm" action="adminsignup" method="post">
											<div class="step active" id="step1">
												<div class="form-group mb-3">
													<label for="fullName">Full Name</label> <input type="text"
														class="form-control" id="fullName" name="fullName"
														placeholder="Enter Full Name" autocomplete="off" required>
													<span class="text-muted" id="fullNameWarningMsg"></span>
												</div>
												<div class="form-group mb-3">
													<label for="contact">Contact</label> <input type="text"
														class="form-control" id="contact" name="contact"
														placeholder="Enter Contact" autocomplete="off" value="+91"
														required> <span class="text-muted"
														id="contactWarningMsg"></span>
												</div>
												<div class="form-group mb-3">
													<label for="email">Email Address</label> <input
														type="email" class="form-control" id="email" name="email"
														placeholder="Enter Email Address" autocomplete="off"
														required> <span class="text-muted"
														id="emailWarningMsg"></span>


												</div>
												<div class="form-group mb-3">
													<label for="password">Password</label> <input
														type="password" class="form-control" id="password"
														name="password" placeholder="Enter Password"
														autocomplete="new-password" required> <span
														class="text-muted" id="passwordWarningMsg1"></span>
												</div>
												<div class="form-group mb-3">
													<label for="confirmPassword">Confirm Password</label> <input
														type="password" class="form-control" id="confirmPassword"
														name="confirmPassword" placeholder="Confirm Password"
														autocomplete="new-password" required> <span
														class="text-muted" id="passwordWarningMsg"></span>

												</div>
												<button type="button" class="btn btn-primary marginBottom"
													onclick="nextStep()">Next</button>
											</div>
											<div class="step" id="step2">
												<div class="form-group mb-3">
													<label for="role">Role</label> <select class="form-control"
														id="role" name="role" required>
														<option value="" disabled>Select Role</option>
														<option value="Administrator">Administrator</option>
														<option value="Manager">Manager</option>
														<option value="Supervisor">Supervisor</option>
														<option value="Supervisor">Staff</option>
														<!-- Add more options as needed -->
													</select>
												</div>
												<div class="form-group mb-3">
													<label for="department">Department</label> <select
														class="form-control" id="department" name="department"
														required>
														<option value="" disabled>Select Department</option>
														<option value="IT Department">IT Department</option>
														<option value="HR Department">HR Department</option>
														<option value="Marketing Department">Marketing
															Department</option>
														<!-- Add more options as needed -->
													</select>
												</div>
												<div class="form-group mb-3">
													<label for="permissions">Permissions</label> <select
														class="form-control" id="permissions" name="permissions"
														required>
														<option value="" disabled>Select Permissions</option>
														<!-- <option value="System Level" disabled>System Access</option> -->
														<option value="Full Access">Full Access</option>
														<option value="Limited Access">Limited Access</option>
														<!-- Add more options as needed -->
													</select>
												</div>

												<div class="text-center">
													<div class="marginBottom">
														<button type="button" class="btn btn-secondary"
															onclick="prevStep()">Back</button>
													<% 
                                                    if (!isLimitedAccess) { 
                                                    %>
														<button type="submit" class="btn btn-primary btn-block"
															id="addAdminButton">Add Admin</button>
													   <% 
                                                    } 
                                                    %>
                                                    
                                                    <% 
                                                    if (isLimitedAccess) { 
                                                    %>
														<button class="btn btn-primary btn-block" disabled>Cannot Add Admin</button>
													   <% 
                                                    } 
                                                    %>
													</div>
												</div>
											</div>

										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
			</main>
		</div>
	</div>

	<div class="bottom-navbar">
		<%@ include file="navbar-bottom.jsp"%>
	</div>

	<script src="js/signupValidation.js"></script>
	<script src="js/nextButton.js"></script>
	<script src="js/hideMessge.js"></script>

</body>
</html>