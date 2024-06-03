<%@ include file="existingSession.jsp" %>
<%@ include file="commonResources.jsp" %>


<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>View Question</title>
<link rel="stylesheet" type="text/css" href="css/viewQuestion.css">
<link rel="stylesheet" type="text/css" href="css/customColor.css">
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
				
				<div class = "d-flex justify-content-center">
				<div class="input-group" style="width: 400px;">
					<select id="courseSelect" class="form-select mb-4"
						aria-label="select" onchange="fetchStudentsByCourse()">
						 <option value="" selected disabled>Select a subject</option>
						<%
						StudentService fetchDataObj = new StudentServiceImpl(); 
						List<String[]> courseData = fetchDataObj.fetchCourses(); 
						for (String[] course : courseData) {
						%>
						<option value="<%=course[0]%>"><%=course[1]%></option>
						<%
						}
						%>
					</select>
				</div>
			</div>


				<div id="studentTableBody">
			</div>
			
			</div>
			<div></div>
		</div>
	</div>
	<div class="bottom-navbar">
		<%@ include file="navbar-bottom.jsp"%>
	</div>
	<script>
	function fetchStudentsByCourse() {
		var courseId = document.getElementById('courseSelect').value;
		// Check if any course is selected
	    if (courseId === "") {
	        document.getElementById('studentTableBody').innerHTML = 'No subject selected.';
	        return;
	    }

		var xhr = new XMLHttpRequest();
		xhr.open('GET', 'fetchQuestionByCourse.jsp?courseId=' + courseId,
				true);
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				document.getElementById('studentTableBody').innerHTML = xhr.responseText;
			}
		};
		xhr.send();
	}

	document.addEventListener('DOMContentLoaded', function() {
		fetchStudentsByCourse();
	});
	</script>
</body>
</html>
