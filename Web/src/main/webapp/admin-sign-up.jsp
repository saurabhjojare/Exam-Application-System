<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sign Up Page</title>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  
  
  <style>
    body {
      background-color: #f8f9fa;
    }
    .signup-form {
      width: 90%;
      max-width: 400px; /* Adjust max-width as needed */
      margin: 50px auto;
      background: #fff;
      padding: 30px;
      border-radius: 5px;
      box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
    }
    .signup-form h2 {
      text-align: center;
      margin-bottom: 30px;
    }
    
    @media (max-width: 768px) { 
        .signup-form {
    width: 100%;
    max-width: 500px;
    margin: 50px auto;
    background: #fff;
    padding: 30px;
    border-radius: 5px;
    box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
}
    
     }
  </style>
</head>
<body>


<div class="container">
  <div class="row justify-content-center">
    <div class="col-lg-6">
      <div class="signup-form">
        <h2>Sign Up</h2>
        <form id="signupForm" action="adminsignup" method="post">
          <div class="form-group">
            <label for="fullName">Full Name</label>
            <input type="text" class="form-control" id="fullName" name="fullName" required>
            <span id = "fullNameWarningMsg"></span>
          </div>
          <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" name="password" required>
          <span id = "passwordWarningMsg1"></span>
          </div>
          <div class="form-group">
            <label for="confirmPassword">Confirm Password</label>
            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
          <span id = "passwordWarningMsg"></span>
          </div>
          <div class="form-group">
            <label for="contact">Contact</label>
            <input type="text" class="form-control" id="contact" name="contact" required>
            <span id = "contactWarningMsg"></span>
          </div>
          <div class="form-group">
            <label for="email">Email Address</label>
            <input type="email" class="form-control" id="email" name="email" required>
            <span id = "emailWarningMsg"></span>
          </div>
          <div class="form-group">
            <label for="role">Role</label>
            <select class="form-control" id="role" name="role" required>
              <option value="">Select Role</option>
              <option value="Administrator">Administrator</option>
              <option value="Manager">Manager</option>
              <option value="Supervisor">Supervisor</option>
              <!-- Add more options as needed -->
            </select>
          </div>
          <div class="form-group">
            <label for="department">Department</label>
            <select class="form-control" id="department" name="department" required>
              <option value="">Select Department</option>
              <option value="IT Department">IT Department</option>
              <option value="Marketing Department">Marketing Department</option>
              <!-- Add more options as needed -->
            </select>
          </div>
          <div class="form-group">
            <label for="permissions">Permissions</label>
            <select class="form-control" id="permissions" name="permissions" required>
              <option value="">Select Permissions</option>
              <option value="Full Access">Full Access</option>
              <option value="Limited Access">Limited Access</option>
              <!-- Add more options as needed -->
            </select>
          </div>
          <button type="submit" class="btn btn-primary btn-block">Sign Up</button>
        </form>
        <div class="text-center mt-3">
          <p>Already have an account? <a href="admin-login.jsp">Login</a></p>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="js/signupValidation.js"></script>
<script>
</script>


</body>
</html>
