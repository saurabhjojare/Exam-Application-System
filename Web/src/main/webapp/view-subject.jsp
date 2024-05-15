<%@ include file="existingSession.jsp"%>
<%@ include file="common-resources.jsp"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>View Subject</title>
<link rel="stylesheet" type="text/css" href="css/viewSubject.css">
</head>
<body>

	<div class="d-flex">
		<div class="sidebar">
			<%@ include file="sidebar.jsp"%>
		</div>
		<!-- Main Content Area -->
		<div class="flex-grow-1 view-padding text-center">
			<div class="marginBottom">
				<h3 class="display-6 mt-2">Subject Details</h3>

				<div class="d-flex justify-content-center mb-3">
					<div class="input-group" style="width: 400px;">
						<input type="text" class="form-control"
							placeholder="Search Subject" aria-label="Search subject"
							aria-describedby="button-addon2">
						<!--         <button class="btn btn-outline-secondary" type="button" id="button-addon2">Search</button> -->
					</div>
				</div>

				<table class="table table-bordered">
					<thead>

					</thead>
					<tbody>
						<tr>
							<%
							// Assuming examList contains a list of ExamModel objects
							SubjectService subjectService = new SubjectServiceImpl();
							SubjectRepository subjectRepository = new SubjectRepositoryImpl();
							List<String> listSubject = subjectService.getAllSubjects();
							if (listSubject != null && !listSubject.isEmpty()) {
								int count = 1;
								int totalSubject = listSubject.size();
								for (String subject : listSubject) {
							%>
							<td class="key" style="padding: 15px">#</td>
							<td class="value" style="padding: 15px"><%=count++%></td>
						</tr>
						<tr>
							<td class="key" style="padding-left: 15px">Subject</td>
							<td class="value" style="padding-right: 15px"><%=subject%></td>
						</tr>

						<tr>
							<td class="key" style="padding-left: 15px">Edit</td>
							<td>
								<button class="btn btn-primary">Update</button>
								<button class="btn btn-danger">Delete</button>
							</td>
						</tr>
						<%
						if (count <= totalSubject) { // Check if it's not the last iteration
						%>
						<tr class="empty-row">
							<td colspan="2"></td>
							<!-- Add empty cells for space between each set of exam details -->
						</tr>
						<%
						} // End of if
						} // End of loop 
						} else {
						// Handle case where QuestionList is null
						out.println("<tr><td colspan='2'>No subjects found.</td></tr>");
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
