<%@ include file="common-resources.jsp" %>
<%@ include file="userSession.jsp" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.util.*" %>

<%
try {
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

<%
	
    StudentService studentRepository = new StudentServiceImpl();
	System.out.println(username);
	System.out.println(SubjectName);
    boolean isEnrolled = studentRepository.isStudentEnrolledInSubject(username.trim(), SubjectName.trim().toLowerCase());
    System.out.println(isEnrolled);

    if (!isEnrolled) {
        request.getRequestDispatcher("select-subject.jsp").forward(request, response);
    } else {
%> 

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Exam</title>
<link rel="stylesheet" type="text/css" href="css/Exam.css">
<link rel="stylesheet" type="text/css" href="css/CustomColor.css">

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

</head>

<body>

<div id="divSpan">
    <span> <%@ include file="navbar.jsp"%> </span>
</div>
<span class="text-center pt-3 lead" style="font-size:19px;">Time Left: <span id="timeLeft"></span></span>
<main>
    <section class="container-sm py-3" id="examWidth">
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
            String NoExamMessage = "No question or subject available"; // Set the message
            response.sendRedirect("attempt-exam.jsp?NoExamMessage=" + URLEncoder.encode(NoExamMessage, "UTF-8")); // Redirect with message
        %>
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
<%--                             <br><span class="text-secondary opacity-30"><%=username%></span><br> --%>
                        </label>
                    </div>
                    <div class="form-check mb-3">
                        <input class="form-check-input" type="radio"
                            name="question<%=questionIndex%>" id="option2_<%=questionIndex%>"
                            value="2"> <label class="form-check-label"
                            for="option2_<%=questionIndex%>"><%=count++%>) <%=result[3]%>
<%--                             <br><span class="text-secondary opacity-30"><%=username%></span><br> --%>
                        </label>
                    </div>
                    <div class="form-check mb-3">
                        <input class="form-check-input" type="radio"
                            name="question<%=questionIndex%>" id="option3_<%=questionIndex%>"
                            value="3"> <label class="form-check-label"
                            for="option3_<%=questionIndex%>"> <%=count++%>) <%=result[4]%>
<%--                             <br><span class="text-secondary opacity-30"><%=username%></span><br> --%>
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio"
                            name="question<%=questionIndex%>" id="option4_<%=questionIndex%>"
                            value="4"> <label class="form-check-label"
                            for="option4_<%=questionIndex%>"><%=count++%>) <%=result[5]%>
<%--                             <br><span class="text-secondary opacity-30"><%=username%></span><br> --%>
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

