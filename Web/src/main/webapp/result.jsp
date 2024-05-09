<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%
HttpSession existingSession = request.getSession(false);
if (existingSession == null || existingSession.getAttribute("username") == null) {
	response.sendRedirect("login.jsp");
	// Optional: You can use <jsp:forward> here if you want to ensure that the rest of the JSP page isn't processed.
	// <jsp:forward page="login.jsp" />
}
String username = (String) existingSession.getAttribute("username");
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Result</title>
<link rel="icon" href="../img/favicon.png" type="image/x-icon">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="../css/style.css">
	<link rel="stylesheet" type="text/css" href="../css/login.css">
	<style>
  .result-content {
    max-width: 800px; /* Adjust the width as needed */
    margin: 0 auto; /* Centers the content horizontally */
  }
  
   @media only screen and (max-width: 768px) {
    .result-content { /* Target your result content class */
      width: 100%; /* Set width to 100% for mobile */
    }
  }
</style>

</head>
<body>
	
<%@ include file="navbar.jsp"%>

		<!-- Body -->
<main class="result-content">
  <section class="container-sm py-5 text-center">
    <h1>Exam Results</h1>
    <p>Hi, <%=username%>,</p>
    <p>Your exam is complete.</p>
    <p>Here's a summary of your performance:</p>
    <ul class="list-group">
      <li class="list-group-item d-flex justify-content-between align-items-center">
        Total Marks Scored: <span class="badge bg-primary rounded-pill" id="totalScore">--</span>
      </li>
      <li class="list-group-item d-flex justify-content-between align-items-center">
        Maximum Marks: <span class="badge bg-primary rounded-pill" id="maxMarks">--</span>
      </li>
      <li class="list-group-item d-flex justify-content-between align-items-center">
        Result: <span class="badge bg-success rounded-pill" id="result">--</span>
      </li>
    </ul>
  </section>
</main>
		
		<%@ include file="footer.jsp"%>


	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
		integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
		crossorigin="anonymous"></script>
</body>
</html>