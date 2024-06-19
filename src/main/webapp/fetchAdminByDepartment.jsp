<%@ page import="java.util.*" %>
<%@ page import="com.exam.service.AdminService" %>
<%@ page import="com.exam.service.AdminServiceImpl" %>
<%@ page import="com.exam.model.AdminModel" %>
<%@ page import="com.exam.repository.AdminRepository" %>
<%@ page import="com.exam.repository.AdminRepositoryImpl" %>
<%@ include file="existingSession.jsp"%>

<%
    String department = request.getParameter("courseId");
	

    if (department != null && !department.isEmpty()) {
    	AdminRepository adminRepository = new AdminRepositoryImpl();
    	AdminService adminService = new AdminServiceImpl(adminRepository);
    	boolean isLimitedAccess = adminService.isLimitedAccessByEmail(username);
     
        List<AdminModel> adminList = adminService.getAdminsByDepartment(department);

        if (adminList != null && !adminList.isEmpty()) {
            int count = 1;
%>      
            <table class="table table-bordered table-rounded">
                <thead>
                    <!-- Assuming your table has headers -->
                </thead>
                <tbody>
                    <%
                        for (AdminModel admin : adminList) {
                    %>
                    <tr>
                        <td class="key" style="padding-left: 15px">#</td>
                        <td class="value" style="padding-right: 15px"><%= count %></td>
                    </tr>
                    <tr>
                        <td class="key" style="padding-left: 15px">Full Name</td>
                        <td class="value" style="padding-right: 15px"><%= admin.getfullName() %></td>
                    </tr>
                    <tr>
                        <td class="key" style="padding-left: 15px">Contact</td>
                        <td class="value" style="padding-right: 15px"><%= admin.getContact() %></td>
                    </tr>
                    <tr>
                        <td class="key" style="padding-left: 15px">Email</td>
                        <td class="value" style="padding-right: 15px"><%= admin.getEmail() %></td>
                    </tr>
                    <tr>
                        <td class="key" style="padding-left: 15px">Role</td>
                        <td class="value" style="padding-right: 15px"><%= admin.getRole() %></td>
                    </tr>
                    <tr>
                        <td class="key" style="padding-left: 15px">Department</td>
                        <td class="value" style="padding-right: 15px"><%= admin.getDepartment() %></td>
                    </tr>
                     <tr>
                        <td class="key" style="padding-left: 15px">Permission</td>
                        <td class="value" style="padding-right: 15px"><%= admin.getPermissions() %></td>
                    </tr>
                    <% 
                                                    if (!isLimitedAccess) { 
                    %>
                    <tr>
                        <td class="key" style="padding-left: 15px">Edit</td>
                        <td>
                            <button class="btn btn-primary" disabled>Update</button>
                            <a href='deleteAdmin?id=<%= admin.getId() %>' class="btn btn-danger">Delete</a>
                        </td>
                    </tr>
                    	   <% 
                              } 
                             %>
                    <tr class="empty-row" style="border:0px solid #fff;">
                        <td colspan="2"></td>
                    </tr>
                    <%
                        count++;
                        }
                    %>
                </tbody>
            </table>
<%
        } else {
%>
            <p>No admin found for the selected department.</p>
<%
        }
    } else {
%>
        <p>No department selected.</p>
<%
    }
%>
