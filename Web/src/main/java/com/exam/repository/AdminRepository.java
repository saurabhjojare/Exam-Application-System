package com.exam.repository;

import java.util.List;

import com.exam.model.AdminModel;

public interface AdminRepository {
	
	public boolean insertAdmin(AdminModel admin);

	boolean loginAdmin(String email, String password);
	
	public List<AdminModel> getAdminsByUsername(String email);

}