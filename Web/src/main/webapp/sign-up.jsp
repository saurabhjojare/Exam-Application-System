<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sign Up</title>
<link rel="icon" href="../img/favicon.png" type="image/x-icon">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/login.css">
<link rel="stylesheet" type="text/css" href="css/sign-up.css">

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
						<div class="mb-3">
							<label for="fullName" class="form-label">Full Name</label> 
							<input
								type="text" class="form-control" id="fullName" name="fullName"
								placeholder="Enter your full name" required>
								 <span class = "text-muted" id="fullNameWarningMsg"></span>
						</div>
						<div class="mb-3">
							<label for="username" class="form-label">Username</label> <input
								type="text" class="form-control" id="username" name="username"
								placeholder="Create a username" required>
								<span class = "text-muted" id = "usernameWarningMsg"></span>
						</div>
						<div class="mb-3">
							<label for="email" class="form-label">Email address</label> <input
								type="email" class="form-control" id="email" name="email"
								placeholder="Enter your email" required>
								<span class = "text-muted" id="emailWarningMsg"></span>


						</div>
						<div class="mb-3">
							<label for="contact" class="form-label">Contact Number</label> <input
								type="tel" class="form-control" id="contact" name="contact"
								placeholder="Enter your contact number" required>
								<span class = "text-muted" id="contactWarningMsg"></span>

						</div>
						<div class="mb-3">
							<label for="signupPassword" class="form-label">Password</label>
							<div class="input-group">
								<input type="password" class="form-control" id="signupPassword"
									name="signupPassword" placeholder="Create a password" required>
								<button class="btn btn-outline-secondary" type="button"
									id="showPasswordButton">Show</button>
									
							</div>
							<span class = "text-muted" id = "passwordWarningMsg1"></span>
						</div>
						<center>
						<button type="submit" class="btn btn-primary">Sign Up</button>
						</center>
						<div class="login-link mt-3 text-center">
							Have an account? <a href="login.jsp">Log In</a>
						</div>
					</form>
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


<script src="js/userSignupValidation.js"></script>

	<script>
	// Form submission validation
	$(document).ready(function() {
	  $('#signupForm').submit(function(e) {
	    // Perform all validations before submitting the form
	    var isValid = validateFullName() && validateUsername() && validatePassword() && validateContact() && validateEmail();
	    
	    if (!isValid) {
	      // Prevent form submission if any validation fails
	      e.preventDefault();
	    }
	  });
	});

	
	document.getElementById('showPasswordButton').addEventListener(
			'click',
			function() {
				const passwordInput = document
						.getElementById('signupPassword');
				if (passwordInput.type === 'password') {
					passwordInput.type = 'text';
					this.textContent = 'Hide';
				} else {
					passwordInput.type = 'password';
					this.textContent = 'Show';
				}
			});
			
			
			
			// JavaScript to hide the message after 4 seconds
	setTimeout(function() {
		var messageElement = document.getElementById('message');
		if (messageElement) {
			messageElement.style.display = 'none';
		}
	}, 4000); // 4 seconds
	</script>
</body>
</html>