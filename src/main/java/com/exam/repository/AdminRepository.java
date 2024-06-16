package com.exam.repository;

import java.util.List;

import com.exam.model.AdminModel;

public interface AdminRepository {
	
	public boolean insertAdmin(AdminModel admin);

	boolean loginAdmin(String email, String password);
	
	public List<AdminModel> getAdminsByUsername(String email);
	
	public List<AdminModel> getAllAdmins();
	
	public boolean isDeleteAdminById(int id);
	
	public List<String> getAdminDepartments();
	
    List<AdminModel> getAdminsByDepartment(String department);
    
    boolean updateAdminById(int id, AdminModel admin); 
    
    boolean isLimitedAccessByEmail(String email);


}
