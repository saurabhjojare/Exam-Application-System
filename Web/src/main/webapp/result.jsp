<%@ include file="userSession.jsp"%>
<%@ include file="common-resources.jsp"%>


<%
ExamService examService = new ExamServiceImpl();
List<String[]> results = examService.getResult(username);
int count = 1;
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

		<section class="container-sm pt-5 text-center">
			<!-- 			<p class="fw-light h3"> -->
			<!-- 				Hi, -->
			<%-- 				<%=username%></p> --%>
			<h1 class="fw-light">Exam Results</h1>

			<p>Here's a summary of your performance:</p>
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Exam Name</th>
						<th scope="col">Subject</th>
						<th scope="col">Exam Date</th>
						<th scope="col">Marks</th>
						<th scope="col">Status</th>
					</tr>
				</thead>
				<tbody>
					<%
						if (results.isEmpty()) {
						%>
						<tr>
							<td colspan="2" style="text-align: center;">No results
								found.</td>
						</tr>
						<%
						} else {
						%>
						<%
						for (String[] result : results) {
							 String status = result[3].equals("1.0") ? "Pass" : "Fail";
						%>
					<tr>
						<th scope="row"><%=count++%></th>
						<td><%=result[0]%></td>
						<td><%=result[1]%></td>
						<td><%=result[4]%></td>
						<td><%=result[2]%></td>
						<td><%= status %></td>
						
					</tr>
						<%
						}
						%>
						<%
						}
						%>
				</tbody>
			</table>


		</section>
	</main>

	<%@ include file="footer.jsp"%>

</body>
</html>