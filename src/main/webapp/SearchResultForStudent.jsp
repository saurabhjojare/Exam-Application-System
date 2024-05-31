<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.exam.service.StudentService"%>
<%@ page import="com.exam.service.StudentServiceImpl"%>

<style>
.TableMob{
    display: none;
}

@media (max-width: 800.98px) { 
    .TableDesk{
        display: none;
    }

    .TableMob{
        display: block;
    }
}
</style>

<%
String userInput = request.getParameter("userInput");
System.out.println("Received course ID: " + userInput);

StudentService fetchDataObj2 = new StudentServiceImpl();
List<Object[]> studentData = fetchDataObj2.searchResultByUserInput(userInput);
%>

<% if (studentData.isEmpty()) { %>
    <div>No students available for this course.</div>
<% } else { %>
    <% int counter = 1; %>
    <% for (Object[] student : studentData) { 
    	String status = (Double.parseDouble(student[4].toString()) >= 1.0) ? "Pass" : "Fail"; 
    %>
        <div class="TableMob">
            <table class="table table-bordered" id="resultsTable">
                <thead></thead>
                <tbody id="resultsBody">
                    <tr>
                        <td class="key" style="padding-left: 15px">#</td>
                        <td class="value" style="padding-right: 15px"><%= counter++ %></td>
                    </tr>
                    <tr>
                        <td class="key" style="padding-left: 15px">Exam Name</td>
                        <td class="value" style="padding-right: 15px"><%= student[0] %></td>
                    </tr>
                    <tr>
                        <td class="key" style="padding-left: 15px">Subject</td>
                        <td class="value" style="padding-right: 15px"><%= student[1] %></td>
                    </tr>
                    <tr>
                        <td class="key" style="padding-left: 15px">Exam Date</td>
                        <td class="value" style="padding-right: 15px"><%= student[2] %></td>
                    </tr>
                    <tr>
                        <td class="key" style="padding-left: 15px">Marks</td>
                        <td class="value" style="padding-right: 15px"><%= student[3] %></td>
                    </tr>
                    <tr>
                        <td class="key" style="padding-left: 15px">Status</td>
                        <td class="value" style="padding-right: 15px"><%= status %></td>
                    </tr>
                </tbody>
            </table>
        </div>
    <% } %>
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
                <% int counter2 = 1; %>
                <% for (Object[] student : studentData) { 
                	String status = (Double.parseDouble(student[4].toString()) >= 1.0) ? "Pass" : "Fail"; 
                %>
                    <tr>
                        <td class="value" style="padding-right: 15px"><%= counter2++ %></td>
                        <td class="value" style="padding-right: 15px"><%= student[0] %></td>
                        <td class="value" style="padding-right: 15px"><%= student[1] %></td>
                        <td class="value" style="padding-right: 15px"><%= student[2] %></td>
                        <td class="value" style="padding-right: 15px"><%= student[3] %></td>
                        <td class="value" style="padding-right: 15px"><%= status %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
<% } %>
