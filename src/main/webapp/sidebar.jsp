<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sidebar</title>
<link rel="stylesheet" type="text/css" href="css/Sidebar.css">

</head>
<body>
    <div class="d-flex">
        <!-- Sidebar -->
        <div class="d-flex flex-column flex-shrink-0 p-3 text-bg-dark sidebar" style="width: 280px;box-shadow: 10px 0 20px 5px rgba(0, 0, 0, 0.1);">
        <div class="sidebar-content">
            <a href="profile-page.jsp" class="d-flex align-items-center mb-md-0 me-md-auto text-white text-decoration-none">
                <svg class="bi pe-none me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
                <span class="fs-4">Dashboard</span>
            </a>
<!--             <hr style = "margin-bottom: 0px;"> -->
            <ul class="nav nav-pills flex-column mb-auto">
      
  <!-- Toggle Button -->
    <li class="nav-item mt-2">
        <button class="nav-link toggle-btn" onclick="toggleOptions('additional-options')">
            <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#toggle-icon"></use></svg>
            Admin Management
        </button>
    </li>
    <!-- Additional Options (Initially Hidden) -->
    <li class="nav-item mt-2" id="additional-options" style="display: none;">
        <a href="profile-page.jsp" class="nav-link <%=(request.getRequestURI().endsWith("profile-page.jsp")) ? "active" : "" %>" aria-current="page">
            <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#icon"></use></svg>
            Admin Profile
        </a>
    </li>
    <!-- Additional Options 1 -->
    <li class="nav-item mt-2" id="additional-options-1" style="display: none;">
        <a href="add-admin.jsp" class="nav-link <%=(request.getRequestURI().endsWith("add-admin.jsp")) ? "active" : "" %>" aria-current="page">
            <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#icon-1"></use></svg>
            Add Admin
        </a>
    </li>
    <!-- Additional Options 2 -->
    <li class="nav-item mt-2" id="additional-options-2" style="display: none;">
        <a href="view-admin.jsp" class="nav-link <%=(request.getRequestURI().endsWith("view-admin.jsp")) ? "active" : "" %>" aria-current="page">
            <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#icon-2"></use></svg>
            View Admin
        </a>
    </li>

<!--                 <hr style = "margin-top: 5px; margin-bottom: 5px;"> -->
                
                  <!-- Toggle Button -->
    <li class="nav-item mt-2">
        <button class="nav-link toggle-btn" onclick="toggleOptions2('additional-options')">
            <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#toggle-icon"></use></svg>
            Exam Management
        </button>
    </li>
    <!-- Additional Options (Initially Hidden) -->
    <li class="nav-item mt-2" id="additional-options2" style="display: none;">
        <a href="add-exam.jsp" class="nav-link <%=(request.getRequestURI().endsWith("add-exam.jsp")) ? "active" : "" %>" aria-current="page">
            <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#icon"></use></svg>
            Add Exam
        </a>
    </li>
    <!-- Additional Options 1 -->
    <li class="nav-item mt-2" id="additional-options2-1" style="display: none;">
        <a href="view-exam.jsp" class="nav-link <%=(request.getRequestURI().endsWith("view-exam.jsp")) ? "active" : "" %>" aria-current="page">
            <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#icon-1"></use></svg>
            View Exam
        </a>
    </li>
  
 <!-- Toggle Button -->
    <li class="nav-item mt-2">
        <button class="nav-link toggle-btn" onclick="toggleOptions3('additional-options')">
            <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#toggle-icon"></use></svg>
            Question Management
        </button>
    </li>
    <!-- Additional Options (Initially Hidden) -->
    <li class="nav-item mt-2" id="additional-options3" style="display: none;">
        <a href="add-question.jsp" class="nav-link <%=(request.getRequestURI().endsWith("add-question.jsp")) ? "active" : "" %>" aria-current="page">
            <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#icon"></use></svg>
            Add Question
        </a>
    </li>
    <!-- Additional Options 1 -->
    <li class="nav-item mt-2" id="additional-options3-1" style="display: none;">
        <a href="view-question.jsp" class="nav-link <%=(request.getRequestURI().endsWith("view-question.jsp")) ? "active" : "" %>" aria-current="page">
            <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#icon-1"></use></svg>
            View Question
        </a>
    </li>


