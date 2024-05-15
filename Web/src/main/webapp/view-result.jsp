<%@ include file="existingSession.jsp" %>
<%@ include file="common-resources.jsp" %>


<%
ExamService examService = new ExamServiceImpl();
List<String[]> results = examService.getAllResults();
%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>View Result</title>
<link rel="stylesheet" type="text/css" href="css/viewResult.css">

</head>
<body>

	<div class="marginBottom">
		<div class="d-flex marginBottom">
			<div class="sidebar">
				<%@ include file="sidebar.jsp"%>
			</div>
			<!-- Main Content Area -->
			<div class="flex-grow-1 view-padding text-center">
				<h3 class="display-6 mt-2">Result Details</h3>


				<div class="d-flex justify-content-center mb-3">
					<div class="input-group" style="width: 400px;">
						<input type="text" class="form-control" id="searchInput"
							placeholder="Search Result" aria-label="Search result"
							aria-describedby="button-addon2"
							onkeyup="searchByName(this.value)">
						<!-- <button class="btn btn-outline-secondary" type="button" id="button-addon2">Search</button> -->
					</div>
				</div>


				<table class="table table-bordered" id="resultsTable">
					<thead>
					</thead>
					<tbody id="resultsBody">
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
						%>
						<tr>
							<td class="key" style="padding: 15px">#</td>
							<td class="value" style="padding: 15px">1</td>
						</tr>

						<tr>
							<td class="key" style="padding-left: 15px">Student Name</td>
							<td class="value" style="padding-right: 15px"><%=result[0]%></td>
						</tr>

						<tr>
							<td class="key" style="padding-left: 15px">Exam Name</td>
							<td class="value" style="padding-right: 15px"><%=result[1]%></td>
						</tr>

						<tr>
							<td class="key" style="padding-left: 15px">Subject Name</td>
							<td class="value" style="padding-right: 15px"><%=result[2]%></td>
						</tr>
						<tr>
							<td class="key" style="padding-left: 15px">Exam Date</td>
							<td class="value" style="padding-right: 15px"><%=result[3]%></td>
						</tr>
						<tr>
							<td class="key" style="padding-left: 15px">Marks</td>
							<%
							double obtainedPercentage = Double.parseDouble(result[4]);
							String formattedPercentage = String.format("%.2f", obtainedPercentage);
							%>
							<td class="value" style="padding-right: 15px"><%=formattedPercentage%>
								%</td>
						</tr>
						<tr>
							<td class="key" style="padding-left: 15px">Status</td>
							<%
							double status = Double.parseDouble(result[5]);
							String statusText = (status == 1.0) ? "Pass" : "Fail";
							%>
							<td class="value" style="padding-right: 15px"><%=statusText%></td>
						</tr>
						<tr>
							<td class="key" style="padding-left: 15px">Edit</td>
							<td>
								<button class="btn btn-primary">Update</button>
								<button class="btn btn-danger">Delete</button>
							</td>
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

			</div>
			<div></div>
		</div>
	</div>
	<div class="bottom-navbar">
		<%@ include file="navbar-bottom.jsp"%>
	</div>

</body>
</html>
