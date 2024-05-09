<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
HttpSession existingSession = request.getSession(false);
if (existingSession == null || existingSession.getAttribute("adminUsername") == null) {
	response.sendRedirect("admin-login.jsp");
}
String username = (String) existingSession.getAttribute("adminUsername");
%>


<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>View Question</title>
<link rel="icon" href="../img/favicon.png" type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/login.css">

<style>
/* Custom CSS for the body content */
.body-content {
    margin-left: 280px; /* Same width as the sidebar */
    padding: 20px; /* Adjust padding as needed */
    overflow-x: hidden; /* Prevent horizontal scrolling */
}

tbody tr {
    
    word-wrap: break-word; /* Allow long words to break and wrap */
}

/* Additional styling for the table */
th, td {
    text-align: center; /* Center align content */
    vertical-align: middle; /* Center align vertically */
}

.table th, .table td {
    padding: .75rem; /* Adjust padding as needed */
}

/* Align key-value pairs */
td.key {
    text-align: left;
    font-weight: bold;
}

/* Align data to the right */
td.value {
    text-align: right;
}

.bottom-navbar{
display: none;
}

.view-padding {
padding-left :100px;
padding-right :90px;
}

/* Hide sidebar on screens smaller than lg */
@media (max-width: 992px) {
    .sidebar {
        display: none;
    }
    .bottom-navbar{
display: block;
}
.marginBottom{
margin-bottom: 42px;
}
    
}

@media (max-width: 768px) {
.view-padding {
padding-left :10px;
padding-right :10px;
}
}
</style>

</head>
<body>
<div class = "marginBottom">
    <div class="d-flex">
    <div class="sidebar">
        <%@ include file="sidebar.jsp"%>
        </div>
        <!-- Main Content Area -->
        <div class="flex-grow-1 view-padding text-center">
            <h3 class="display-6 mt-2">Question Details</h3>
            
            <table class="table table-bordered">
                <thead>
                 
                </thead>
                <tbody>
                    <tr>
                        <td class="key" style = "padding: 15px">#</td>
                        <td class="value" style = "padding: 15px">1</td>
                    </tr>
                    <tr>
                        <td class="key" style = "padding-left: 15px">Question</td>
                        <td class="value" style = "padding-right: 15px">Which of the following is not a primitive data type in Java? </td>
                    </tr>
                    <tr>
                        <td class="key" style = "padding-left: 15px">Option 1</td>
                        <td class="value" style = "padding-right: 15px">int</td>
                    </tr>
                    <tr>
                        <td class="key" style = "padding-left: 15px">Option 2</td>
                        <td class="value" style = "padding-right: 15px">double</td>
                    </tr>
                    <tr>
                        <td class="key" style = "padding-left: 15px">Option 3</td>
                        <td class="value" style = "padding-right: 15px">string</td>
                    </tr>
                    <tr>
                        <td class="key" style = "padding-left: 15px">Option 4</td>
                        <td class="value" style = "padding-right: 15px">boolean</td>
                    </tr>
                    <tr>
                        <td class="key" style = "padding-left: 15px">Answer</td>
                        <td class="value" style = "padding-right: 15px">3</td>
                    </tr>
                    <tr>
                         <td class="key" style = "padding-left: 15px">Edit</td>
                        <td>
                            <button class="btn btn-primary">Update</button>
                            <button class="btn btn-danger">Delete</button>
                        </td>
                    </tr>
                    
                </tbody>
            </table>
        </div>
        <div></div>
    </div>
    </div>
    <div class="bottom-navbar">
	<%@ include file="navbar-bottom.jsp"%>
	</div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>
