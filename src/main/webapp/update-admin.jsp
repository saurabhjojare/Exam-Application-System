<%@ include file="existingSession.jsp" %>
<%@ include file="commonResources.jsp" %>

<%
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
<style>
@media (min-width: 1200px) { 
    .formWidth {
        width: 50%;
    } 
}
</style>
</head>
<body>
<div class="d-flex">
    <div class="sidebar">
        <%@ include file="sidebar.jsp" %>
    </div>
    <div class="bottom-navbar">
        <%@ include file="navbar-bottom.jsp" %>
    </div>
    <div class="flex-grow-1 view-padding text-center display-6" style="height: 100vh; overflow: auto;">
        <div class="mt-3 mb-4">
            <span class="display-6">QuizConnect</span>
            <p class="lead text-center mt-2">Welcome, Administrator</p>
             <h3 class="fw-light h3">Update Details</h3>
        </div>
        <div class="d-flex justify-content-center align-items-center">
            <div class="formWidth">
               
                <form name='form' action='updateAdmin' method='Post' onsubmit="return validateForm()" style = "width:80%; margin:0px auto">
                    <%
                    if (admin != null) {
                    %>
                    <input type="hidden" name="stid" value="<%= admin.getId() %>">
                    <div class="mb-3">
                        <label for="name" class="form-label lead" style = "float: inline-start;">Name</label>
                        <input type="text" name="name" class="form-control" id="fullName"
                               placeholder="Enter your name" value="<%= admin.getfullName() %>" autocomplete="off">
                        <span class="fw-light h6" id="fullNameWarningMsg"></span>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label lead" style = "float: inline-start;">Email</label>
                        <input type="text" name="email" class="form-control" id="email"
                               placeholder="Enter your email" value="<%= admin.getEmail() %>" autocomplete="off">
                        <span class="fw-light h6" id="emailWarningMsg"></span>
                    </div>
                    <div class="mb-3">
                        <label for="contact" class="form-label lead" style = "float: inline-start;">Contact</label>
                        <input type="text" name="contact" class="form-control" id="contact"
                               placeholder="Enter your contact" value="<%= admin.getContact() %>" autocomplete="off">
                        <span class="fw-light h6" id="contactWarningMsg"></span>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label lead" style = "float: inline-start;">Password</label>
                        <div class="input-group">
                            <input type="password" name="password" class="form-control"
                                   id="signupPassword" placeholder="Enter new password" autocomplete="off">
                            <button class="btn btn-outline-secondary" type="button" id="showPasswordBtn">
                                <i class="bi bi-eye-slash"></i></button>
                        </div>
                        <span class="fw-light h6" id="passwordWarningMsg1"></span>
                    </div>
                    <%
                    } else {
                    %>
                    <span class="display-6" style="font-size: 28px;">No admin found.</span><br>
                    <%
                    session.invalidate();
                    }
                    %>
                    <div class="marginBottom">
                        <button type="button" class="btn btn-secondary marginBottom"
                                onclick="window.location.href='profile-page.jsp';">Back</button>
                        <button type="submit" class="btn btn-primary marginBottom">Update</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
document.getElementById('showPasswordBtn').addEventListener('click', function () {
    var passwordInput = document.getElementById('signupPassword');
    var icon = this.querySelector('i');
    if (passwordInput.type === 'password') {
        passwordInput.type = 'text';
        icon.classList.remove('bi-eye-slash');
        icon.classList.add('bi-eye');
    } else {
        passwordInput.type = 'password';
        icon.classList.remove('bi-eye');
        icon.classList.add('bi-eye-slash');
    }
});
</script>

<script>
    function validateForm() {
        const namePattern = /^[A-Za-z\s]{1,255}$/;
        const emailPattern = /^[^\s@]{1,255}@[^\s@]+\.[^\s@]+$/;
        const contactPattern = /^\+\d{1,3}\d{9,10}$/;  // Assuming contact is a 10-digit number
        const passwordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*])(?=.{8,255})/;
        
        let isValid = true;
        
        const fullName = document.getElementById('fullName').value;
        const email = document.getElementById('email').value;
        const contact = document.getElementById('contact').value;
        const password = document.getElementById('signupPassword').value;
        
        if (!namePattern.test(fullName)) {
            document.getElementById('fullNameWarningMsg').innerText = "Invalid name. Only letters and spaces allowed.";
            isValid = false;
        } else {
            document.getElementById('fullNameWarningMsg').innerText = "";
        }
        
        if (!emailPattern.test(email)) {
            document.getElementById('emailWarningMsg').innerText = "Invalid email format.";
            isValid = false;
        } else {
            document.getElementById('emailWarningMsg').innerText = "";
        }
        
        if (!contactPattern.test(contact)) {
            document.getElementById('contactWarningMsg').innerText = "Invalid contact number. It should be a 10-digit number.";
            isValid = false;
        } else {
            document.getElementById('contactWarningMsg').innerText = "";
        }
        
        if (password && !passwordPattern.test(password)) {
            document.getElementById('passwordWarningMsg1').innerText = "Must include at least one lowercase letter, one uppercase letter, one digit, one special character";
            isValid = false;
        } else {
            document.getElementById('passwordWarningMsg1').innerText = "";
        }
        
        return isValid;
    }
</script>

</body>
</html>
