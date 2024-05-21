<%@ include file="common-resources.jsp" %>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>404</title>

	<link rel="stylesheet" type="text/css" href="css/Home.css">
	<link rel="stylesheet" type="text/css" href="css/CustomColor.css">
</head>
<body >
		<%@ include file="navbar.jsp"%>

		<!-- Body -->
		<main class="d-flex align-items-center text-center">
		<div class = "container">
			<section class="py-5 text-center">
				<div class="container">
					<h1 class="display-6">404 - Page Not Found</h1>
					<p class="lead">Sorry, the page you are looking for does not exist.</p>
					<p>Go back to <a href="index.jsp" class="text-decoration-none">home</a>.</p>
				</div>
			</section>
		</div>
		</main>
		
		<%@ include file="footer.jsp"%>

</body>
</html>