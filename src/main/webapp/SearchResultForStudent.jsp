<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.exam.service.StudentService"%>
<%@ page import="com.exam.service.StudentServiceImpl"%>

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

<%
String userInput = request.getParameter("userInput");
System.out.println("Received course ID: " + userInput);

StudentService fetchDataObj2 = new StudentServiceImpl();
List<Object[]> studentData = fetchDataObj2.searchResultByUserInput(userInput);
%>

<%
if (studentData.isEmpty()) {
%>
<div>No result available.</div>
<%
} else {
%>
<%
int counter = 1;
%>
<div class="table-container">
	<%
	for (Object[] student : studentData) {
		String status = (Double.parseDouble(student[4].toString()) >= 1.0) ? "Pass" : "Fail";
	%>

	<div class="TableMob">

		<table class="table table-bordered" id="resultsTable">
			<thead></thead>
			<tbody id="resultsBody">
				<tr>
					<td class="key" style="padding-left: 15px">#</td>
					<td class="value" style="padding-right: 15px"><%=counter++%></td>
				</tr>
				<tr>
					<td class="key" style="padding-left: 15px">Exam Name</td>
					<td class="value" style="padding-right: 15px"><%=student[0]%></td>
				</tr>
				<tr>
					<td class="key" style="padding-left: 15px">Subject</td>
					<td class="value" style="padding-right: 15px"><%=student[1]%></td>
				</tr>
				<tr>
					<td class="key" style="padding-left: 15px">Exam Date</td>
					<td class="value" style="padding-right: 15px"><%=student[2]%></td>
				</tr>
				<tr>
					<td class="key" style="padding-left: 15px">Marks</td>
					<td class="value" style="padding-right: 15px"><%=String.format("%.2f", student[3])%>%
						<!-- Format marks with two decimal places and add percent sign -->
					</td>
				</tr>

				<tr>
					<td class="key" style="padding-left: 15px">Status</td>
					<td class="value" style="padding-right: 15px">
						<%
						if (status.equals("Pass")) {
						%> <span class="text-success"><%=status%></span> <%
 } else if (status.equals("Fail")) {
 %> <span class="text-danger"><%=status%></span> <%
 } else {
 %> <%=status%> <%
 }
 %>
					</td>
				</tr>

			</tbody>
		</table>

	</div>
	<%
	}
	%>
</div>
<div class="table-container">

	<div class="TableDesk">
		<table class="table" id="resultsTable">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">Exam Name</th>
					<th scope="col">Subject</th>
					<th scope="col">Exam Date</th>
					<th scope="col">Marks</th>
					<th scope="col">Status</th>
				</tr>
			</thead>
			<tbody id="resultsBody">
				<%
				int counter2 = 1;
				%>
				<%
				for (Object[] student : studentData) {
					String status = (Double.parseDouble(student[4].toString()) >= 1.0) ? "Pass" : "Fail";
				%>
				<tr>
					<td class="value" style="padding-right: 15px"><%=counter2++%></td>
					<td class="value" style="padding-right: 15px"><%=student[0]%></td>
					<td class="value" style="padding-right: 15px"><%=student[1]%></td>
					<td class="value" style="padding-right: 15px"><%=student[2]%></td>
					<td class="value" style="padding-right: 15px"><%=String.format("%.2f%%", Double.parseDouble(student[3].toString()))%></td>
					<td class="value" style="padding-right: 15px">
						<%
						if (status.equals("Pass")) {
						%> <span class="text-success"><%=status%></span> <%
 } else if (status.equals("Fail")) {
 %> <span class="text-danger"><%=status%></span> <%
 } else {
 %> <%=status%> <%
 }
 %>
					</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
	<%
	}
	%>
</div>