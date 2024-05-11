<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
<title>Add Exam</title>
<link rel="icon" href="../img/favicon.png" type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/login.css">

<style>

 .loginWidth {
    max-width: 800px; /* Set a maximum width for the login form */
  }
        .body-content {
            margin-left: 280px;
            padding: 20px;
        }
        
        
.bottom-navbar{
display: none;
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
margin-bottom: 52px;
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
        <div class="flex-grow-1  d-flex" style = "height:100vh; overflow:auto">
           <main>
		<section class="py-3">
		<div class="loginWidth">
			<div class="container">
  <div class="row justify-content-center">
    <div class="col-lg-6">
      <div class="signup-form">
      <h1 class="display-6 text-center">Add Admin</h1>
        <p class="lead text-center">Enter details for the new admin.</p>
        <form id="signupForm" action="adminsignup" method="post">
          <div class="form-group mb-3">
            <label for="fullName">Full Name</label>
            <input type="text" class="form-control" id="fullName" name="fullName" placeholder="Enter Full Name" required>
            <span class = "text-muted" id = "fullNameWarningMsg"></span>
          </div>
          <div class="form-group mb-3">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Enter Password" required>
          <span class = "text-muted" id = "passwordWarningMsg1"></span>
          </div>
          <div class="form-group mb-3">
            <label for="confirmPassword">Confirm Password</label>
            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" required>
          <span class = "text-muted" id = "passwordWarningMsg"></span>
          </div>
          <div class="form-group mb-3">
            <label for="contact">Contact</label>
            <input type="text" class="form-control" id="contact" name="contact" placeholder="Enter Contact" required>
            <span class = "text-muted" id = "contactWarningMsg"></span>
          </div>
          <div class="form-group mb-3">
            <label for="email">Email Address</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Enter Email Address" required>
            <span class = "text-muted" id = "emailWarningMsg"></span>
          </div>
          <div class="form-group mb-3">
            <label for="role">Role</label>
            <select class="form-control" id="role" name="role" required>
              <option value="">Select Role</option>
              <option value="Administrator">Administrator</option>
              <option value="Manager">Manager</option>
              <option value="Supervisor">Supervisor</option>
              <!-- Add more options as needed -->
            </select>
          </div>
          <div class="form-group mb-3">
            <label for="department">Department</label>
            <select class="form-control" id="department" name="department" required>
              <option value="">Select Department</option>
              <option value="IT Department">IT Department</option>
              <option value="Marketing Department">Marketing Department</option>
              <!-- Add more options as needed -->
            </select>
          </div>
          <div class="form-group mb-3">
            <label for="permissions">Permissions</label>
            <select class="form-control" id="permissions" name="permissions" required>
              <option value="">Select Permissions</option>
              <option value="Full Access">Full Access</option>
              <option value="Limited Access">Limited Access</option>
              <!-- Add more options as needed -->
            </select>
          </div>
          
          <div class = "text-center">
          <div class = "marginBottom">
          <button type="submit" class="btn btn-primary btn-block">Sign Up</button>
          </div>
          </div>
          
        </form>
      </div>
    </div>
  </div>
</div>
</div>
		</section>
	</main>
        </div>
    </div>
    <div class="bottom-navbar">
	<%@ include file="navbar-bottom.jsp"%>
	</div>
	
		
		
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="js/signupValidation.js"></script>
		
		<script>
		// JavaScript to hide the message after 4 seconds
		setTimeout(function() {
			var messageElement = document.getElementById('message');
			if (messageElement) {
				messageElement.style.display = 'none';
			}
		}, 4000); // 4 seconds
	</script>
</body>
</html>