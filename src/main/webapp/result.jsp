<%@ include file="userSession.jsp"%>
<%@ include file="commonResources.jsp"%>

<%@ page import="java.util.Collections" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%
ExamService examService = new ExamServiceImpl();
List<String[]> results = examService.getResult(username);
int count = 1;
int count2 = 1;

// Reverse the results list
List<String[]> resultsReversed = new ArrayList<>(results);
Collections.reverse(resultsReversed);
%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Result</title>
<link rel="stylesheet" type="text/css" href="css/result.css">
<link rel="stylesheet" type="text/css" href="css/customColor.css">
<style>
.TableMob {
	display: none;
}

.table-container {
	max-height: 300px; /* Adjust the height as needed */
	overflow-y: scroll;
}

/* Hide scrollbar for Chrome, Safari, and Opera */
.table-container::-webkit-scrollbar {
	display: none;
}

/* Hide scrollbar for Firefox */
.table-container {
	scrollbar-width: none;
}

@media ( max-width : 800.98px) {
	.TableDesk {
		display: none;
	}
	.TableMob {
		display: block;
	}
	.table-container {
		max-height: 350px; /* Adjust the height as needed */
		overflow-y: scroll;
	}

	/* Hide scrollbar for Chrome, Safari, and Opera */
	.table-container::-webkit-scrollbar {
		display: none;
	}

	/* Hide scrollbar for Firefox */
	.table-container {
		scrollbar-width: none;
	}
}
</style>
</head>
<body>

	<%@ include file="navbar.jsp"%>

	<!-- Body -->

	<main class="result-content TableDesk">

		<section class="container-sm pt-5 text-center">

			<h1 class="fw-light">Exam Results</h1>

			<p>Here's a summary of your performance:</p>
			<div class="d-flex justify-content-center mb-3">
				<div class="input-group" style="width: 400px;">
					<input type="text" id="searchInput2" class="form-control"
						placeholder="Search Result" aria-label="Search result"
						aria-describedby="button-addon2" onkeyup="searchStudents2()">
				</div>
			</div>
			<div class="table-container">
				<div id="searchResults2"></div>
			</div>
			<div class="table-container">

				<table id="resultsTable2" class="table table-hover">
					<thead>
						<tr>
							<th class ="fw-light">#</th>
							<th class ="fw-light">Exam Name</th>
							<th class ="fw-light">Subject</th>
							<th class ="fw-light">Exam Date</th>
							<th class ="fw-light">Marks</th>
							<th class ="fw-light">Status</th>
						</tr>
					</thead>
					<tbody>
						<%
						if (resultsReversed.isEmpty()) {
						%>
						<tr>
							<td colspan="6" style="border: none;">
								<div style="display: flex; justify-content: center; align-items: center;">
									No result found.</div>
							</td>
						</tr>

						<%
						} else {
						%>
						<%
						for (String[] result : resultsReversed) {
							String status = result[3].equals("1.0") ? "Pass" : "Fail";
						%>
						<tr>
							<td><%=count++%></td>
							<td><%=result[0]%></td>
							<td><%=result[1]%></td>
							<td><%=result[4]%></td>
							<td><%=String.format("%.2f%%", Double.parseDouble(result[2].toString()))%></td>
							<td class="<%=(status.equals("Pass")) ? "text-success" : "text-danger"%>"><%=status%></td>
						</tr>
						<%
						}
						%>
						<%
						}
						%>
					</tbody>
				</table>
			</div>


		</section>
	</main>


	<main class="TableMob">
		<section class="container-fluid pt-5 text-center">
			<h1 class="fw-light">Exam Results</h1>
			<p>Here's a summary of your performance:</p>
			<div class="d-flex justify-content-center mb-3">
				<div class="input-group" style="width: 400px;">
					<input type="text" id="searchInput" class="form-control"
						placeholder="Search Result" aria-label="Search result"
						aria-describedby="button-addon2" onkeyup="searchStudents()">
				</div>
			</div>

			<div id="searchResults"></div>
			<div class="table-container">
				<table id="resultsTable" class="table table-bordered">
					<thead>
					</thead>
					<tbody>
						<%
						if (resultsReversed.isEmpty()) {
						%>
						<tr style="border-top: none; border-bottom: none;">
							<td colspan="6" style="border: none;">
								<div style="display: flex; justify-content: center; align-items: center;">
									No result found.
								</div>
							</td>
						</tr>
						<%
						} else {
						%>
						<%
						for (String[] result : resultsReversed) {
							String status = result[3].equals("1.0") ? "Pass" : "Fail";
						%>
						<tr>
							<td scope="col">#</td>
							<td scope="col"><%=count2++%></td>
						</tr>
						<tr>
							<td scope="col">Exam</td>
							<td scope="col"><%=result[0]%></td>
						</tr>
						<tr>
							<td scope="col">Subject</td>
							<td scope="col"><%=result[1]%></td>
						</tr>
						<tr>
							<td scope="col">Exam Date</td>
							<td scope="col"><%=result[4]%></td>
						</tr>
						<tr>
							<td scope="col">Marks</td>
							<td scope="col"><%=String.format("%.2f%%", Double.parseDouble(result[2].toString()))%></td>
						</tr>

						<tr>
							<td scope="col">Status</td>
							<td scope="col"
								class="<%=status.equals("Pass") ? "text-success" : "text-danger"%>"><%=status%></td>
						</tr>

						<tr class="empty-row" style="border: 0px solid #fff;">
							<td colspan="2"></td>
						</tr>
						<%
						}
						%>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
		</section>
	</main>


	<%@ include file="footer.jsp"%>

	<script>
		function searchStudents() {
			var userInput = document.getElementById("searchInput").value;

			// Check if the search input is empty
			if (userInput.trim() === '') {
				// Clear the search results and show the table
				document.getElementById("searchResults").innerHTML = '';
				document.getElementById("resultsTable").style.display = 'table';
				return;
			}

			// Hide the table
			document.getElementById("resultsTable").style.display = 'none';

			// Make AJAX call
			var xhr = new XMLHttpRequest();
			xhr.open("GET",
					"SearchResultForStudent.jsp?userInput=" + userInput, true);
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					// Update DOM with response
					document.getElementById("searchResults").innerHTML = xhr.responseText;
				}
			};
			xhr.send();
		}
	</script>

	<script>
		function searchStudents2() {
			var userInput = document.getElementById("searchInput2").value;

			// Check if the search input is empty
			if (userInput.trim() === '') {
				// Clear the search results and show the table
				document.getElementById("searchResults2").innerHTML = '';
				document.getElementById("resultsTable2").style.display = 'table';
				return;
			}

			// Hide the table
			document.getElementById("resultsTable2").style.display = 'none';

			// Make AJAX call
			var xhr = new XMLHttpRequest();
			xhr.open("GET",
					"SearchResultForStudent.jsp?userInput=" + userInput, true);
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					// Update DOM with response
					document.getElementById("searchResults2").innerHTML = xhr.responseText;
				}
			};
			xhr.send();
		}
	</script>
</body>
</html>
