<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.exam.model.AdminModel"%>
<%@ page import="com.exam.service.AdminService"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Optional"%>
<%@ page import="java.util.Collections"%>
<%@ page import="java.util.stream.Collectors"%>

<%
// Retrieve the AdminService instance from the servlet context
AdminService adminService = (AdminService) request.getServletContext().getAttribute("adminService");

HttpSession existingSession = request.getSession(false);
if (existingSession == null || existingSession.getAttribute("adminUsername") == null) {
	response.sendRedirect("admin-login.jsp");
}

String username = (String) existingSession.getAttribute("adminUsername");
List<AdminModel> admins = Optional.ofNullable(adminService).map(service -> service.getAdminsByUsername(username))
		.orElse(Collections.emptyList());
AdminModel admin = admins.isEmpty() ? null : admins.get(0);
%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin Panel</title>
<link rel="icon" href="../img/favicon.png" type="image/x-icon">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/login.css">


<style>
/* Custom CSS for the body content */
.body-content {
	margin-left: 280px; /* Same width as the sidebar */
	padding: 20px; /* Adjust padding as needed */
}

.bottom-navbar {
	display: none;
}

.view-padding {
	padding-left: 100px;
	padding-right: 90px;
}
/* Hide sidebar on screens smaller than lg */
@media ( max-width : 992px) {
	.sidebar {
		display: none;
	}
	.bottom-navbar {
		display: block;
	}
	.marginBottom {
		margin-bottom: 40px;
	}
}

@media ( max-width : 768px) {
	.view-padding {
		padding-left: 10px;
		padding-right: 10px;
	}
}
</style>

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
		<div class="flex-grow-1 view-padding text-center display-6">
			<span style="font-size: 25px;">Exam Application System </span> <br>
			<div class="mt-4 text-start">


				<p class="h3 lead" style="font-size: 22px; font-weight: normal;">Admin
					Details</p>
				<!-- 				<a href="admininfo" id="myLink" style ="font-size:25px; text-decoration: none;">View Admin Details</a><br> -->


				<%
				if (admin != null) {
				%>
				<span class="display-6" style="font-size: 28px;">Hello, <small
					class="text-body-secondary"><%=admin.getfullName()%></small></span><br>
				<span class="display-6" style="font-size: 28px;">Contact: <small
					class="text-body-secondary"><%=admin.getContact()%></small></span><br>
				<span class="display-6" style="font-size: 28px;">Email
					Address: <small class="text-body-secondary"><%=admin.getEmail()%></small>
				</span><br> <span class="display-6" style="font-size: 28px;">Role:
					<small class="text-body-secondary"><%=admin.getRole()%></small>
				</span><br> <span class="display-6" style="font-size: 28px;">Department:
					<small class="text-body-secondary"><%=admin.getDepartment()%></small>
				</span><br> <span class="display-6" style="font-size: 28px;">Permissions:
					<small class="text-body-secondary"><%=admin.getPermissions()%></small>
				</span><br>
				<%
				} else {
				%>
				<!-- Handle case where admin is null -->
				<span class="display-6" style="font-size: 28px;">No admin
					found.</span><br>
				<%
				}
				%>
				<div class="marginBottom">
					<button type="button" class="btn btn-primary mt-3"
						onclick="location.href='update-admin-details.jsp'">Update
						Details</button>
				</div>

			</div>

		</div>
		<div></div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>

</body>
</html>