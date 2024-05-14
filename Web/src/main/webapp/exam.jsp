<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.util.List"%>
<%@ page import="com.exam.repository.SubjectRepository"%>
<%@ page import="com.exam.repository.SubjectRepositoryImpl"%>
<%@ page import="com.exam.service.SubjectService"%>
<%@ page import="com.exam.service.SubjectServiceImpl"%>
<%@ page import="com.exam.model.ScheduleModel"%>
<%@ page import="com.exam.repository.ExamRepositoryImpl"%>
<%@ page import="com.exam.repository.ExamRepository"%>
<%@ page import="com.exam.service.ExamService"%>
<%@ page import="com.exam.service.ExamServiceImpl"%>

<%
    String ExamName = request.getParameter("ename");
    String ScheduleDate = request.getParameter("date");
    String SubjectName = request.getParameter("subname");
    String SelectedTime = request.getParameter("time");
%>

<%
ExamService examService = new ExamServiceImpl();
List<String[]> results = examService.getAllQuestion(SubjectName);
%>

	
	<%
HttpSession existingSession = request.getSession(false);
if (existingSession == null || existingSession.getAttribute("username") == null) {
	response.sendRedirect("login.jsp");
	// Optional: You can use <jsp:forward> here if you want to ensure that the rest of the JSP page isn't processed.
	// <jsp:forward page="login.jsp" />
}
String username = (String) existingSession.getAttribute("username");
%>




<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Exam</title>
    <link rel="icon" href="../img/favicon.png" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <link rel="stylesheet" type="text/css" href="css/exam.css">
</head>

<style>
body {
    -webkit-touch-callout: none; /* iOS Safari */
    -webkit-user-select: none; /* Safari */
    -khtml-user-select: none; /* Konqueror HTML */
    -moz-user-select: none; /* Firefox */
    -ms-user-select: none; /* Internet Explorer/Edge */
    user-select: none; /* Non-prefixed version, currently supported by Chrome and Opera */
}


.overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent black */
    pointer-events: none; /* Allows interaction with elements behind the overlay */
}

@media (min-width: 1000px) { 
#examWidth{
    margin: 0px auto;
    width: 60%;
}

 }



/* #divSpan { */
/* display: none; */
/* } */

/* #divSpan2 { */
/* display: none; */
/* } */

/* main { */
/* display: none; */
/* } */
</style>
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

<div id = "divSpan">
<span>
<%@ include file="navbar.jsp"%>
</span>
</div>

<!-- Body -->

<main>
	
    <section class="container-sm py-5" id="examWidth">
<!--      <div class = "text-center"> -->
        <p style="display:none;">Selected Exam: <%= ExamName %></p>
        <p style="display:none;">Selected Schedule: <%= ScheduleDate %></p>
         <p style="display:none;">Selected Time: <%= SelectedTime %></p>
        <p style="display:none;">Selected Subname: <%= SubjectName %></p>
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
           
                    <h4><%=count2++%>) <%=result[1]%></h4>
            </div>
            <div class="card-body">
<!--                 <p class="card-text">This is the question content. Replace with the actual question.</p> -->
                <div class="form-check mb-3">
                    <input class="form-check-input" type="radio" name="question<%=questionIndex%>" id="option1_<%=questionIndex%>"> <label class="form-check-label" for="option1_<%=questionIndex%>"><%=count++%>) <%=result[2]%> </label>
                </div>
                <div class="form-check mb-3">
                    <input class="form-check-input" type="radio" name="question<%=questionIndex%>" id="option2_<%=questionIndex%>"> <label class="form-check-label" for="option2_<%=questionIndex%>"><%=count++%>) <%=result[3]%> </label>
                </div>
                <div class="form-check mb-3">
                    <input class="form-check-input" type="radio" name="question<%=questionIndex%>" id="option3_<%=questionIndex%>"> <label class="form-check-label" for="option3_<%=questionIndex%>"> <%=count++%>) <%=result[4]%> </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="question<%=questionIndex%>" id="option4_<%=questionIndex%>"> <label class="form-check-label" for="option4_<%=questionIndex%>"><%=count++%>) <%=result[5]%> </label>
                </div>
     
                <%
// Loop through each result to create hidden inputs for correct answers
for (int i = 0; i < results.size(); i++) {
%>
<input type="hidden" id="correctAnswer_<%=i+1%>" value="<%=results.get(i)[6]%>">
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
                <div class="cardDown card-footer text-center" style="background-color: white; border-top: none">
                <button type="button" class="btn btn-primary" id="submitButton" value ="submit">Submit</button>
            </div>
    </section>
   
</main>



<div  id = "divSpan2">

<%@ include file="footer.jsp"%>

</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Results</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        You have attempted <span id="attemptedQuestions"></span>
        <span>questions. Are you sure you want to submit the exam?</span>
<!--         Correct Answers: <span id="correctAnswers"></span><br> -->
<!--         Incorrect Answers: <span id="incorrectAnswers"></span> -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- Your JavaScript code -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- <script src="js/exam-page.js"></script> -->

<script>
// $(document).ready(function(){
//     $(document).on("contextmenu",function(e){
//         return false;
//     });
// });

$(document).ready(function(){
    $(document).on("copy paste",function(e){
        e.preventDefault();
    });
});


</script>

<script>
$(document).ready(function(){
    // Initialize match count
    var matchCount = 0;

    // Listen for form submission
    $("form").submit(function(event) {
        event.preventDefault(); // Prevent default form submission
        
        // Loop through each question
        $("div.card").each(function(index) {
            var questionIndex = index + 1;
            var selectedAnswer = $("input[name='question" + questionIndex + "']:checked").val(); // Get the selected answer
            var correctAnswer = $("#answer").val(); // Get the correct answer

            // Check if selected answer matches the correct answer
            if (selectedAnswer === correctAnswer) {
                matchCount++; // Increment match count
            }
        });

        // Print the number of matches
        alert("Number of correct answers: " + matchCount);
    });
});
</script>

<script>
$(document).ready(function(){
    // Initialize arrays and counters
    var answeredQuestions = [];
    var correctCounter = 0;
    var incorrectCounter = 0;

    // Listen for click events on question options
    $("input[type='radio']").click(function() {
        var selectedOption = $(this).attr("id"); // Get the ID of the selected option
        var questionIndex = selectedOption.split("_")[1]; // Extract the question index from the ID
        var optionIndex = selectedOption.split("_")[0].substr(-1); // Extract the option index from the ID

        // Check if the current question has already been answered
        if (!answeredQuestions.includes(questionIndex)) {
            answeredQuestions.push(questionIndex); // Add the question index to the answered questions array

            var correctAnswer = $("#correctAnswer_" + questionIndex).val(); // Get the correct answer for the selected question
            var count = answeredQuestions.length; // Get the count of answered questions

            console.log("Question No : " + questionIndex + " \nSelected Option : " + optionIndex + " \nAttempted Questions : " + count + "\nCorrect Answer : " + correctAnswer); // Display the count for the specific question and option, along with the correct answer

            if (optionIndex === correctAnswer) {
                correctCounter++; // Increment correct counter
                console.log("Correct Answers : " + correctCounter);
            } else {
                incorrectCounter++; // Increment incorrect counter
                console.log("Incorrect Answers : " + incorrectCounter);
            }
        }
    });
    

    $("#submitButton").click(function() {
        $("#attemptedQuestions").text(answeredQuestions.length);
        $("#correctAnswers").text(correctCounter);
        $("#incorrectAnswers").text(incorrectCounter);
        $("#exampleModal").modal("show");
    });
});
</script>


</body>
</html>
