<%-- <%@ include file="existingSession.jsp" %> --%>
<%@ include file="commonResources.jsp" %>


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
<link rel="stylesheet" type="text/css" href="css/customColor.css">
</head>
<body>

<div class="">
    <div class="d-flex">
        <div class="sidebar">
            <%@ include file="sidebar.jsp"%>
        </div>
        <!-- Main Content Area -->
        <div class="flex-grow-1 view-padding text-center marginBottom">
        <h1 class="display-6 mt-3">QuizConnect</h1>
            <h3 class="fw-light h3 mt-2">Student Result</h3>

            <div class="d-flex justify-content-center mb-3">
                <div class="input-group" style="width: 400px;">
                    <input type="text" class="form-control" id="searchInput"
                        placeholder="Search Result" aria-label="Search result"
                        aria-describedby="button-addon2"
                        onkeyup="searchStudentsResult()">
                </div>
            </div>
            
            <div class="mb-3 fw-light">
                <span>Please note: In order to delete a student's result, you must first delete the student record.</span>
            </div>
    
            
            <div class="d-flex justify-content-center">
                <div class="input-group" style="width: 400px;">
                    <select id="courseSelect" class="form-select mb-4" aria-label="select" onchange="fetchStudentsByCourse()">
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
            <div id="searchResults"></div>
            <div id="studentTableBody"></div>
        </div>
    </div>
    <div class="bottom-navbar">
        <%@ include file="navbar-bottom.jsp"%>
    </div>
    
    <script>
function fetchStudentsByCourse() {
    // Clear search input
    document.getElementById('searchInput').value = '';
    
    // Clear search results
    document.getElementById('searchResults').innerHTML = '';

    var courseSelect = document.getElementById('courseSelect');
    var courseId = courseSelect.value;

    // Check if any course is selected
    if (courseId === "") {
        document.getElementById('studentTableBody').innerHTML = 'No subject selected.';
        return;
    }

    var xhr = new XMLHttpRequest();
    xhr.open('GET', 'fetchResultByCourse.jsp?courseId=' + courseId, true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4) {
            document.getElementById('studentTableBody').innerHTML = xhr.responseText;
            
            // Always trigger search after receiving response
            searchStudentsResult();
        }
    };
    xhr.send();
}

document.addEventListener('DOMContentLoaded', function() {
    fetchStudentsByCourse();
});
</script>

    
    <script>
    function searchStudentsResult() {
        var userInput = document.getElementById("searchInput").value;
        var selectedOption = document.getElementById("courseSelect").options[document.getElementById("courseSelect").selectedIndex].text; // Get the text of the selected option
        
        // Check if the search input is empty
        if (userInput.trim() === '') {
            // Clear the search results and show the table
            document.getElementById("searchResults").innerHTML = '';
            document.getElementById("resultsTable").style.display = 'table';
            return;
        }
        
        // Hide the table
        document.getElementById("resultsTable").style.display = 'none';
        
        // Make AJAX call
        var xhr = new XMLHttpRequest();
        var url = "SearchStudentResult.jsp?userInput=" + encodeURIComponent(userInput) + "&courseSelect=" + encodeURIComponent(selectedOption);
        
        xhr.open("GET", url, true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                // Update DOM with response
                document.getElementById("searchResults").innerHTML = xhr.responseText;
            }
        };
        xhr.send();
    }
</script>


</body>
</html>