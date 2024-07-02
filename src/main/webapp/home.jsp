<%@ include file="commonResources.jsp"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home</title>
<link rel="stylesheet" type="text/css" href="css/customColor.css">
<!-- Begin Inspectlet Asynchronous Code -->
<script type="text/javascript">
	(function() {
		window.__insp = window.__insp || [];
		__insp.push([ 'wid', 87857228 ]);
		var ldinsp = function() {
			if (typeof window.__inspld != "undefined")
				return;
			window.__inspld = 1;
			var insp = document.createElement('script');
			insp.type = 'text/javascript';
			insp.async = true;
			insp.id = "inspsync";
			insp.src = ('https:' == document.location.protocol ? 'https'
					: 'http')
					+ '://cdn.inspectlet.com/inspectlet.js?wid=87857228&r='
					+ Math.floor(new Date().getTime() / 3600000);
			var x = document.getElementsByTagName('script')[0];
			x.parentNode.insertBefore(insp, x);
		};
		setTimeout(ldinsp, 0);
	})();
</script>
<!-- End Inspectlet Asynchronous Code -->
</head>
<body>
	<%@ include file="navbar.jsp"%>

	<!-- Body -->
	<main class="d-flex align-items-center text-center">
		<div class="container">
			<section class="py-5 text-center">
				<div class="container">
					<h1 class="display-6">Welcome to the QuizConnect</h1>
					<p class="lead">Give exams with ease and convenience.</p>
					<a href="login.jsp" class="btn btn-primary btn-lg">Get Started</a>
				</div>
			</section>
		</div>
	</main>

	<%@ include file="footer.jsp"%>

</body>
</html>