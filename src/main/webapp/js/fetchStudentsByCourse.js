function fetchStudentsByCourse() {
			var courseId = document.getElementById('courseSelect').value;

			var xhr = new XMLHttpRequest();
			xhr.open('GET', 'fetchStudentsByCourse.jsp?courseId=' + courseId,
					true);
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					document.getElementById('studentTableBody').innerHTML = xhr.responseText;
				}
			};
			xhr.send();
		}

		document.addEventListener('DOMContentLoaded', function() {
			fetchStudentsByCourse();
		});