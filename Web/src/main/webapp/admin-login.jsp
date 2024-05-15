<%@ include file="common-resources.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Login</title>
<link rel="stylesheet" type="text/css" href="css/adminLogin.css">
</head>
<body>

<div class="login-form">
    <h2>Login</h2>
    <form action="adminlogin" method="post">
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="text" class="form-control" id="email" name="email" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <div class="mb-3 d-grid">
            <button type="submit" class="btn btn-primary">Sign in</button>
        </div>
    </form>
    <div class="text-center mt-3">
        <p>Are you a user? <a href="login.jsp">Login</a></p>
    </div>
</div>

</body>
</html>
