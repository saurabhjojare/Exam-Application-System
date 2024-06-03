<%@ include file="existingSession.jsp" %>
<%@ include file="commonResources.jsp" %>

<%
AdminRepository adminRepository = new AdminRepositoryImpl();
AdminService adminService = new AdminServiceImpl(adminRepository);

List<AdminModel> admins = Optional.ofNullable(adminService).map(service -> service.getAllAdmins())
        .orElse(Collections.emptyList());
AdminModel admin = admins.isEmpty() ? null : admins.get(0);
%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>View Admin</title>
<link rel="stylesheet" type="text/css" href="css/viewAdmin.css">
<link rel="stylesheet" type="text/css" href="css/customColor.css">
</head>
<body>

    <div class="d-flex">
        <div class="sidebar">
            <%@ include file="sidebar.jsp" %>
        </div>
        <!-- Main Content Area -->
        <div class="flex-grow-1 view-padding text-center marginBottom">
            <h3 class="display-6 mt-2">Admin Details</h3>

            <div class="d-flex justify-content-center mb-3">
                <div class="input-group" style="width: 400px;">
                    <input type="text" class="form-control" id="searchInput"
                        placeholder="Search Result" aria-label="Search result"
                        aria-describedby="button-addon2"
                        onkeyup="searchByName(this.value)" disabled>
                </div>
            </div>

            <div class="d-flex justify-content-center">
                <div class="input-group" style="width: 400px;">
                    <select id="courseSelect" class="form-select mb-4"
                        aria-label="select" onchange="fetchAdminsByDepartment()">
                        <option value="" selected disabled>Select a department</option>
                        
                        <%
                        List<String> courseData = adminService.getAdminDepartments();
                        for (String course : courseData) {
                        %>
                        <option value="<%= course %>"><%= course %></option>
                        <%
                        }
                        %>
                    </select>
                </div>
            </div>
            
            <div id="adminTableBody"></div>
        </div>
    </div>
    <div class="bottom-navbar">
        <%@ include file="navbar-bottom.jsp" %>
    </div>
    
    <script>
        function fetchAdminsByDepartment() {
            var courseId = document.getElementById('courseSelect').value;
            
         

            var xhr = new XMLHttpRequest();
            xhr.open('GET', 'fetchAdminByDepartment.jsp?courseId=' + courseId, true);
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    document.getElementById('adminTableBody').innerHTML = xhr.responseText;
                }
            };
            xhr.send();
        }

        document.addEventListener('DOMContentLoaded', function() {
            fetchAdminsByDepartment();
        });
    </script>
</body>
</html>
