<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
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
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <link rel="stylesheet" type="text/css" href="../css/login.css">
    <link rel="stylesheet" type="text/css" href="../css/exam.css">
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
    <section class="container-sm py-5">
        <div class="cardUp card" style="border: none">
            <div class="card-header" style="background-color: white;">
                <h2>Question 1</h2>
            </div>
            <div class="card-body">
                <p class="card-text">This is the question content. Replace with the actual question.</p>
                <div class="form-check mb-3">
                    <input class="form-check-input" type="radio" name="question1" id="option1"> <label class="form-check-label" for="option1"> Option 1 </label>
                </div>
                <div class="form-check mb-3">
                    <input class="form-check-input" type="radio" name="question1" id="option2"> <label class="form-check-label" for="option2"> Option 2 </label>
                </div>
                <div class="form-check mb-3">
                    <input class="form-check-input" type="radio" name="question1" id="option3"> <label class="form-check-label" for="option3"> Option 3 </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="question1" id="option4"> <label class="form-check-label" for="option4"> Option 4 </label>
                </div>
            </div>
            <div class="cardDown card-footer text-end" style="background-color: white; border-top: none">
                <button type="button" class="btn btn-primary" id="nextButton">Next</button>
            </div>
        </div>
    </section>
</main>

<div  id = "divSpan2">

<%@ include file="footer.jsp"%>

</div>

<!-- Your JavaScript code -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- <script src="js/exam-page.js"></script> -->

<script>
$(document).ready(function(){
    $(document).on("contextmenu",function(e){
        return false;
    });
});

$(document).ready(function(){
    $(document).on("copy paste",function(e){
        e.preventDefault();
    });
});


</script>


</body>
</html>
