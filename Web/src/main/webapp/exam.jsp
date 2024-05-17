<%@ include file="common-resources.jsp" %>
<%@ include file="userSession.jsp" %>

<%
// Retrieve parameters from URL
String examId = request.getParameter("examId");
String scheduleId = request.getParameter("scheduleId");
// Use examId and scheduleId to fetch data and display exam
%>

<%
String ExamName = request.getParameter("ename") != null ? request.getParameter("ename") : "Default Exam";
String ScheduleDate = request.getParameter("date") != null ? request.getParameter("date") : "Default Date";
String SubjectName = request.getParameter("subname") != null ? request.getParameter("subname") : "Default Subject";
String SelectedTime = request.getParameter("time") != null ? request.getParameter("time") : "Default Time";
%>

<%
ExamService examService = new ExamServiceImpl();
List<String[]> results = examService.getAllQuestion(SubjectName);
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Exam</title>
<link rel="stylesheet" type="text/css" href="css/Exam.css">
<link rel="stylesheet" type="text/css" href="css/CustomColor.css">
</head>

<body>

	<!-- Modal -->
	<!-- <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true"> -->
	<!--     <div class="modal-dialog" style = "top: 35%;"> -->
	<!--         <div class="modal-content" style="background-color: transparent; border:none;">           -->
	<!--             <div class="modal-footer text-center" style = "border-top:none;"> -->
	<!--                 <button type="button" class="btn btn-primary" id="startExamBtn" style=" margin: 0px auto; background-color: #fff; color: #000; border: 0px; border-radius: 0px; height: 80px; width: 250px; font-size: 20px;"> -->
	<!--                 Enter Full Screen -->
	<!--                 </button> -->
	<!--             </div> -->
	<!--         </div> -->
	<!--     </div> -->
	<!-- </div> -->

	<div id="divSpan">
		<span> <%@ include file="navbar.jsp"%>
		</span>
	</div>

	<!-- Body -->

	<main>

		<section class="container-sm py-5" id="examWidth">
			<!--      <div class = "text-center"> -->
			<p style="display: none;">
				Selected Exam:
				<%=ExamName%></p>
			<p style="display: none;">
				Selected Schedule:
				<%=ScheduleDate%></p>
			<p style="display: none;">
				Selected Time:
				<%=SelectedTime%></p>
			<p style="display: none;">
				Selected Subname:
				<%=SubjectName%></p>
			<!--     </div> -->

			<%
			if (results.isEmpty()) {
			%>
			<tr>
				<td colspan="2" style="text-align: center;">No results found.</td>
			</tr>
			<%
			} else {
			%>
			<%
			int count2 = 1;
			int questionIndex = 1;
			for (String[] result : results) {
				int count = 1; // Reset count for each iteration
			%>
			<div class="cardUp card" style="border: none">

				<div class="card-header" style="background-color: white;">

					<h4><%=count2++%>)
						<%=result[1]%></h4>
				</div>
				<div class="card-body">
					<!--                 <p class="card-text">This is the question content. Replace with the actual question.</p> -->
					<div class="form-check mb-3">
						<input class="form-check-input" type="radio"
							name="question<%=questionIndex%>" id="option1_<%=questionIndex%>"
							value="1"> <label class="form-check-label"
							for="option1_<%=questionIndex%>"><%=count++%>) <%=result[2]%>
						</label>
					</div>
					<div class="form-check mb-3">
						<input class="form-check-input" type="radio"
							name="question<%=questionIndex%>" id="option2_<%=questionIndex%>"
							value="2"> <label class="form-check-label"
							for="option2_<%=questionIndex%>"><%=count++%>) <%=result[3]%>
						</label>
					</div>
					<div class="form-check mb-3">
						<input class="form-check-input" type="radio"
							name="question<%=questionIndex%>" id="option3_<%=questionIndex%>"
							value="3"> <label class="form-check-label"
							for="option3_<%=questionIndex%>"> <%=count++%>) <%=result[4]%>
						</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio"
							name="question<%=questionIndex%>" id="option4_<%=questionIndex%>"
							value="4"> <label class="form-check-label"
							for="option4_<%=questionIndex%>"><%=count++%>) <%=result[5]%>
						</label>
					</div>

					<%
					// Loop through each result to create hidden inputs for correct answers
					for (int i = 0; i < results.size(); i++) {
					%>
					<input type="hidden" id="correctAnswer_<%=i + 1%>"
						value="<%=results.get(i)[6]%>">
					<%
					}
					%>

					<br>

				</div>
			</div>
			<%
			questionIndex++;
			}
			%>
			<%
			}
			%>
			<div class="cardDown card-footer text-center"
				style="background-color: white; border-top: none">
				<button type="button" class="btn btn-primary" id="submitButton"
					value="submit">Submit</button>
			</div>

		</section>

	</main>

	<div id="divSpan2">

		<%@ include file="footer.jsp"%>

	</div>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Results</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					You have attempted <span id="attemptedQuestions"></span> <span>questions.
						Are you sure you want to submit the exam?</span>
					<!--         Correct Answers: <span id="correctAnswers"></span><br> -->
					<!--         Incorrect Answers: <span id="incorrectAnswers"></span> -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Submit</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Your JavaScript code -->
	

	<!-- <script src="js/fullScreenExam.js"></script> -->
	<script src="js/examPage.js"></script>
	<%@ include file="common-resources.jsp" %>
	<script>
	console.log(scheduleId);
	</script>

</body>
</html>