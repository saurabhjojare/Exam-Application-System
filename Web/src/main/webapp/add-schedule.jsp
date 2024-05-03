<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add Schedule</title>
<link rel="icon" href="../img/favicon.png" type="image/x-icon">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/login.css">

</head>
<body>


	<div class="d-flex">
	<%@ include file="sidebar.jsp"%>
	<div class="flex-grow-1 ms-2 d-flex" style = "height:100vh; overflow:auto">
	<!-- Body -->
	<main>
		<section class="py-3 text-center">
			<div class="loginWidth">
				<div class="container-sm">
					<h1 class="display-6">Create Exam Schedule</h1>
					<p class="lead">Schedule a new exam.</p>
					<form id="examScheduleForm">
						<div class="mb-3">
							<label for="examName" class="form-label">Select Exam Name</label>
							<select class="form-select" id="examName">
							</select>
						</div>
						<div class="mb-3">
							<label for="examDate" class="form-label">Exam Date</label> <input
								type="date" class="form-control" id="examDate"
								value="<?php echo date('Y-m-d'); ?>">
						</div>
						<div class="mb-3">
							<label for="startTime" class="form-label">Start Time</label> <input
								type="time" class="form-control" id="startTime" value="09:00">
						</div>
						<div class="mb-3">
							<label for="endTime" class="form-label">End Time</label> <input
								type="time" class="form-control" id="endTime" value="11:00">
						</div>
						<div class="mb-3">
							<label for="subjectName" class="form-label">Select
								Subject Name</label> <select class="form-select" id="subjectName">
							</select>
						</div>
						<button type="submit" class="btn btn-primary">Create
							Schedule</button>
					</form>
				</div>
			</div>
		</section>
	</main>
	</div>
	</div>



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