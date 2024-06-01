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

		<div class="container d-flex justify-content-center align-items-center vh-100">
        <main class="align-items-center text-center">
            <section>
                <h1 class="display-6">This exam has already been attempted.</h1>
                <h5 class="h5 fw-light mt-3">View your result <a href="result.jsp" class="text-decoration-none">here</a></h5>
            </section>
        </main>
    </div>

		
		<%@ include file="footer.jsp"%>

</body>
</html>