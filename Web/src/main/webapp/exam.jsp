<%@ include file="common-resources.jsp" %>
<%@ include file="userSession.jsp" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.util.*" %>

<%
String examId = request.getParameter("examId");
String scheduleId = request.getParameter("scheduleId");

String ExamName = request.getParameter("ename") != null ? request.getParameter("ename") : "Default Exam";
String ScheduleDate = request.getParameter("date") != null ? request.getParameter("date") : "Default Date";
String SubjectName = request.getParameter("subname") != null ? request.getParameter("subname") : "Default Subject";
String SelectedTime = request.getParameter("time") != null ? request.getParameter("time") : "Default Time";

ExamService examService = new ExamServiceImpl();
List<String[]> results = examService.getAllQuestion(SubjectName);

int questionCount = results.size();
int[] marks = examService.getMarksByExamId(Integer.parseInt(examId));
int totalMarks = marks[0];
int passingMarks = marks[1];
double marksPerQuestion = (double) totalMarks / questionCount;

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

<div id="divSpan">
    <span> <%@ include file="navbar.jsp"%> </span>
</div>

<main>
    <section class="container-sm py-5" id="examWidth">
<%--         <span>Schedule ID <%=scheduleId %> | </span> --%>
<%--         <span>Username <%=username %> | </span> --%>
<%--         <span>Exam ID <%=examId %> | </span><br> --%>
<%--         <span>Total Marks: <%= totalMarks %> | </span> --%>
<%--         <span>Passing Marks: <%= passingMarks %> | </span><br> --%>
<%--         <span>Questions <%=questionCount%> | </span> --%>
<%--         <span>Marks Per Question <%=marksPerQuestion %></span><br> --%>
        <span id="correctAnswerSpan" style="display: none;"></span>
        <span id="correctCount" style="display: none;"></span>
        <span id="percentage" style="display: none;"></span>
        <span id="passOrFail" style="display: none;"></span>

        <p style="display: none;">
            Selected Exam: <%=ExamName%>
        </p>
        <p style="display: none;">
            Selected Schedule: <%=ScheduleDate%>
        </p>
        <p style="display: none;">
            Selected Time: <%=SelectedTime%>
        </p>
        <p style="display: none;">
            Selected Subname: <%=SubjectName%>
        </p>

        <%
        if (results.isEmpty()) {
        	String NoExamMessage = ""; // Message to be passed
        	NoExamMessage = "No question or subject available"; // Set the message
            response.sendRedirect("attempt-exam.jsp?NoExamMessage=" + URLEncoder.encode(NoExamMessage, "UTF-8")); // Redirect with message
        %>
<!--         <tr> -->
<!--             <td colspan="2" style="text-align: center;">No results found.</td> -->
<!--         </tr> -->
	
        <%
        } else {
            int count2 = 1;
            int questionIndex = 1;
            for (String[] result : results) {
                int count = 1; // Reset count for each iteration
        %>
        <div class="question-container" id="question<%=questionIndex%>" style="display: <%= questionIndex == 1 ? "block" : "none" %>;">
        
        <div class="cardUp card" style="border: none">
            <div class="card-header" style="background-color: white;">
                <h4><%=count2++%>) <%=result[1]%></h4>
            </div>
            <div class="card-body">
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
           <!-- Next and previous buttons -->
       <!-- Next and previous buttons -->
<div class="text-center">
    <% if (questionIndex > 1) { %>
        <button type="button" class="btn btn-primary" onclick="showQuestion(<%= questionIndex - 1 %>);">Previous</button>
    <% } %>
    <% if (questionIndex < questionCount) { %>
        <button type="button" class="btn btn-primary" onclick="showQuestion(<%= questionIndex + 1 %>);">Next</button>
    <% } %>
</div>
        </div>
        <%
            questionIndex++;
            }
        }
        %>
        <div class="cardDown card-footer text-center mt-4" style="background-color: white; border-top: none">
            <form id="examForm" method="post" action="submitExam">
                <input type="hidden" name="scheduleId" value="<%=scheduleId %>">
                <input type="hidden" name="username" value="<%=username %>">
                <input type="hidden" name="percentage" id="hiddenPercentage" value="">
                <input type="hidden" name="passOrFail" id="hiddenPassOrFail" value="">
                <button type="button" class="btn btn-secondary" id="submitButton" value="submit">Submit</button>
            </form>
        </div>
    </section>
</main>

<div id="divSpan2">
    <%@ include file="footer.jsp"%>
</div>

	<script type="text/javascript">
        var config = {
            questionCount: <%= questionCount %>,
            marksPerQuestion: <%= marksPerQuestion %>,
            passingMarks: <%= passingMarks %>
        };
    </script>
    
<!-- <script src="js/examPage.js"></script> -->
<script src="js/CopyPaste.js"></script>
<script src="js/SubmitExam.js"></script>
<script>
//Clear parameters from URL and reload the page
// window.history.replaceState({}, document.title, window.location.pathname);
</script>

<script>
    function showQuestion(index) {
        // Hide all questions
        var questions = document.getElementsByClassName("question-container");
        for (var i = 0; i < questions.length; i++) {
            questions[i].style.display = "none";
        }
        // Show the selected question
        document.getElementById("question" + index).style.display = "block";
    }
</script>


</body>
</html>