<!-- Toggle Button -->
    <li class="nav-item mt-2">
        <button class="nav-link toggle-btn" onclick="toggleOptions4('additional-options')">
            <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#toggle-icon"></use></svg>
            Schedule Management
        </button>
    </li>
    <!-- Additional Options (Initially Hidden) -->
    <li class="nav-item mt-2" id="additional-options4" style="display: none;">
        <a href="add-schedule.jsp" class="nav-link <%=(request.getRequestURI().endsWith("add-schedule.jsp")) ? "active" : "" %>" aria-current="page">
            <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#icon"></use></svg>
            Add Schedule
        </a>
    </li>
    <!-- Additional Options 1 -->
    <li class="nav-item mt-2" id="additional-options4-1" style="display: none;">
        <a href="view-schedule.jsp" class="nav-link <%=(request.getRequestURI().endsWith("view-schedule.jsp")) ? "active" : "" %>" aria-current="page">
            <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#icon-1"></use></svg>
            View Schedule
        </a>
    </li>


<!-- Toggle Button -->
    <li class="nav-item mt-2">
        <button class="nav-link toggle-btn" onclick="toggleOptions5('additional-options')">
            <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#toggle-icon"></use></svg>
            Subject Management
        </button>
    </li>
    <!-- Additional Options (Initially Hidden) -->
    <li class="nav-item mt-2" id="additional-options5" style="display: none;">
        <a href="add-subject.jsp" class="nav-link <%=(request.getRequestURI().endsWith("add-subject.jsp")) ? "active" : "" %>" aria-current="page">
            <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#icon"></use></svg>
            Add Subject
        </a>
    </li>
    <!-- Additional Options 1 -->
    <li class="nav-item mt-2" id="additional-options5-1" style="display: none;">
        <a href="view-subject.jsp" class="nav-link <%=(request.getRequestURI().endsWith("view-subject.jsp")) ? "active" : "" %>" aria-current="page">
            <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#icon-1"></use></svg>
            View Subject
        </a>
    </li>


<!-- Toggle Button -->
    <li class="nav-item mt-2">
        <button class="nav-link toggle-btn" onclick="toggleOptions6('additional-options')">
            <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#toggle-icon"></use></svg>
            Student Management
        </button>
    </li>
    <!-- Additional Options (Initially Hidden) -->
    <li class="nav-item mt-2" id="additional-options6" style="display: none;">
        <a href="view-result.jsp" class="nav-link <%=(request.getRequestURI().endsWith("view-result.jsp")) ? "active" : "" %>" aria-current="page">
            <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#icon"></use></svg>
            View Result
        </a>
    </li>
    <!-- Additional Options 1 -->
    <li class="nav-item mt-2" id="additional-options6-1" style="display: none;">
        <a href="view-student.jsp" class="nav-link <%=(request.getRequestURI().endsWith("view-student.jsp")) ? "active" : "" %>" aria-current="page">
            <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#icon-1"></use></svg>
            View Student
        </a>
    </li>

            </ul>
<!--             <hr> -->
            
<!--             <a class="dropdown-item text-center" href="adminlogout">Sign Out</a> -->
            
        </div>
        <div class ="fixed-bottom mb-4" style="width:280px"> <a class="dropdown-item text-center" href="adminlogout">Sign Out</a></div>
        </div>
          
        
        <div class="flex-grow-1 ms-2">
        </div>
    </div>
    
<script>
    function toggleOptions() {
        // Close all toggle options
        closeAllToggleOptions();

        var additionalOptions = document.getElementById("additional-options");
        var additionalOptions1 = document.getElementById("additional-options-1");
        var additionalOptions2 = document.getElementById("additional-options-2");
        var toggleButton = document.querySelector(".toggle-btn");

        if (toggleButton.classList.contains("active")) {
        	// If the toggle is already active, close it
            toggleButton.classList.remove("active");

            // If the toggle is already active, keep the options open
            additionalOptions.style.display = "block";
            additionalOptions1.style.display = "block";
            additionalOptions2.style.display = "block";
        } else {
            // If the toggle is not active, toggle the options
            if (additionalOptions.style.display === "none") {
                additionalOptions.style.display = "block";
                additionalOptions1.style.display = "block";
                additionalOptions2.style.display = "block";
            } else {
                additionalOptions.style.display = "none";
                additionalOptions1.style.display = "none";
                additionalOptions2.style.display = "none";
            }
        }
    }
    
