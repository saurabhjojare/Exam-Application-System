<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="com.exam.service.ExamService"%>
<%@ page import="com.exam.service.ExamServiceImpl"%>

<%
    String courseId = request.getParameter("courseId");

    if (courseId != null && !courseId.isEmpty()) {
        ExamServiceImpl examRepo = new ExamServiceImpl();
        int courseID = Integer.parseInt(courseId);
        List<String[]> scheduleData = examRepo.fetchScheduleBySid(courseID);

        if (scheduleData != null && !scheduleData.isEmpty()) {
        int count = 1;
%>		
            <table class="table table-bordered">
                <thead>
                   
                </thead>
                <tbody>
                    <%
                        for (String[] row : scheduleData) {
                    %>
                    <tr>
							<td class="key" style="padding-left: 15px">#</td>
							<td class="value" style="padding-right: 15px"><%= count %></td>
					</tr>
                    <tr>
							<td class="key" style="padding-left: 15px">Exam</td>
							<td class="value" style="padding-right: 15px"><%= row[0] %></td>
					</tr>
					<tr>
							<td class="key" style="padding-left: 15px">Subject</td>
							<td class="value" style="padding-right: 15px"><%= row[4] %></td>
					</tr>
					<tr>
							<td class="key" style="padding-left: 15px">Date</td>
							<td class="value" style="padding-right: 15px"><%= row[1] %></td>
					</tr>
					<tr>
							<td class="key" style="padding-left: 15px">Star Time</td>
							<td class="value" style="padding-right: 15px"><%= row[2] %></td>
					</tr>
					<tr>
							<td class="key" style="padding-left: 15px">End Time</td>
							<td class="value" style="padding-right: 15px"><%= row[3] %></td>
							
					</tr>
					
					<tr>
							<td class="key" style="padding-left: 15px">Edit</td>
							<td>
								<button class="btn btn-primary" disabled>Update</button> <a
								href='deleteSchedule?id=<%= row[5] %>' class="btn btn-danger">Delete</a>
							</td>
							<tr class="empty-row" style = "border:0px solid #fff;">
							<td colspan="2"></td>
					</tr>
<!--                         <tr> -->
<%--                             <td><%= row[0] %></td> --%>
<%--                             <td><%= row[1] %></td> --%>
<%--                             <td><%= row[2] %></td> --%>
<%--                             <td><%= row[3] %></td> --%>
<%--                             <td><%= row[4] %></td> --%>
<%--                             <td><%= row[5] %></td> --%>
<!--                         </tr> -->
                    <%
                     count++;
                        }
                    %>
                </tbody>
            </table>
<%
        } else {
%>
            <p>No schedules found for the selected course.</p>
<%
        }
    } else {
%>
        <p>Invalid course ID.</p>
<%
    }
%>
