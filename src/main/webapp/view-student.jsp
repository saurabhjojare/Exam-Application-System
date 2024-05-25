<%@ include file="existingSession.jsp"%>
<%@ include file="common-resources.jsp"%>


<%
ExamService examService = new ExamServiceImpl();
List<String[]> results = examService.getAllResults();
%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>View Student</title>
<link rel="stylesheet" type="text/css" href="css/viewResult.css">
<link rel="stylesheet" type="text/css" href="css/CustomColor.css">
</head>
<body>


	<div class="d-flex">


		<div class="sidebar">
			<%@ include file="sidebar.jsp"%>
		</div>


		<!-- Main Content Area -->
		<div class="flex-grow-1 view-padding text-center marginBottom">
			<h3 class="display-6 mt-2">Student Details</h3>



			<div class="d-flex justify-content-center mb-3">
				<div class="input-group" style="width: 400px;">
					<input type="text" class="form-control" id="searchInput"
						placeholder="Search Result" aria-label="Search result"
						aria-describedby="button-addon2"
						onkeyup="searchByName(this.value)" disabled>
					<!-- <button class="btn btn-outline-secondary" type="button" id="button-addon2">Search</button> -->
				</div>
			</div>


			<div class = "d-flex justify-content-center">
				<div class="input-group" style="width: 400px;">
					<select id="courseSelect" class="form-select mb-4"
						aria-label="select" onchange="fetchStudentsByCourse()">
						<%
						StudentService fetchDataObj = new StudentServiceImpl(); // Instantiate fetchData object 
						List<String[]> courseData = fetchDataObj.fetchCourses(); // Call the fetchCourses method to retrieve course data
						for (String[] course : courseData) {
						%>
						<option value="<%=course[0]%>"><%=course[1]%></option>
						<%
						}
						%>
					</select>
				</div>
			</div>



<!-- 			<table id="studentTable" class="table"> -->
<!-- 				<tbody id="studentTableBody"> -->
<!-- 				</tbody> -->
<!-- 			</table> -->
			<div id="studentTableBody">
			</div>


		</div>
	</div>



	<div class="bottom-navbar">
		<%@ include file="navbar-bottom.jsp"%>
	</div>

	<script>
		function fetchStudentsByCourse() {
			var courseId = document.getElementById('courseSelect').value;

			var xhr = new XMLHttpRequest();
			xhr.open('GET', 'fetchStudentsByCourse.jsp?courseId=' + courseId,
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
