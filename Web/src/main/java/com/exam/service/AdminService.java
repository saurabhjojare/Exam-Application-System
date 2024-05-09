package com.exam.service;

import java.util.List;

import com.exam.model.AdminModel;

public interface AdminService {
	public boolean insertAdmin(AdminModel admin);
	boolean loginAdmin(String email, String password);
	public List<AdminModel> getAdminsByUsername(String email);
}
