<%@ include file="common-resources.jsp" %>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="css/Login.css">
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

	<script src="js/hideMessge.js"></script>
</body>
</html>