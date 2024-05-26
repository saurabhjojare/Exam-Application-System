<%@ include file="existingSession.jsp"%>
<%@ include file="common-resources.jsp"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>View Subject</title>
<link rel="stylesheet" type="text/css" href="css/viewSubject.css">
<link rel="stylesheet" type="text/css" href="css/CustomColor.css">
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
							aria-describedby="button-addon2" disabled>
						<!--         <button class="btn btn-outline-secondary" type="button" id="button-addon2">Search</button> -->
					</div>
				</div>

				<table class="table table-bordered">
					<thead>

					</thead>
					<tbody>
						<tr>
							<%
							SubjectService subjectService = new SubjectServiceImpl();
							SubjectRepository subjectRepository = new SubjectRepositoryImpl();
	                        List<Map<String, String>> listSubject = subjectService.getAllSubjectsId();
							if (listSubject != null && !listSubject.isEmpty()) {
								int count = 1;
								int totalSubject = listSubject.size();
								for (Map<String, String> subject : listSubject) {
									String sid = subject.get("sid");
	                                String subjectName = subject.get("subjectname");
							%>
							<td class="key" style="padding: 15px">#</td>
							<td class="value" style="padding: 15px"><%=count++%></td>
						</tr>
						<tr>
							<td class="key" style="padding-left: 15px">Subject</td>
							<td class="value" style="padding-right: 15px"><%=subjectName%></td>
						</tr>

						<tr>
							<td class="key" style="padding-left: 15px">Edit</td>
							<td>
								<button class="btn btn-primary" disabled>Update</button> <a
								href='deleteSubject?id=<%=sid%>' class="btn btn-danger">Delete</a>
							</td>
						</tr>
						<%
						if (count <= totalSubject) {
						%>
						<tr class="empty-row">
							<td colspan="2"></td>
						</tr>
						<%
						} 
						} 
						} else {
						
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
