package com.exam.service;

import java.util.List;

import com.exam.model.AdminModel;
import com.exam.model.StudentModel;
import com.exam.repository.AdminRepository;

public class AdminServiceImpl implements AdminService {

	private AdminRepository adminRepository;

	// Constructor to inject AdminRepository dependency
	public AdminServiceImpl(AdminRepository adminRepository) {
		this.adminRepository = adminRepository;
	}

	@Override
	public boolean insertAdmin(AdminModel admin) {
		// Call the repository method to insert admin into the database
		return adminRepository.insertAdmin(admin);
	}

	@Override
	public boolean loginAdmin(String email, String password) {
		// Call the repository method to check if the admin login credentials are valid
		return adminRepository.loginAdmin(email, password);
	}

	 @Override
	    public List<AdminModel> getAdminsByUsername(String email) {
	        // Call the repository method to get admins by username
	        return adminRepository.getAdminsByUsername(email);
	    }

	@Override
	public List<AdminModel> getAllAdmins() {
		// TODO Auto-generated method stub
		return adminRepository.getAllAdmins();
	}

	@Override
	public boolean isDeleteAdminById(int id) {
		// TODO Auto-generated method stub
		return adminRepository.isDeleteAdminById(id);
	}

	@Override
	public List<String> getAdminDepartments() {
		// TODO Auto-generated method stub
		return adminRepository.getAdminDepartments();
	}

	@Override
	public List<AdminModel> getAdminsByDepartment(String department) {
		// TODO Auto-generated method stub
		return adminRepository.getAdminsByDepartment(department);
	}

	@Override
	public boolean updateAdminById(int id, AdminModel admin) {
		// TODO Auto-generated method stub
		return adminRepository.updateAdminById(id, admin);
	}
	
	 public boolean isLimitedAccessByEmail(String email) {
		 return adminRepository.isLimitedAccessByEmail(email);
	 }

	@Override
	public List<AdminModel> getAllSecrete() {
		// TODO Auto-generated method stub
		return adminRepository.getAllSecrete();
	}
}
