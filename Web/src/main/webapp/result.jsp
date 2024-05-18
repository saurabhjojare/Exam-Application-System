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
<link rel="stylesheet" type="text/css" href="css/CustomColor.css">
</head>
<body>

	<%@ include file="navbar.jsp"%>

	<!-- Body -->
	<main class="result-content">

		<section class="container-sm py-5 text-center">
<!-- 			<p class="fw-light h3"> -->
<!-- 				Hi, -->
<%-- 				<%=username%></p> --%>
			<h1 class="fw-light">Exam Results</h1>

			<p>Here's a summary of your performance:</p>
			<table class="table">
    <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Exam Name</th>
            <th scope="col">Subject Name</th>
            <th scope="col">Exam Date</th>
            <th scope="col">Marks</th>
            <th scope="col">Status</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th scope="row">1</th>
            <td>Mock</td>
            <td>C</td>
            <td>2024-05-15</td>
            <td>80.40 %</td>
            <td>Pass</td>
        </tr>
    </tbody>
</table>


		</section>
	</main>

	<%@ include file="footer.jsp"%>

</body>
</html>