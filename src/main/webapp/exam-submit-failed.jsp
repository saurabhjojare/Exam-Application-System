<%@ include file="commonResources.jsp" %>
<%@ include file="userSession.jsp" %>

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
					<h1 class="display-6">Exam Submission Unsuccessful</h1>
					<p class="lead">It appears you may have already completed the exam for this schedule.</p>
				</div>
			</section>
		</div>
		</main>
		
		<%@ include file="footer.jsp"%>

</body>
</html>