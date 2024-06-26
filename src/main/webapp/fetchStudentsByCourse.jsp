<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Optional"%>
<%@ page import="java.util.Collections"%>
<%@ page import="java.util.stream.Collectors"%>
<%@ page import="java.util.Map"%>
<%@ page import="com.exam.service.*"%>
<%@ include file="existingSession.jsp"%>

<%
													
	AdminService adminService = (AdminService) request.getServletContext().getAttribute("adminService");
	// Fetch limited access status using the service method
	boolean isLimitedAccess = adminService.isLimitedAccessByEmail(username);
%>

<%
int courseId = Integer.parseInt(request.getParameter("courseId"));
System.out.println("Received course ID: " + courseId); // Add this debug statement
StudentService fetchDataObj2 = new StudentServiceImpl();
List<String[]> studentData = fetchDataObj2.fetchStudentsByCourse(courseId);

if (studentData.isEmpty()) {
%>
    <div>No students available for this subject.</div>
<%
} else {
    for (String[] student : studentData) {
%>
    <table class="table table-bordered" id="resultsTable">
        <thead></thead>
        <tbody id="resultsBody">
            <tr>
                <td class="key" style="padding-left: 15px">Student ID</td>
                <td class="value" style="padding-right: 15px"><%=student[0]%></td>
            </tr>
            <tr>
                <td class="key" style="padding-left: 15px">Student Name</td>
                <td class="value" style="padding-right: 15px"><%=student[1]%></td>
            </tr>
            <tr>
                <td class="key" style="padding-left: 15px">Email</td>
                <td class="value" style="padding-right: 15px"><%=student[2]%></td>
            </tr>
            <tr>
                <td class="key" style="padding-left: 15px">Contact</td>
                <td class="value" style="padding-right: 15px"><%=student[3]%></td>
            </tr>
            <tr>
                <td class="key" style="padding-left: 15px">Username</td>
                <td class="value" style="padding-right: 15px"><%=student[4]%></td>
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
            </tr>
              <% 
                                                    } 
                                                    %>
        </tbody>
    </table>
<%
    }
}
%>
