<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.exam.service.ExamService"%>
<%@ page import="com.exam.service.ExamServiceImpl"%>
<%@ page import="java.util.List"%>
<%@ page import="org.apache.poi.ss.usermodel.*" %>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFWorkbook" %>
<%@ page import="java.io.*" %>

<%
int courseId = Integer.parseInt(request.getParameter("courseId"));
ExamService fetchDataObj2 = new ExamServiceImpl();
List<String[]> resultData = fetchDataObj2.fetchResultByCourse(courseId);

if (resultData.isEmpty()) {
%>
<div>No result available for this subject.</div>
<%
} else {
int counter = 1;
%>

<table class="table table-bordered" id="resultsTable">
    <thead>
        <!-- Optionally you can add table headers here -->
    </thead>
    <tbody id="resultsBody">
        <% for (String[] student : resultData) { %>

        <tr>
            <td class="key" style="padding: 15px">#</td>
            <td class="value" style="padding: 15px"><%=counter++%></td>
        </tr>

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
            <td class="value" style="padding-right: 15px"><%=student[4]%></td>
        </tr>

        <tr>
            <td class="key" style="padding-left: 15px">Subject</td>
            <td class="value" style="padding-right: 15px"><%=student[5]%></td>
        </tr>

        <tr>
            <td class="key" style="padding-left: 15px">Marks</td>
            <%
            double obtainedPercentage = Double.parseDouble(student[6]);
            String formattedPercentage = String.format("%.2f", obtainedPercentage);
            %>
            <td class="value" style="padding-right: 15px"><%=formattedPercentage%> %</td>
        </tr>

       <tr>
    <td class="key" style="padding-left: 15px">Status</td>
    <% 
        double status = Double.parseDouble(student[7].toString());
        String statusText = (status == 1.0) ? "Pass" : "Fail";
        String textColorClass = (status == 1.0) ? "text-success" : "text-danger";
    %>
    <td class="value" style="padding-right: 15px"><span class="<%= textColorClass %>"><%= statusText %></span></td>
</tr>


        <tr>
            <td class="key" style="padding-left: 15px">Date</td>
            <td class="value" style="padding-right: 15px"><%=student[8]%></td>
        </tr>
        <tr class="empty-row" style="border: 0px solid #fff;">
            <td colspan="2"></td>
        </tr>

        <% } %>
    </tbody>
</table>


<%
}
%>
