<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>

<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Attempt Exam</title>
<link rel="icon" href="../img/favicon.png" type="image/x-icon">
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
    crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/login.css">
<link rel="stylesheet" type="text/css" href="css/exam.css">
</head>
<body>

    <%@ include file="navbar.jsp"%>

    <!-- Body -->

    <main>
        <section class="py-5 text-center">
            <div class="container-sm">
            <%
            HttpSession existingSession = request.getSession(false);
            if (existingSession != null) {
            %>
<!--             Session ID: -->
<%--             <%= existingSession.getId() %> --%>
            <%
            } else {
                response.sendRedirect("login.jsp");
                return; // End the execution of JSP
            }

            String username = (String) existingSession.getAttribute("username");
            %>
            <span class="lead">Hello, <strong><%= username %></strong></span>
                <h1>Attempt Exam</h1>
                <p class="lead">Please select the exam and schedule before
                    starting.</p>

                <div class="attemptExam">
                    <div class="mb-3">
                        <label for="examSelection" class="form-label">Select Exam</label>
                        <select class="form-select" id="examSelection">
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="scheduleSelection" class="form-label">Select
                            Schedule</label> <select class="form-select" id="scheduleSelection">
                        </select>
                    </div>
                </div>
                <p>Please ensure you have a stable internet connection and a
                    quiet environment before proceeding.</p>
                <a href="exam.jsp" class="btn btn-primary" id="startExamButton"
                    data-bs-toggle="modal" data-bs-target="#confirmationModal">Start
                    Exam</a>
            </div>

            <div class="modal fade" id="confirmationModal" tabindex="-1"
                aria-labelledby="confirmationModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="confirmationModalLabel">Confirm
                                Exam Attempt</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <p>Are you sure you want to start the selected exam?</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary"
                                data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary"
                                id="confirmStartExam">Start Exam</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <%@ include file="footer.jsp"%>




	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
		integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
		crossorigin="anonymous"></script>
</body>
</html>