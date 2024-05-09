<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
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
	</div>


</body>
</html>