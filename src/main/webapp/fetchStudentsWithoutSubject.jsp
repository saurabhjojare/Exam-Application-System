<%@ page import="com.exam.service.*" %>
<%@ page import="com.exam.model.StudentModel" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="existingSession.jsp"%>
<%
													
	AdminService adminService = (AdminService) request.getServletContext().getAttribute("adminService");
	// Fetch limited access status using the service method
	boolean isLimitedAccess = adminService.isLimitedAccessByEmail(username);
%>
	<%
    // Fetch unselected students using the service layer
    StudentService studentService = new StudentServiceImpl();
    List<String[]> unselectedStudents = studentService.fetchStudentsWithoutSubjects(); // No argument provided
%>

<!-- Render unselected students in HTML format -->
<% if (unselectedStudents != null && !unselectedStudents.isEmpty()) { %>
    <table class="table table-bordered" id="resultsTable">
        <thead>
           
        </thead>
        <tbody id="resultsBody">
            <% for (String[] student : unselectedStudents) { %>
            <tr>
                <td class="key" style="padding-left: 15px">#</td>
                <td class="value" style="padding-right: 15px"><%= student[0] %></td>
            </tr>
            <tr>
                <td class="key" style="padding-left: 15px">Name</td>
                <td class="value" style="padding-right: 15px"><%= student[1] %></td>
            </tr>
            <tr>
                <td class="key" style="padding-left: 15px">Email</td>
                <td class="value" style="padding-right: 15px"><%= student[2] %></td>
            </tr>
            <tr>
                <td class="key" style="padding-left: 15px">Contact</td>
                <td class="value" style="padding-right: 15px"><%= student[3] %></td>
            </tr>
            <tr>
                <td class="key" style="padding-left: 15px">Username</td>
                <td class="value" style="padding-right: 15px"><%= student[4] %></td>
            </tr>
            <% 
                                                    if (!isLimitedAccess) { 
                                                    %>
            <tr>
                <td class="key" style="padding-left: 15px">Edit</td>
                <td>
                    <button class="btn btn-primary" disabled>Update</button> <a
                    href='deleteStudent?id=<%=student[0]%>'><button class="btn btn-danger">Delete</button></a>
                </td>
                   <% 
                                                    } 
                                                    %>
                                                    
                <tr class="empty-row" style = "border:0px solid #fff;">
				<td colspan="2"></td>
            </tr>
<!--                 <tr> -->
<%--                     <td><%= student[0] %></td> --%>
<%--                     <td><%= student[1] %></td> --%>
<%--                     <td><%= student[2] %></td> --%>
<%--                     <td><%= student[3] %></td> --%>
<%--                     <td><%= student[4] %></td> --%>
<!--                 </tr> -->
            <% } %>
        </tbody>
    </table>
<% } else { %>
    <p>No unselected students found.</p>
<% } %>