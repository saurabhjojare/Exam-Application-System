<%@ include file="existingSession.jsp" %>
<%@ include file="commonResources.jsp" %>

<%
// Retrieve the AdminService instance from the servlet context
AdminService adminService = (AdminService) request.getServletContext().getAttribute("adminService");

List<AdminModel> admins = Optional.ofNullable(adminService).map(service -> service.getAdminsByUsername(username)).orElse(Collections.emptyList());
AdminModel admin = admins.isEmpty() ? null : admins.get(0);
%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin Profile</title>
<link rel="stylesheet" type="text/css" href="css/profilePage.css">
<link rel="stylesheet" type="text/css" href="css/customColor.css">
</head>
<body>
	<div class="d-flex">
		<div class="sidebar">
			<%@ include file="sidebar.jsp"%>
		</div>
		<div class="bottom-navbar">
			<%@ include file="navbar-bottom.jsp"%>
		</div>
		<!-- Main Content Area -->
		<div class="flex-grow-1 view-padding text-center display-6" style = "height:100vh; overflow:auto;">
			<div class = "mt-3 mb-3">
			<span class="display-6">QuizConnect</span>
			<p class="lead text-center mt-2">Welcome, Administrator</p>
			<h3 class="fw-light h3">Admin Details</h3>
			</div>
			
			<div class="justify-content-center align-items-center" style = "display: inline-block; text-align: justify;">


				
				<!-- 				<a href="admininfo" id="myLink" style ="font-size:25px; text-decoration: none;">View Admin Details</a><br> -->


				<%
				if (admin != null) {
				%>
				<div class ="mb-1">
				<span class="display-6" style="font-size: 28px;">Name: <small
					class="text-body-secondary"><%=admin.getfullName()%></small></span><br>
				</div>
				<div class ="mb-1">
				<span class="display-6" style="font-size: 28px;">Contact: <small
					class="text-body-secondary"><%=admin.getContact()%></small></span><br>
					</div>
					<div class ="mb-1">
				<span class="display-6" style="font-size: 28px;">Email: <small class="text-body-secondary"><%=admin.getEmail()%></small>
				</span><br> 
				</div>
				<div class ="mb-1">
				<span class="display-6" style="font-size: 28px;">Role:
					<small class="text-body-secondary"><%=admin.getRole()%></small>
				</span><br> 
				</div>
				<div class ="mb-1">
				<span class="display-6" style="font-size: 28px;">Department:
					<small class="text-body-secondary"><%=admin.getDepartment()%></small>
				</span><br> 
				</div>
				<div class ="mb-1">
				<span class="display-6" style="font-size: 28px;">Permissions:
					<small class="text-body-secondary"><%=admin.getPermissions()%></small>
				</span><br>
				</div>
				<%
				} else {
				%>
				<!-- Handle case where admin is null -->
				<span class="display-6" style="font-size: 28px;">No admin
					found.</span><br>
				<%
				// Invalidate session if no admin is found
			    session.invalidate();
				}
				%>
				<div class="marginBottom">
					<button type="button" class="btn btn-primary mt-3 marginBottom"
						onclick="location.href='update-admin.jsp'">Update
						Details</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>