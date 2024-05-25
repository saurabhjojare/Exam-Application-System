<%@ include file="common-resources.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Login</title>
<link rel="stylesheet" type="text/css" href="css/adminLogin.css">
<link rel="stylesheet" type="text/css" href="css/CustomColor.css">
</head>
<body>

<div class="content">
    <div class="login-form">
    
        <h2 class = "fw-light">Login</h2>
        <form action="adminlogin" method="post">
            <div class="mb-3">
            	
                <label for="email" class="form-label">Email</label>
                <input type="text" class="form-control" id="email" name="email" autocomplete="off" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" autocomplete="off" required>
            </div>
            <div class="mb-3 d-grid">
                <button type="submit" class="btn btn-primary">Sign in</button>
            </div>
        </form>
        <div class="text-center mt-3">
            <p>Are you a user? <a href="login.jsp">Login</a></p>
        </div>
        <div class = "text-center mb-1">
    <span class ="lead">QuizConnect</span>
    </div>
    </div>
</div>

<div class="position-absolute bottom-0 start-50 translate-middle-x">
<footer class="footer mb-4">
    <div class="exam text-center">Byte Bridge Group @ 2024</div>
</footer>
</div>

</body>
</html>
