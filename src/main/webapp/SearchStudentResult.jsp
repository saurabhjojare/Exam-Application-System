<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.exam.service.StudentService"%>
<%@ page import="com.exam.service.StudentServiceImpl"%>
<%@ page import="java.util.List"%>
<%@ page import="org.apache.poi.ss.usermodel.*"%>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFWorkbook"%>
<%@ page import="java.io.*"%>

<%
String namePattern = request.getParameter("userInput");
String subjectName = request.getParameter("courseSelect");
System.out.println(namePattern);
System.out.println(subjectName);

StudentService fetchDataObj = new StudentServiceImpl();
List<Object[]> resultData = fetchDataObj.searchStudentInfoByNamePattern(namePattern);

if (resultData.isEmpty()) {
%>
<div>No result available for this student.</div>
<%
} else {
int counter = 1;
boolean subjectFound = false; // Flag to track if subjectName is found
%>

<table class="table table-bordered" id="resultsTable">
	<!-- Table header -->
	<thead>
		<!-- Table headers go here -->
	</thead>
	<tbody id="resultsBody">

		<%
		for (Object[] student : resultData) {
			if (student[4].toString().equals(subjectName)) {
				subjectFound = true;
		%>
		<!-- Rows for student data -->
		<tr>
			<td class="key" style="padding: 15px">#</td>
			<td class="value" style="padding: 15px"><%=counter++%></td>
		</tr>
		<!-- Other rows for student data -->
		<tr>
			<td class="key" style="padding-left: 15px">Student Name</td>
			<td class="value" style="padding-right: 15px"><%=student[0]%></td>
		</tr>
		<tr>
			<td class="key" style="padding-left: 15px">Email</td>
			<td class="value" style="padding-right: 15px"><%=student[1]%></td>
		</tr>
		<tr>
			<td class="key" style="padding-left: 15px">Contact</td>
			<td class="value" style="padding-right: 15px"><%=student[2]%></td>
		</tr>
		<tr>
			<td class="key" style="padding-left: 15px">Exam</td>
			<td class="value" style="padding-right: 15px"><%=student[3]%></td>
		</tr>
		<tr>
			<td class="key" style="padding-left: 15px">Subject</td>
			<td class="value" style="padding-right: 15px"><%=student[4]%></td>
		</tr>
		<tr>
    <td class="key" style="padding-left: 15px">Marks</td>
    <td class="value" style="padding-right: 15px"><%= String.format("%.2f%%", student[5]) %></td>
</tr>

		<tr>
    <td class="key" style="padding-left: 15px">Status</td>
    <td class="value" style="padding-right: 15px">
        <% 
            double status = Double.parseDouble(student[6].toString());
            String statusText = (status == 1.0) ? "Pass" : "Fail";
            String textColorClass = (status == 1.0) ? "text-success" : "text-danger";
        %>
        <span class="<%= textColorClass %>"><%= statusText %></span>
    </td>
</tr>


		<tr>
			<td class="key" style="padding-left: 15px">Date</td>
			<td class="value" style="padding-right: 15px"><%=student[7]%></td>
		</tr>
		<tr class="empty-row" style="border: 0px solid #fff;">
			<td colspan="2"></td>
		</tr>
		<%
		}
		}
		%>
	</tbody>
</table>

<%
// If subjectName is not found in any student's data
if (!subjectFound) {
%>
<div>No result available for this subject.</div>
<%
}
}
%>
