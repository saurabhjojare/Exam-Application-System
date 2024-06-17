<%@ include file="commonResources.jsp"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>404</title>

<link rel="stylesheet" type="text/css" href="css/customColor.css">
<style>
html, body {
	height: 100%;
}

body {
	display: flex;
	flex-direction: column;
}

main {
	flex: 1;
}

#profile {
	display: flex;
	width: 230px;
}

.profileName {
	width: 250px;
}

.navColor {
	background: -webkit-linear-gradient(to right, #1a2980, #26d0ce);
	/* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #1a2980, #26d0ce);
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
}

/* Sticky footer styles */
.footer {
	flex-shrink: 0;
}

/* Additional style for centering the text */
.navbar-text {
	margin: auto;
}

.navbar-brand {
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
}

#countdown {
	color: white;
	width: 190px;
}

@media ( max-width : 991px) {
	.navbar-nav {
		text-align: center;
	}
	#countdown {
		width: 100%;
		text-align: center;
	}
	#profile {
		text-align: center;
		width: 100%;
	}
	.profileName {
		text-align: center;
		width: 100%;
	}
}
</style>
</head>
<body>

	<%@ include file="navbar.jsp"%>

	<!-- Body -->
	<main class="d-flex align-items-center text-center">
		<div class="container">
			<section class="py-5 text-center">
				<div class="container">
					<h1 class="display-6">404 - Page Not Found</h1>
					<p class="lead">Sorry, the page you are looking for does not
						exist.</p>
					<p>
						Go back to <a href="/Exam-Application-System/index.jsp" class="text-decoration-none">home</a>.
<!-- 				    Go back to <a href="https://bytebridgegroup.tech/home.jsp" class="text-decoration-none">home</a>. -->
						
					</p>
				</div>
			</section>
		</div>
	</main>
	<div class="">
		<%@ include file="footer.jsp"%>
	</div>


</body>
</html>