</script>
<script>
    function toggleOptions2() { 
    	// Close all toggle options
        closeAllToggleOptions();
        var additionalOptions = document.getElementById("additional-options2");
        var additionalOptions1 = document.getElementById("additional-options2-1");
        var toggleButton = document.querySelector(".toggle-btn");
        
        if (toggleButton.classList.contains("active")) {
            // If the toggle is already active, keep the options open
            additionalOptions.style.display = "block";
            additionalOptions1.style.display = "block";
            additionalOptions2.style.display = "block";
        } else {
            // If the toggle is not active, toggle the options
            if (additionalOptions.style.display === "none") {
                additionalOptions.style.display = "block";
                additionalOptions1.style.display = "block";
                additionalOptions2.style.display = "block";
            } else {
                additionalOptions.style.display = "none";
                additionalOptions1.style.display = "none";
                additionalOptions2.style.display = "none";
            }
        }
    }
    
</script>

<script>
    function toggleOptions3() {
    	// Close all toggle options
        closeAllToggleOptions();
        var additionalOptions = document.getElementById("additional-options3");
        var additionalOptions1 = document.getElementById("additional-options3-1");
        var toggleButton = document.querySelector(".toggle-btn");

        if (toggleButton.classList.contains("active")) {
            // If the toggle is already active, keep the options open
            additionalOptions.style.display = "block";
            additionalOptions1.style.display = "block";
            additionalOptions2.style.display = "block";
        } else {
            // If the toggle is not active, toggle the options
            if (additionalOptions.style.display === "none") {
                additionalOptions.style.display = "block";
                additionalOptions1.style.display = "block";
                additionalOptions2.style.display = "block";
            } else {
                additionalOptions.style.display = "none";
                additionalOptions1.style.display = "none";
                additionalOptions2.style.display = "none";
            }
        }
    }
    
</script>

<script>
    function toggleOptions4() {
    	// Close all toggle options
        closeAllToggleOptions();
        var additionalOptions = document.getElementById("additional-options4");
        var additionalOptions1 = document.getElementById("additional-options4-1");
        var toggleButton = document.querySelector(".toggle-btn");

        if (toggleButton.classList.contains("active")) {
            // If the toggle is already active, keep the options open
            additionalOptions.style.display = "block";
            additionalOptions1.style.display = "block";
            additionalOptions2.style.display = "block";
        } else {
            // If the toggle is not active, toggle the options
            if (additionalOptions.style.display === "none") {
                additionalOptions.style.display = "block";
                additionalOptions1.style.display = "block";
                additionalOptions2.style.display = "block";
            } else {
                additionalOptions.style.display = "none";
                additionalOptions1.style.display = "none";
                additionalOptions2.style.display = "none";
            }
        }
    }
    
</script>

<script>
    function toggleOptions5() {
    	// Close all toggle options
        closeAllToggleOptions();
        var additionalOptions = document.getElementById("additional-options5");
        var additionalOptions1 = document.getElementById("additional-options5-1");
        var toggleButton = document.querySelector(".toggle-btn");

        if (toggleButton.classList.contains("active")) {
            // If the toggle is already active, keep the options open
            additionalOptions.style.display = "block";
            additionalOptions1.style.display = "block";
            additionalOptions2.style.display = "block";
        } else {
            // If the toggle is not active, toggle the options
            if (additionalOptions.style.display === "none") {
                additionalOptions.style.display = "block";
                additionalOptions1.style.display = "block";
                additionalOptions2.style.display = "block";
            } else {
                additionalOptions.style.display = "none";
                additionalOptions1.style.display = "none";
                additionalOptions2.style.display = "none";
            }
        }
    }
    
</script>

<script>
    function toggleOptions6() {
    	// Close all toggle options
        closeAllToggleOptions();
        var additionalOptions = document.getElementById("additional-options6");
        var additionalOptions1 = document.getElementById("additional-options6-1");
        var toggleButton = document.querySelector(".toggle-btn");

        if (toggleButton.classList.contains("active")) {
            // If the toggle is already active, keep the options open
            additionalOptions.style.display = "block";
            additionalOptions1.style.display = "block";
            additionalOptions2.style.display = "block";
        } else {
            // If the toggle is not active, toggle the options
            if (additionalOptions.style.display === "none") {
                additionalOptions.style.display = "block";
                additionalOptions1.style.display = "block";
                additionalOptions2.style.display = "block";
            } else {
                additionalOptions.style.display = "none";
                additionalOptions1.style.display = "none";
                additionalOptions2.style.display = "none";
            }
        }
    }
    
</script>
<script>
function closeAllToggleOptions() {
    var toggleButtons = document.querySelectorAll(".toggle-btn");
    var additionalOptions = document.querySelectorAll("[id^='additional-options']");

    // Close all toggle options and remove the active class from toggle buttons
    toggleButtons.forEach(function(button) {
        button.classList.remove("active");
    });

    additionalOptions.forEach(function(option) {
        option.style.display = "none";
    });
}

</script>

    
</body>
</html>