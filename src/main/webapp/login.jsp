<%@ include file="common-resources.jsp" %>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="css/Login.css">
<link rel="stylesheet" type="text/css" href="css/CustomColor.css">
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
					<div class="animate__animated animate__shakeX">
					<span id="message">${message}</span>
					</div>
					<p class="lead">Please enter your credentials to log in.</p>
					<form name='form' action='login' method='Post'>
						<div class="mb-3">
							<label for="username" class="form-label">Username</label> <input
								type="text" name="username" class="form-control" id="username"
								placeholder="Enter your username" autocomplete="off">
						</div>
						<div class="mb-3">
							<label for="password" class="form-label">Password</label> 
							<div class="input-group">
							<input
								type="password" name="password" class="form-control"
								id="password" placeholder="Enter your password" autocomplete="off">
								<button class="btn btn-outline-secondary" type="button" id="togglePassword">
                                    <i class="bi bi-eye-slash"></i>
                                </button>
                                </div>
						</div>
						<button type="submit" value="Submit" class="btn btn-primary">Login</button>
						<!-- Reset button -->
						<button type="reset" class="btn btn-danger">Reset</button>
				
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
	<script src="js/showPasswordUser.js"></script>
	<script src="js/Login.js"></script>
	
</body>
</html>