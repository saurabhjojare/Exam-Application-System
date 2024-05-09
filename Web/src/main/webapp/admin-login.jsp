<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Login</title>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f8f9fa;
    }
    .login-form {
      max-width: 350px;
      margin: 100px auto;
      background: #fff;
      padding: 30px;
      border-radius: 5px;
      box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
    }
    .login-form h2 {
      text-align: center;
      margin-bottom: 30px;
    }
    
      @media (max-width: 768px) { 
       .login-form {
      max-width: 470px;
      margin: 100px auto;
      background: #fff;
      padding: 30px;
      border-radius: 5px;
      box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
    }
      }
  </style>
</head>
<body>

<div class="login-form">
  <h2>Login</h2>
  <form action="adminlogin" method="post">
    <div class="form-group">
      <label for="email">Email</label>
      <input type="text" class="form-control" id="email" name="email" required>
    </div>
    <div class="form-group">
      <label for="password">Password</label>
      <input type="password" class="form-control" id="password" name="password" required>
    </div>
    <button type="submit" class="btn btn-primary btn-block">Sign in</button>
  </form>
  <div class="text-center mt-3">
    <p>Don't have an account? <a href="admin-sign-up.jsp">Sign up</a></p>
  </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