<script src="js/SubmitExam.js"></script>
<script src="js/CopyPaste.js"></script>
<script>
$(document).ready(function() {
    var correctCounter = 0;
    var prevSelectedOptions = {};
    var prevSelectedCorrect = {};
    var questionCount = config.questionCount;
    var marksPerQuestion = config.marksPerQuestion;
    var passingMarks = config.passingMarks;

    var scheduleId = "<%= scheduleId %>";
    var username = "<%= username %>";
    var storageKey = 'selectedOptions_' + scheduleId + '_' + username;

    // Load previously selected options from local storage
    var storedOptions = localStorage.getItem(storageKey);
    if (storedOptions) {
        storedOptions = JSON.parse(storedOptions);
        $.each(storedOptions, function(questionIndex, selectedOption) {
            $("input[name='question" + questionIndex + "'][value='" + selectedOption + "']").prop('checked', true);
        });
    }

    $("input[type='radio']").click(function() {
        var selectedOption = $(this).val();
        var questionIndex = $(this).attr("name").replace("question", "");
        var prevSelectedOption = prevSelectedOptions[questionIndex];
        var prevSelectedIsCorrect = prevSelectedCorrect[questionIndex];
        var correctAnswer = $("#correctAnswer_" + questionIndex).val();

        if (selectedOption === correctAnswer && (!prevSelectedOption || !prevSelectedIsCorrect)) {
            correctCounter++;
        } else if (selectedOption !== correctAnswer && (prevSelectedOption && prevSelectedIsCorrect)) {
            correctCounter--;
        }

        prevSelectedOptions[questionIndex] = selectedOption;
        prevSelectedCorrect[questionIndex] = (selectedOption === correctAnswer);

        $("#correctAnswerSpan").text("Correct Answer: " + correctAnswer);
        $("#correctCount").text("Correct Answers: " + correctCounter);
        var percentage = (correctCounter / questionCount) * 100;
        console.log("Percentage:", percentage);
        $("#percentage").text(" | Percentage: " + percentage.toFixed(2) + "%");

        var marksObtained = correctCounter * marksPerQuestion;

        if (marksObtained >= passingMarks) {
            $("#passOrFail").text("Pass");
        } else {
            $("#passOrFail").text("Fail");
        }

        // Save the selected options to local storage
        var selectedOptions = {};
        $("input[type='radio']:checked").each(function() {
            var questionIndex = $(this).attr("name").replace("question", "");
            selectedOptions[questionIndex] = $(this).val();
        });
        localStorage.setItem(storageKey, JSON.stringify(selectedOptions));
    });

    $("#submitButton").click(function() {
        submitForm();
    });

    window.submitForm = function() {
        var percentageText = $("#percentage").text().split(": ")[1] || "0.00";
        var passOrFailText = $("#passOrFail").text() || "Fail";

        if (!percentageText) {
            percentageText = "0.00";
        }

        $("#hiddenPercentage").val(percentageText);
        $("#hiddenPassOrFail").val(passOrFailText);

        // Calculate percentage and pass/fail status if no option was selected
        if (correctCounter === 0) {
            var percentage = (correctCounter / questionCount) * 100;
            $("#percentage").text(" | Percentage: " + percentage.toFixed(2) + "%");

            if (correctCounter * marksPerQuestion >= passingMarks) {
                $("#passOrFail").text("Pass");
            } else {
                $("#passOrFail").text("Fail");
            }
        }

        // Clear the selected options from local storage
        localStorage.removeItem(storageKey);

        $("#examForm").submit();
    }

    function showQuestion(index) {
        // Hide all questions
        var questions = document.getElementsByClassName("question-container");
        for (var i = 0; i < questions.length; i++) {
            questions[i].style.display = "none";
        }
        // Show the selected question
        document.getElementById("question" + index).style.display = "block";
    }

    // Countdown Timer Script
    var selectedTime = "<%= SelectedTime %>"; // Example format: "22:00 - 02:00"
    var timeParts = selectedTime.split(' - ');
    var startTimeParts = timeParts[0].split(':');
    var endTimeParts = timeParts[1].split(':');

    // Convert start time to minutes
    var startHours = parseInt(startTimeParts[0]);
    var startMinutes = parseInt(startTimeParts[1]);
    var startTimeInMinutes = startHours * 60 + startMinutes;

    // Convert end time to minutes
    var endHours = parseInt(endTimeParts[0]);
    var endMinutes = parseInt(endTimeParts[1]);
    var endTimeInMinutes = endHours * 60 + endMinutes;

    // Adjust for end time on the next day if needed
    if (endTimeInMinutes <= startTimeInMinutes) {
        endTimeInMinutes += 24 * 60; // Add 24 hours in minutes
    }

    // Calculate the exam duration in minutes
    var examDurationInMinutes = endTimeInMinutes - startTimeInMinutes;

    var endTimeStorageKey = 'endTime_' + scheduleId + '_' + username;

    function displayRemainingTime() {
        var storedEndTime = localStorage.getItem(endTimeStorageKey);

        if (storedEndTime === null) {
            // Save the end time in localStorage if not already stored
            var currentTime = new Date().getTime();
            var endTime = currentTime + examDurationInMinutes * 60 * 1000;
            localStorage.setItem(endTimeStorageKey, endTime);
            storedEndTime = endTime;
        } else {
            storedEndTime = parseInt(storedEndTime);
        }

        var currentTime = new Date().getTime();
        var remainingTimeInMilliseconds = storedEndTime - currentTime;
        var remainingTimeInMinutes = Math.ceil(remainingTimeInMilliseconds / 60000); // Use Math.ceil to ensure we don't show 0 minutes

        var hours = Math.floor(remainingTimeInMinutes / 60);
        var minutes = remainingTimeInMinutes % 60;

        if (remainingTimeInMilliseconds <= 0) {
            document.getElementById("timeLeft").textContent = "Time's up!";
            submitForm(); // Automatically submit the form if needed
            // Clear localStorage
            localStorage.removeItem(endTimeStorageKey);
        } else {
            if (hours > 0) {
                document.getElementById("timeLeft").textContent = hours + " hours, " + minutes + " minutes";
            } else {
                document.getElementById("timeLeft").textContent = minutes + " minutes";
            }

            // Update remaining time every minute
            setTimeout(displayRemainingTime, 60000);
        }
    }

    // Initial call to display the remaining time immediately
    displayRemainingTime();

    // Disable the browser's back button
    history.pushState(null, null, document.URL);
    window.addEventListener('popstate', function () {
        history.pushState(null, null, document.URL);
    });
});


</script>

<script>
// Disable the browser's back button
window.onload = function () {
    history.pushState(null, null, document.URL);
    window.addEventListener('popstate', function () {
        history.pushState(null, null, document.URL);
    });
};
</script>
<%
    }
%>

<% 
} catch (Exception e) {
    response.sendRedirect("attempt-exam.jsp?error=" + URLEncoder.encode(e.getMessage(), "UTF-8"));
} 
%>

</body>
</html>
