<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Footer</title>
</head>
<body>
	
		<!-- Footer -->
		<footer class="footer mt-auto py-3 bg-light">
			<div class="container text-center">
<!-- 			<span id="current-time" class="text-muted"></span><br> -->
<!-- 			<hr style = "width:145px; margin: 5px auto;"> -->
				<span class="text-muted">ByteBridge Group &copy; <span id="year"></span></span>
			</div>
		</footer>

<script src="js/currentTime.js"></script>
<script src="js/currentYear.js"></script>
<script>
//Get the current date
const currentDate = new Date();

// Extract the year from the current date
const currentYear = currentDate.getFullYear();

// Set the year in the HTML element with id "year"
document.getElementById('year').textContent = currentYear;
</script>
</body>
</html>