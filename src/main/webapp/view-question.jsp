<%@ include file="existingSession.jsp" %>
<%@ include file="common-resources.jsp" %>


<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>View Question</title>
<link rel="stylesheet" type="text/css" href="css/viewQuestion.css">
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
				<h3 class="display-6 mt-2">Question Details</h3>


				<div class="d-flex justify-content-center mb-3">
					<div class="input-group" style="width: 400px;">
						<input type="text" class="form-control"
							placeholder="Search Question" aria-label="Search question"
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
							QuestionService questionService = new QuestionServiceImpl();
							QuestionRepository questionRepository = new QuestionRepositoryImpl();
							List<QuestionModel> listQuestion = questionService.getAllQuestion();
							if (listQuestion != null) {
								int count = 1;
								int totalQuestions = listQuestion.size();
								for (QuestionModel question : listQuestion) {
							%>
						
						<tr>
							<td class="key" style="padding: 15px">#</td>
							<td class="value" style="padding: 15px"><%=count++%></td>
						</tr>
						<tr>
							<td class="key" style="padding-left: 15px">Question</td>
							<td class="value" style="padding-right: 15px"><%=question.getName()%></td>
						</tr>
						<tr>
							<td class="key" style="padding-left: 15px">Option 1</td>
							<td class="value" style="padding-right: 15px"><%=question.getOp1()%></td>
						</tr>
						<tr>
							<td class="key" style="padding-left: 15px">Option 2</td>
							<td class="value" style="padding-right: 15px"><%=question.getOp2()%></td>
						</tr>
						<tr>
							<td class="key" style="padding-left: 15px">Option 3</td>
							<td class="value" style="padding-right: 15px"><%=question.getOp3()%></td>
						</tr>
						<tr>
							<td class="key" style="padding-left: 15px">Option 4</td>
							<td class="value" style="padding-right: 15px"><%=question.getOp4()%></td>
						</tr>
						<tr>
							<td class="key" style="padding-left: 15px">Answer</td>
							<td class="value" style="padding-right: 15px"><%=question.getAnswer()%></td>
						</tr>
						<tr>
							<td class="key" style="padding-left: 15px">Edit</td>
							<td>
								<button class="btn btn-primary" disabled>Update</button> <a
								href='deleteQuestion?id=<%=question.getId()%>' class="btn btn-danger">Delete</a>
							</td>
						</tr>
						<%
						if (count <= totalQuestions) { 
						%>
						<tr class="empty-row">
							<td colspan="2"></td>
						</tr>
						<%
						} 
						}  
						} else {
						out.println("<tr><td colspan='2'>No questions found.</td></tr>");
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
