<%@ include file="userSession.jsp"%>
<%@ include file="common-resources.jsp"%>


<%
ExamService examService = new ExamServiceImpl();
List<String[]> results = examService.getResult(username);
int count = 1;
int count2 = 1;
%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Result</title>
<link rel="stylesheet" type="text/css" href="css/Result.css">
<link rel="stylesheet" type="text/css" href="css/CustomColor.css">
<style>
.TableMob{
display: none;
}

@media (max-width: 800.98px) { 
.TableDesk{
display: none;
}

.TableMob{
display: block;
}
 }

</style>
</head>
<body>

	<%@ include file="navbar.jsp"%>

	<!-- Body -->
	
	<main class="result-content TableDesk">

		<section class="container-sm pt-5 text-center">
			<!-- 			<p class="fw-light h3"> -->
			<!-- 				Hi, -->
			<%-- 				<%=username%></p> --%>
			<h1 class="fw-light">Exam Results</h1>

			<p>Here's a summary of your performance:</p>
			<div class="d-flex justify-content-center mb-3">
				<div class="input-group" style="width: 400px;">
					<input type="text" class="form-control" placeholder="Search Result"
						aria-label="Search result" aria-describedby="button-addon2" disabled>
					<!--         <button class="btn btn-outline-secondary" type="button" id="button-addon2">Search</button> -->
				</div>
			</div>

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
						<td colspan="6" style="border: none;">
							<div
								style="display: flex; justify-content: center; align-items: center;">
								No results found.</div>
						</td>
					</tr>

					<%
					} else {
					%>
					<%
					for (String[] result : results) {
						String status = result[3].equals("1.0") ? "Pass" : "Fail";
					%>
					<tr>
						<td><%=count++%></td>
						<td><%=result[0]%></td>
						<td><%=result[1]%></td>
						<td><%=result[4]%></td>
						<td><%=result[2]%></td>
						<td><%=status%></td>
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
	
	
	<main class=" TableMob">

		<section class="container-fluid pt-5 text-center">
			<!-- 			<p class="fw-light h3"> -->
			<!-- 				Hi, -->
			<%-- 				<%=username%></p> --%>
			<h1 class="fw-light">Exam Results</h1>

			<p>Here's a summary of your performance:</p>
			<div class="d-flex justify-content-center mb-3">
				<div class="input-group" style="width: 400px;">
					<input type="text" class="form-control" placeholder="Search Result"
						aria-label="Search result" aria-describedby="button-addon2" disabled>
					<!--         <button class="btn btn-outline-secondary" type="button" id="button-addon2">Search</button> -->
				</div>
			</div>

			<table class="table table-bordered">
				<thead>
					
				</thead>
				<tbody>
					<%
					if (results.isEmpty()) {
					%>
					<tr>
						<td colspan="6" style="border: none;">
							<div
								style="display: flex; justify-content: center; align-items: center;">
								No results found.</div>
						</td>
					</tr>

					<%
					} else {
					%>
					<%
					for (String[] result : results) {
						String status = result[3].equals("1.0") ? "Pass" : "Fail";
					%>
					<tr>
						<td scope="col">#</td>
						<td scope="col"><%=count2++%></td>
					</tr>
					<tr>
						<td scope="col">Exam</td>
						<td scope="col"><%=result[0]%></td>
					</tr>
					<tr>
						<td scope="col">Subject</td>
						<td scope="col"><%=result[1]%></td>
					</tr>
					<tr>
						<td scope="col">Exam Date</td>
						<td scope="col"><%=result[4]%></td>
					</tr>
					<tr>
						<td scope="col">Marks</td>
						<td scope="col"><%=result[2]%></td>
					</tr>
					<tr>
						<td scope="col">Status</td>
						<td scope="col"><%=status%></td>
					</tr>
					<tr class="empty-row" style = "border:0px solid #fff;">
							<td colspan="2"></td>
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