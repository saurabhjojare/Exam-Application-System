<%@ include file="userSession.jsp"%>
<%@ include file="common-resources.jsp"%>

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
<link rel="stylesheet" type="text/css" href="css/Result.css">
</head>
<body>

	<%@ include file="navbar.jsp"%>

	<!-- Body -->
	<main class="result-content">
		<section class="container-sm py-5 text-center">
			<h1>Exam Results</h1>
			<p>
				Hi,
				<%=username%>,
			</p>
			<p>Your exam is complete.</p>
			<p>Here's a summary of your performance:</p>
			<ul class="list-group">
				<li
					class="list-group-item d-flex justify-content-between align-items-center">
					Total Marks Scored: <span class="badge bg-primary rounded-pill"><%=totalScore%></span>
				</li>
				<li
					class="list-group-item d-flex justify-content-between align-items-center">
					Maximum Marks: <span class="badge bg-primary rounded-pill">100</span>
				</li>
				<li
					class="list-group-item d-flex justify-content-between align-items-center">
					Attempted Questions: <span class="badge bg-primary rounded-pill"><%=attemptedQuestions%></span>
				</li>
				<li
					class="list-group-item d-flex justify-content-between align-items-center">
					Correct Answers: <span class="badge bg-primary rounded-pill"><%=correctAnswers%></span>
				</li>
				<li
					class="list-group-item d-flex justify-content-between align-items-center">
					Incorrect Answers: <span class="badge bg-primary rounded-pill"><%=incorrectAnswers%></span>
				</li>
				<li
					class="list-group-item d-flex justify-content-between align-items-center">
					Result: <span class="badge bg-success rounded-pill"><%=result%></span>
				</li>

			</ul>
		</section>
	</main>

	<%@ include file="footer.jsp"%>

</body>
</html>