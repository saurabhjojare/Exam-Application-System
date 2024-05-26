<%@ include file="existingSession.jsp"%>
<%@ include file="common-resources.jsp"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>View Schedule</title>
<link rel="stylesheet" type="text/css" href="css/viewSchedule.css">
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
				<h3 class="display-6 mt-2">Schedule Details</h3>

				<div class="d-flex justify-content-center mb-3">
					<div class="input-group" style="width: 400px;">
						<input type="text" class="form-control"
							placeholder="Search Schedule" aria-label="Search schedule"
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
							// Assuming examList contains a list of ExamModel objects
							SubjectService subjectService = new SubjectServiceImpl();
							SubjectRepository subjectRepository = new SubjectRepositoryImpl();
							List<ScheduleModel> listSchedule = subjectService.getAllSchedule();
							if (listSchedule != null) {
								int count = 1;
								int totalSubject = listSchedule.size();
								for (ScheduleModel schedule : listSchedule) {
							%>
							<td class="key" style="padding: 15px">#</td>
							<td class="value" style="padding: 15px"><%=count++%></td>
						</tr>

						<tr>
							<td class="key" style="padding-left: 15px">Subject Name</td>
							<td class="value" style="padding-right: 15px">
								<%
								String subjectName = subjectRepository.getSubjectNameBySchid(schedule.getSchid());
								if (subjectName != null) {
									out.print(subjectName);
								} else {
									out.print("Subject not found"); // or handle the case when subject is not found
								}
								%>
							</td>
						</tr>
						<!-- 						<tr> -->
						<!-- 							<td class="key" style="padding-left: 15px">Schedule ID</td> -->
						<%-- 							<td class="value" style="padding-right: 15px"><%=schedule.getSchid()%></td> --%>
						<!-- 						</tr> -->
						<tr>
							<td class="key" style="padding-left: 15px">Exam</td>
							<td class="value" style="padding-right: 15px">
								<%
								ExamService ExamService = new ExamServiceImpl();
								ExamRepository examRepository = new ExamRepositoryImpl();
								String examName = examRepository.getExamNameByExamId(schedule.getExamid());
								if (examName != null) {
									out.print(examName);
								} else {
									out.print("Exam not found"); // or handle the case when the exam is not found
								}
								%>
							</td>
						</tr>
						<tr>
							<td class="key" style="padding-left: 15px">Date</td>
							<td class="value" style="padding-right: 15px"><%=schedule.getExamDate()%></td>
						</tr>
						<tr>
							<td class="key" style="padding-left: 15px">Start Time</td>
							<td class="value" style="padding-right: 15px"><%=schedule.getStartTime()%></td>
						</tr>
						<tr>
							<td class="key" style="padding-left: 15px">End Time</td>
							<td class="value" style="padding-right: 15px"><%=schedule.getEndTime()%></td>
						</tr>



						<tr>
							<td class="key" style="padding-left: 15px">Edit</td>
							<td>
								<button class="btn btn-primary" disabled>Update</button> <a
								href='deleteSchedule?id=<%=schedule.getSchid()%>' class="btn btn-danger">Delete</a>
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
						out.println("<tr><td colspan='2'>No schedule found.</td></tr>");
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
