<%@ include file="common-resources.jsp" %>
<%@ include file="userSession.jsp" %>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Error</title>
	<link rel="stylesheet" type="text/css" href="css/CustomColor.css">
</head>
<body >
		<%@ include file="navbar.jsp"%>

		<!-- Body -->
		<main class="d-flex align-items-center text-center">
		<div class = "container">
			<section class="py-5 text-center">
				<div class="container">
					<h1 class="display-6">This exam has already been attempted.</h1>
					<h5 class ="h5 fw-light mt-3">View your result <a href="result.jsp" class="text-decoration-none">here</a></h5>

				</div>
			</section>
		</div>
		</main>
		
		<%@ include file="footer.jsp"%>

</body>
</html>