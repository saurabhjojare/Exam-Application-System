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
<body>

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="staticBackdropLabel">Enter Full Screen</h1>
             
            </div>
           
            <div class="modal-footer text-center">
                <button type="button" class="btn btn-primary" id="startExamBtn">Enter</button>
            </div>
        </div>
    </div>
</div>

<span style="display: none;">
<%@ include file="navbar.jsp"%>
</span>

<!-- Body -->
<main style="display: none;">
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


<span style="display: none;">
<%@ include file="footer.jsp"%>
</span>

<!-- Your JavaScript code -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Show modal on page load
    $(document).ready(function() {
        $('#staticBackdrop').modal('show');
    });

    // Event listener for the "Understood" button in the modal
    document.getElementById("startExamBtn").addEventListener("click", function() {
        // Hide modal
        $('#staticBackdrop').modal('hide');
        // Show main content
        document.querySelector('main').style.display = 'block';
        document.querySelector('span').style.display = 'block';
    });
</script>

<script>
    // Show modal on page load
    $(document).ready(function() {
        $('#staticBackdrop').modal('show');
    });

    // Event listener for the "Understood" button in the modal
    document.getElementById("startExamBtn").addEventListener("click", function() {
        // Hide modal
        $('#staticBackdrop').modal('hide');
        // Show main content
        document.querySelector('main').style.display = 'block';
    });

    // Enter full-screen mode
    document.getElementById("startExamBtn").addEventListener("click", function() {
        var element = document.documentElement;
        if (element.requestFullscreen) {
            element.requestFullscreen();
        } else if (element.mozRequestFullScreen) { /* Firefox */
            element.mozRequestFullScreen();
        } else if (element.webkitRequestFullscreen) { /* Chrome, Safari & Opera */
            element.webkitRequestFullscreen();
        } else if (element.msRequestFullscreen) { /* IE/Edge */
            element.msRequestFullscreen();
        }
    });

    // Listen for the fullscreenchange event
    document.addEventListener("fullscreenchange", function () {
        if (!document.fullscreenElement) {
            // Close the tab when exiting full-screen mode
            window.close();
        }
    });
</script>


</body>
</html>
