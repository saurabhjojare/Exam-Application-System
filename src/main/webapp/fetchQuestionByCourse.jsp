<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Optional"%>
<%@ page import="java.util.Collections"%>
<%@ page import="java.util.stream.Collectors"%>
<%@ page import="java.util.Map"%>
<%@ page import="com.exam.service.QuestionService"%>
<%@ page import="com.exam.service.QuestionServiceImpl"%>

<%
int courseId = Integer.parseInt(request.getParameter("courseId"));
System.out.println("Received course ID: " + courseId); // Add this debug statement
QuestionService fetchDataObj2 = new QuestionServiceImpl();
List<String[]> studentData = fetchDataObj2.fetchQuestionsByCourse(courseId);

if (studentData.isEmpty()) {
%>
    <div>No questions available for this subject.</div>
<%
} else {
	int count = 1;
    for (String[] student : studentData) {
%>
    <table class="table table-bordered" id="resultsTable">
        <thead></thead>
        <tbody id="resultsBody">
         	<tr>
                <td class="key" style="padding-left: 15px">#</td>
                <td class="value" style="padding-right: 15px"><%=count%></td>
            </tr>
            <tr>
                <td class="key" style="padding-left: 15px">Question</td>
                <td class="value" style="padding-right: 15px"><%=student[1]%></td>
            </tr>
      
            <tr>
                <td class="key" style="padding-left: 15px">Option 1</td>
                <td class="value" style="padding-right: 15px"><%=student[2]%></td>
            </tr>
            <tr>
                <td class="key" style="padding-left: 15px">Option 2</td>
                <td class="value" style="padding-right: 15px"><%=student[3]%></td>
            </tr>
            <tr>
                <td class="key" style="padding-left: 15px">Option 3</td>
                <td class="value" style="padding-right: 15px"><%=student[4]%></td>
            </tr>
            <tr>
                <td class="key" style="padding-left: 15px">Option 4</td>
                <td class="value" style="padding-right: 15px"><%=student[5]%></td>
            </tr>
             <tr>
                <td class="key" style="padding-left: 15px">Answer</td>
                <td class="value" style="padding-right: 15px"><%=student[6]%></td>
            </tr>
            <tr>
                <td class="key" style="padding-left: 15px">Edit</td>
                <td>
                    <button class="btn btn-primary" disabled>Update</button> 
                    <a href='deleteQuestion?id=<%=student[0]%>'><button class="btn btn-danger">Delete</button></a>
                </td>
            </tr>
        </tbody>
    </table>
<%
count++;
    }
}
%>
