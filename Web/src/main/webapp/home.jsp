<%@ include file="common-resources.jsp" %>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home</title>

	<link rel="stylesheet" type="text/css" href="css/Home.css">
</head>
<body >
		<%@ include file="navbar.jsp"%>

		<!-- Body -->
		<main class="d-flex align-items-center text-center">
		<div class = "container">
			<section class="py-5 text-center">
				<div class="container">
					<h1 class="display-6">Welcome to the QuizConnect</h1>
					<p class="lead">Apply for exams with ease and convenience.</p>
					<a href="login.jsp" class="btn btn-primary btn-lg">Get Started</a>
				</div>
			</section>
		</div>
		</main>
		
		<%@ include file="footer.jsp"%>

</body>
</html>