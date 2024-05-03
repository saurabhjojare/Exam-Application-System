<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add Question</title>
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
		<section class="py-3 text-center pb-6">
			<div class="loginWidth pb-4">
				<div class="container-sm">
					<h1 class="display-6">Add Question</h1>
					<p class="lead">Please enter the details for the new question.</p>
					<form name='form' action='addquestion' method='POST'>
						<div class="mb-3">
							<label for="questionName" class="form-label">Question
								Name</label> <input type="text" class="form-control" id="questionName"
					name="questionName"	placeholder="Enter question text">
						</div>
						<div class="mb-3">
							<label for="option1" class="form-label">Option 1</label> <input
								type="text" class="form-control" id="option1" name="option1"
								placeholder="Enter option 1 text">
						</div>
						<div class="mb-3">
							<label for="option2" class="form-label">Option 2</label> <input
								type="text" class="form-control" id="option2" name="option2"
								placeholder="Enter option 2 text">
						</div>
						<div class="mb-3">
							<label for="option3" class="form-label">Option 3</label> <input
								type="text" class="form-control" id="option3" name="option3"
								placeholder="Enter option 3 text">
						</div>
						<div class="mb-3">
							<label for="option4" class="form-label">Option 4</label> <input
								type="text" class="form-control" id="option4" name="option4"
								placeholder="Enter option 4 text">
						</div>
						<div class="mb-3">
							<label for="answer" class="form-label">Enter Option As
								Answer</label> <select id="answer" class="form-control" name="answer">
								<option value="1">Option 1</option>
								<option value="2">Option 2</option>
								<option value="3">Option 3</option>
								<option value="4">Option 4</option>
							</select>
						</div>
						<div class="mb-3">
							<label for="subjectName" class="form-label">Subject Name</label>
							<select id="subjectName" class="form-control" name="subjectName">
								<option value="">Select Subject</option>
							</select>
						</div>
						<button type="submit" class="btn btn-primary">Add
							Question</button>
						<!-- Button for importing bulk questions -->
						<input type="file" id="fileInput" accept=".csv"
							style="display: none;">
						<button type="button" class="btn btn-secondary"
							id="importQuestionsBtn">Import Bulk Questions</button>
					</form>
				</div>
			</div>
		</section>
	</main>
	</div>
	</div>




	<script>
		// Function to handle importing CSV file
		function handleFileSelect(event) {
			const file = event.target.files[0];
			const reader = new FileReader();

			reader.onload = function(e) {
				const csv = e.target.result;
				// Process the CSV data here, for example, you can parse it and extract questions
				console.log(csv);
			};

			reader.readAsText(file);
		}

		// Add event listener to the import button
		document.getElementById('importQuestionsBtn').addEventListener('click',
				function() {
					// Trigger file input click
					document.getElementById('fileInput').click();
				});

		// Add event listener to file input
		document.getElementById('fileInput').addEventListener('change',
				handleFileSelect);
	</script>



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