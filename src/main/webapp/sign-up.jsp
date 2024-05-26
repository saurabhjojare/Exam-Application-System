<%@ include file="common-resources.jsp" %>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sign Up</title>
<link rel="stylesheet" type="text/css" href="css/signUp.css">
<link rel="stylesheet" type="text/css" href="css/nextStep.css">
<link rel="stylesheet" type="text/css" href="css/CustomColor.css">

</head>
<body>
	<%
	request.setAttribute("showNavbarBrand", true);
	%>
	<%@ include file="navbar.jsp"%>

	<!-- Body -->
	<main>
		<section class="py-5">
			<div class="loginWidth">
				<div class="container-sm">
					<h1 class="display-4 text-center" >Sign Up</h1>
					<center>
					<span class = "text-center" id="message">${message}</span>
					</center>
					<p class="lead text-center">Create your account to get started.</p>
					<form id="signupForm" name='form' action='signup' method='POST'>
					<div class="step active" id="step1">
						<div class="mb-3">
							<label for="fullName" class="form-label">Full Name</label> 
							<input
								type="text" class="form-control" id="fullName" name="fullName"
								placeholder="Enter your full name" autocomplete="off" required>
								 <span class = "text-muted" id="fullNameWarningMsg"></span>
						</div>
						<div class="mb-3">
							<label for="contact" class="form-label">Contact Number</label> <input
								type="tel" class="form-control" id="contact" name="contact"
								placeholder="Enter your contact number" autocomplete="off" required>
								<span class = "text-muted" id="contactWarningMsg"></span>

						</div>
						
						<div class="mb-0">
							<label for="email" class="form-label">Email address</label> <input
								type="email" class="form-control" id="email" name="email"
								placeholder="Enter your email" autocomplete="off" required>
								<span class = "text-muted" id="emailWarningMsg"></span>

						
						</div>
						<button type="button" class="btn btn-primary mt-3" onclick="nextStep()">Next</button>
						
						</div>
						<div class="step" id="step2">
						<div class="mb-3">
							<label for="username" class="form-label">Username</label> <input
								type="text" class="form-control" id="username" name="username"
								placeholder="Create a username" autocomplete="off" required>
								<span class = "text-muted" id = "usernameWarningMsg"></span>
						</div>
						<div class="mb-3">
							<label for="signupPassword" class="form-label">Password</label>
							<div class="input-group">
								<input type="password" class="form-control" id="signupPassword"
									name="signupPassword" placeholder="Create a password" autocomplete="new-password" required>
								<button class="btn btn-outline-secondary" type="button"
									id="showPasswordButton">Show</button>
									
							</div>
							<span class = "text-muted" id = "passwordWarningMsg1"></span>
						</div>
						
						<center>
						<button type="button" class="btn btn-secondary" onclick="prevStep()">Back</button>
						
						<button type="submit" class="btn btn-primary">Sign Up</button>
						</center>
						<div class="login-link mt-3 text-center">
							Have an account? <a href="login.jsp">Log In</a>
						</div>
						</div>
					</form>
				</div>
			</div>
		</section>
	</main>

	<%@ include file="footer.jsp"%>

	 <script src="js/userSignupValidation.js"></script>	
	 <script src="js/nextButton.js"></script>
	 <script src="js/hideMessge.js"></script>
	 <script src="js/showPassword.js"></script>
</body>
</html>