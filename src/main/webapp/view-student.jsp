<%@ include file="existingSession.jsp"%>
<%@ include file="commonResources.jsp"%>


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
<link rel="stylesheet" type="text/css" href="css/customColor.css">

<style>
@media ( max-width : 992px) {
	.marginBottom {
		margin-bottom: 50px;
	}
}
</style>
</head>
<body>

	<div class="d-flex">

		<div class="sidebar">
			<%@ include file="sidebar.jsp"%>
		</div>

		<!-- Main Content Area -->
		<div class="flex-grow-1 view-padding text-center marginBottom">
		<h1 class="display-6 mt-3">QuizConnect</h1>
			<h3 class="fw-light h3 mt-2">Student Details</h3>

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
						<option value="Unselected" id = "Unselected">No Subject Assigned</option>
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
	</div>


	<div class="bottom-navbar">
		<%@ include file="navbar-bottom.jsp"%>
	</div>
	
<!-- 	<script src="js/fetchStudentsByCourse.js"></script> -->
<script>
function fetchStudentsByCourse() {
    var courseId = document.getElementById('courseSelect').value;

    if (courseId === "Unselected") {
        // If "Not Having Subjects" is selected, fetch students without subjects
        var xhr = new XMLHttpRequest();
        xhr.open('GET', 'fetchStudentsWithoutSubject.jsp', true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                document.getElementById('studentTableBody').innerHTML = xhr.responseText;
            }
        };
        xhr.send();
    } else {
        // Fetch students by selected course
        var xhr = new XMLHttpRequest();
        xhr.open('GET', 'fetchStudentsByCourse.jsp?courseId=' + courseId, true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                document.getElementById('studentTableBody').innerHTML = xhr.responseText;
            }
        };
        xhr.send();
    }
}

document.addEventListener('DOMContentLoaded', function() {
    fetchStudentsByCourse();
});
</script>
		
</body>
</html>
