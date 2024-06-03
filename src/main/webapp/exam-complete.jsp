<%@ include file="userSession.jsp"%>
<%@ include file="commonResources.jsp"%>

<%
// Retrieve URL parameters with default values
int correctAnswers = 0;
int incorrectAnswers = 0;
int totalQuestions = 0;
int attemptedQuestions = 0;

try {
    correctAnswers = Integer.parseInt(request.getParameter("correctAnswers"));
} catch (NumberFormatException e) {
    correctAnswers = 0;
}
try {
    incorrectAnswers = Integer.parseInt(request.getParameter("incorrectAnswers"));
} catch (NumberFormatException e) {
    incorrectAnswers = 0;
}
try {
    totalQuestions = Integer.parseInt(request.getParameter("totalQuestions"));
} catch (NumberFormatException e) {
    totalQuestions = 0;
}
try {
    attemptedQuestions = Integer.parseInt(request.getParameter("attemptedQuestions"));
} catch (NumberFormatException e) {
    attemptedQuestions = 0;
}

// Calculate total score
int totalScore = (totalQuestions > 0) ? (correctAnswers * 100) / totalQuestions : 0;
// Determine result
String result = totalScore >= 60 ? "Pass" : "Fail";
%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Result</title>
<link rel="stylesheet" type="text/css" href="css/result.css">
<link rel="stylesheet" type="text/css" href="css/customColor.css">
</head>
<body>

	<%@ include file="navbar.jsp"%>

	<!-- Body -->
	<main class="result-content mt-2">
		<section class="container-sm py-5 text-center mt-5">
		<span class ="h3 fw-light">
				Hi,
				<%=username%>
			</span>
			<h1 class = "fw-light mt-3">Your exam is complete</h1>
			
			<h5 class ="h5 fw-light mt-3">View your result <a href="result.jsp" class="text-decoration-none">here</a></h5>
			<ul class="list-group">
	
			</ul>
		</section>
	</main>

	<%@ include file="footer.jsp"%>

</body>
</html>