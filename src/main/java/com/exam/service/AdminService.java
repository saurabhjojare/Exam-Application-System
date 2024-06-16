package com.exam.service;

import java.util.List;

import com.exam.model.AdminModel;

public interface AdminService {
	public boolean insertAdmin(AdminModel admin);
	boolean loginAdmin(String email, String password);
	public List<AdminModel> getAdminsByUsername(String email);
	public List<AdminModel> getAllAdmins();
	public boolean isDeleteAdminById(int id);
	List<AdminModel> getAdminsByDepartment(String department);
	public List<String> getAdminDepartments();
	boolean updateAdminById(int id, AdminModel admin); 
	public boolean isLimitedAccessByEmail(String email);
}
