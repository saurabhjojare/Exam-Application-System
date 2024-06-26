<%@ include file="existingSession.jsp"%>
<%@ include file="commonResources.jsp"%>

<%
													
	AdminService adminService = (AdminService) request.getServletContext().getAttribute("adminService");
	// Fetch limited access status using the service method
	boolean isLimitedAccess = adminService.isLimitedAccessByEmail(username);
%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>View Exam</title>
<link rel="stylesheet" type="text/css" href="css/viewExam.css">
<link rel="stylesheet" type="text/css" href="css/customColor.css">
</head>
<body>

	<div class="d-flex">
		<div class="sidebar">
			<%@ include file="sidebar.jsp"%>
		</div>

		<!-- Main Content Area -->
		<div class="flex-grow-1 view-padding text-center">
			<div class="marginBottom">
				<h1 class="display-6 mt-3">QuizConnect</h1>
			
				<h1 class="fw-light h3 mt-2">Exam Details</h1>

				<div class="d-flex justify-content-center mb-3">
					<div class="input-group" style="width: 400px;">
						<input type="text" class="form-control" placeholder="Search Exam"
							aria-label="Search exams" aria-describedby="button-addon2"
							disabled>
						<!--         <button class="btn btn-outline-secondary" type="button" id="button-addon2">Search</button> -->
					</div>
				</div>


				<%
				ExamService examService = new ExamServiceImpl();
				ExamRepository examRepository = new ExamRepositoryImpl();
				List<ExamModel> examList = examService.getAllExam();
				int count = 1;
				int totalExams = (examList != null) ? examList.size() : 0;

				if (totalExams > 0) {
				%>
				<table class="table table-bordered">
					<thead>
					</thead>
					<tbody>
						<%
						for (ExamModel exam : examList) {
						%>
						<tr>
							<td class="key" style="padding: 15px">#</td>
							<td class="value" style="padding: 15px"><%=count++%></td>
						</tr>
						<tr>
							<td class="key" style="padding-left: 15px">Exam Name</td>
							<td class="value" style="padding-right: 15px"><%=exam.getName()%></td>
						</tr>
						<tr>
							<td class="key" style="padding-left: 15px">Total Marks</td>
							<td class="value" style="padding-right: 15px"><%=exam.getTotalMarks()%></td>
						</tr>
						<tr>
							<td class="key" style="padding-left: 15px">Passing Marks</td>
							<td class="value" style="padding-right: 15px"><%=exam.getPassingMarks()%></td>
						</tr>
						<% 
                                                    if (!isLimitedAccess) { 
                                                    %>
						<tr>
							<td class="key" style="padding-left: 15px">Edit</td>
							<td>
								<button class="btn btn-primary" disabled>Update</button> <a
								href='deleteExam?id=<%=exam.getId()%>' class="btn btn-danger">Delete</a>
							</td>
						</tr>
						   <% 
                               } 
                               %>
						<tr class="empty-row" style="border: 0px solid #fff;">
							<td colspan="2"></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
				<%
				} else {
				%>
				<p>No exams found.</p>
				<%
				}
				%>

			</div>
			<div></div>
		</div>
	</div>
	<div class="bottom-navbar">
		<%@ include file="navbar-bottom.jsp"%>
	</div>

</body>
</html>
