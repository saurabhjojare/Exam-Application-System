<%@ include file="commonResources.jsp" %>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Error</title>

	<link rel="stylesheet" type="text/css" href="css/customColor.css">
</head>
<body >
		<%@ include file="navbar.jsp"%>

		<!-- Body -->
		<main class="d-flex align-items-center text-center">
		<div class = "container">
			<section class="py-5 text-center">
				<div class="container">
					<h1 class="display-6">Oops! Something Went Wrong</h1>
					<p class="lead">Sorry, an unexpected error occurred.</p>
					<p>Please try again later or <a href="helpdesk.jsp" class="text-decoration-none">contact us</a> if the problem persists.</p>
				</div>
			</section>
		</div>
		</main>
		
		<%@ include file="footer.jsp"%>

</body>
</html>