<%@ include file="commonResources.jsp"%>
<%@ include file="existingSession.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Access Restricted</title>
<style>
@media (min-width: 767.98px) { 
.container-fluid {
	width:70%;
} 
}
</style>
</head>
<body>

<%
	StudentService studentService = new StudentServiceImpl();
	List<StudentModel> studentList = studentService.getAllSecreteUser();
%>

<div class="container-fluid mt-4">
	<div class="table-responsive">
		<center><a class="text-danger text-decoration-none" onclick="redirectToLogin()" style="cursor: pointer;">Home</a></center>
		<div class="text-center text-danger mb-4">Confidential Information (User)</div>
		
		
		<table class="table table-bordered">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Username</th>
					<th scope="col">Password</th>
				</tr>
			</thead>
			<tbody>
				<%
				// Iterate over the student list and display data in the table
				for (StudentModel student : studentList) {
				%>
				<tr>
					<td><%=student.getUsername()%></td>
					<td><%=student.getPassword()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
</div>

	<script>
        function redirectToLogin() {
            window.location.href = 'profile-page.jsp';
        }
    </script>
	<script>
    // Function to invalidate the session after 60 seconds
    function invalidateSession() {
        fetch('existingSession.jsp', { method: 'POST' })
            .then(response => {
                if (response.ok) {
                    window.location.href = 'admin-login.jsp';
                }
            });
    }

    // Set a timeout to call invalidateSession function after 60 seconds (60000 milliseconds)
    setTimeout(invalidateSession, 60000);
</script>
</body>
</html>