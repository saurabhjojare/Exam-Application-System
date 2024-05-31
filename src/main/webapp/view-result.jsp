<%-- <%@ include file="existingSession.jsp" %> --%>
<%@ include file="common-resources.jsp" %>


<%
ExamService examService = new ExamServiceImpl();
%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>View Result</title>
<link rel="stylesheet" type="text/css" href="css/viewResult.css">
<link rel="stylesheet" type="text/css" href="css/CustomColor.css">
</head>
<body>

<div class="">
    <div class="d-flex">
        <div class="sidebar">
            <%@ include file="sidebar.jsp"%>
        </div>
        <!-- Main Content Area -->
        <div class="flex-grow-1 view-padding text-center marginBottom">
            <h3 class="display-6 mt-2">Result Details</h3>

            <div class="d-flex justify-content-center mb-3">
                <div class="input-group" style="width: 400px;">
                    <input type="text" class="form-control" id="searchInput"
                        placeholder="Search Result" aria-label="Search result"
                        aria-describedby="button-addon2"
                        onkeyup="searchByName(this.value)" disabled>
                </div>
            </div>
            
            <div class="mb-3 fw-light">
                <span>Please note: In order to delete a student's result, you must first delete the student record.</span>
            </div>
            
            <div class="d-flex justify-content-center">
                <div class="input-group" style="width: 400px;">
                    <select id="courseSelect" class="form-select mb-4" aria-label="select" onchange="fetchStudentsByCourse()">
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
            
            <div id="studentTableBody"></div>
        </div>
    </div>
    <div class="bottom-navbar">
        <%@ include file="navbar-bottom.jsp"%>
    </div>
    
    <script>
        function fetchStudentsByCourse() {
            var courseId = document.getElementById('courseSelect').value;

            var xhr = new XMLHttpRequest();
            xhr.open('GET', 'fetchResultByCourse.jsp?courseId=' + courseId, true);
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