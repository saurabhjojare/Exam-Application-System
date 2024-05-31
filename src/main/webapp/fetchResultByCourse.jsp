<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.exam.service.ExamService" %>
<%@ page import="com.exam.service.ExamServiceImpl" %>
<%@ page import="java.util.List" %>

<%
int courseId = Integer.parseInt(request.getParameter("courseId"));
ExamService fetchDataObj2 = new ExamServiceImpl();
List<String[]> resultData = fetchDataObj2.fetchResultByCourse(courseId);

if (resultData.isEmpty()) {
%>
    <div>No result available for this course.</div>
<%
} else {
	 int counter = 1;
%>
    <table class="table table-bordered" id="resultsTable">
        <thead>
           
        </thead>
        <tbody id="resultsBody">
<%
    for (String[] student : resultData) {
%>
				
			<tr>
							<td class="key" style="padding: 15px">#</td>
							<td class="value" style="padding: 15px"><%= counter %></td>
			</tr>
			
			<tr>
							<td class="key" style="padding-left: 15px">Student Name</td>
							<td class="value" style="padding-right: 15px"><%= student[0] %></td>
			</tr>
			
			<tr>
							<td class="key" style="padding-left: 15px">Email</td>
							<td class="value" style="padding-right: 15px"><%= student[1] %></td>
			</tr>
			
			<tr>
							<td class="key" style="padding-left: 15px">Contact</td>
							<td class="value" style="padding-right: 15px"><%= student[2] %></td>
			</tr>
			
			<tr>
							<td class="key" style="padding-left: 15px">Exam</td>
							<td class="value" style="padding-right: 15px"><%= student[4] %></td>
			</tr>
			
			<tr>
							<td class="key" style="padding-left: 15px">Subject</td>
							<td class="value" style="padding-right: 15px"><%= student[5] %></td>
			</tr>
			
			<tr>
							<td class="key" style="padding-left: 15px">Marks</td>
							<%
							double obtainedPercentage = Double.parseDouble(student[6]);
							String formattedPercentage = String.format("%.2f", obtainedPercentage);
							%>
							<td class="value" style="padding-right: 15px"><%=formattedPercentage%>
								%</td>
			</tr>
			
			<tr>
							<td class="key" style="padding-left: 15px">Status</td>
							<%
							double status = Double.parseDouble(student[7]);
							String statusText = (status == 1.0) ? "Pass" : "Fail";
							%>
							<td class="value" style="padding-right: 15px"><%=statusText%></td>
					
						
			</tr>
			
			<tr>
							<td class="key" style="padding-left: 15px">Date</td>
							<td class="value" style="padding-right: 15px"><%= student[8] %></td>
							<tr class="empty-row" style = "border:0px solid #fff;">
							<td colspan="2"></td>
			</tr>
						
						
<!--             <tr> -->
<%--                 <td><%= student[0] %></td> --%>
<%--                 <td><%= student[1] %></td> --%>
<%--                 <td><%= student[2] %></td> --%>
<%--                 <td><%= student[3] %></td> --%>
<%--                 <td><%= student[4] %></td> --%>
<%--                 <td><%= student[5] %></td> --%>
<%--                 <td><%= student[6] %></td> --%>
<%--                 <td><%= student[7] %></td> --%>
<%--                 <td><%= student[8] %></td> --%>
<!--             </tr> -->
<%
    }
%>
        </tbody>
    </table>
<%
}
%>
