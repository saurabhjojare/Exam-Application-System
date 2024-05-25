<%@ include file="existingSession.jsp"%>
<%@ include file="common-resources.jsp"%>

<%
//Retrieve the AdminService instance from the servlet context
AdminService adminService = (AdminService) request.getServletContext().getAttribute("adminService");

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
				<h3 class="display-6 mt-2">Admin Details</h3>

				<div class="d-flex justify-content-center mb-3">
					<div class="input-group" style="width: 400px;">
						<input type="text" class="form-control" id="searchInput"
							placeholder="Search Result" aria-label="Search result"
							aria-describedby="button-addon2"
							onkeyup="searchByName(this.value)" disabled>
						<!-- <button class="btn btn-outline-secondary" type="button" id="button-addon2">Search</button> -->
					</div>
				</div>

				<table class="table table-bordered" id="resultsTable">
					<thead>
					</thead>
					<tbody id="resultsBody">
						<%
						if (admin == null) {
						%>
						<tr>
							<td colspan="2" style="text-align: center;">No admin found.</td>
						</tr>
						<%
						} else {
						%>
						<%
						int count = 1;
						for (AdminModel admin2 : admins) {
						%>
						<tr>
							<td class="key" style="padding: 15px">#</td>
							<td class="value" style="padding: 15px"><%=count%></td>
						</tr>

						<tr>
							<td class="key" style="padding-left: 15px">Full Name</td>
							<td class="value" style="padding-right: 15px"><%=admin2.getfullName()%></td>
						</tr>

						<tr>
							<td class="key" style="padding-left: 15px">Contact</td>
							<td class="value" style="padding-right: 15px"><%=admin2.getContact()%></td>
						</tr>

						<tr>
							<td class="key" style="padding-left: 15px">Email</td>
							<td class="value" style="padding-right: 15px"><%=admin2.getEmail()%></td>
						</tr>
						<tr>
							<td class="key" style="padding-left: 15px">Role</td>
							<td class="value" style="padding-right: 15px"><%=admin2.getRole()%></td>
						</tr>
						<tr>
							<td class="key" style="padding-left: 15px">Department</td>
							<td class="value" style="padding-right: 15px"><%=admin2.getDepartment()%></td>
						</tr>
						<tr>
							<td class="key" style="padding-left: 15px">Permissions</td>
							<td class="value" style="padding-right: 15px"><%=admin2.getPermissions()%></td>
						</tr>
						<tr>
							<td class="key" style="padding-left: 15px">Edit</td>
							<td>
								<button class="btn btn-primary" disabled>Update </button>
								<a
						href='deleteAdmin?id=<%=admin2.getId()%>'><button class="btn btn-danger">Delete</button></a>
							</td>
						</tr>
						<tr class="empty-row" style="border: 0px solid #fff;">
							<td colspan="2"></td>
						</tr>
						<%
						count++;
						}
						%>

						<%
						}
						%>
					</tbody>
				</table>
			</div>
			<div></div>
		</div>
	</div>
	<div class="bottom-navbar">
		<%@ include file="navbar-bottom.jsp"%>
	</div>
</body>
</html>
