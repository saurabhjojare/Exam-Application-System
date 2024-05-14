<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>
<link rel="icon" href="img/favicon.png" type="image/x-icon">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/login.css">

<link rel="stylesheet" type="text/css" href="css/login.css">
<link rel="stylesheet" type="text/css" href="css/style.css">

</head>
<body>

	<%
	request.setAttribute("showNavbarBrand", true);
	%>
	<%@ include file="navbar.jsp"%>

	<!-- Body -->
	<main>
		<section class="py-5 text-center">
			<div class="loginWidth">
				<div class="container-sm">
					<h1 class="display-4">Login</h1>
					<span id="message">${message}</span>
					<p class="lead">Please enter your credentials to log in.</p>
					<form name='form' action='login' method='Post'>
						<div class="mb-3">
							<label for="username" class="form-label">Username</label> <input
								type="text" name="username" class="form-control" id="username"
								placeholder="Enter your username">
						</div>
						<div class="mb-3">
							<label for="password" class="form-label">Password</label> <input
								type="password" name="password" class="form-control"
								id="password" placeholder="Enter your password">
						</div>
						<button type="submit" value="Submit" class="btn btn-primary">Login</button>
						<!-- Reset button -->
						<button type="reset" class="btn btn-danger">Reset</button>
						<!-- Back button -->
						<!--
          <button type="button" class="btn btn-light" onclick="history.back()">Back</button>
           -->
						<div class="login-link mt-3">
							Don't have an account? <a href="sign-up.jsp">Sign Up</a>
						</div>
						<div class="login-link mt-2">Are you an admin? 
						<a href="admin-login.jsp">Login</a>
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

	<script>
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