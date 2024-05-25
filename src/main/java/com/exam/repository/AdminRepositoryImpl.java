package com.exam.repository;

import com.exam.config.DBConfig;
import com.exam.model.AdminModel;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class AdminRepositoryImpl extends DBConfig implements AdminRepository {

    // Method to insert an admin into the admin table
    @Override
    public boolean insertAdmin(AdminModel admin) {
        boolean success = false;
        PreparedStatement stmt = null;

        try {
            String query = "INSERT INTO admin (fullName, password, contact, email, role, department, permissions) VALUES (?, ?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, admin.getfullName());
            stmt.setString(2, admin.getPassword()); // Remember to hash the password before storing it
            stmt.setString(3, admin.getContact());
            stmt.setString(4, admin.getEmail());
            stmt.setString(5, admin.getRole());
            stmt.setString(6, admin.getDepartment());
            stmt.setString(7, admin.getPermissions());

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                success = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return success;
    }

    // Method to check if an admin with the given username and password exists
    @Override
    public boolean loginAdmin(String email, String password) {
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            String query = "SELECT * FROM admin WHERE email = ? AND password = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, email);
            stmt.setString(2, password); // Remember to hash the password before comparing

            rs = stmt.executeQuery();
            return rs.next(); // If a row is returned, the admin exists with the given credentials
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    
 // Method to fetch admin details based on username and return a list
    @Override
    public List<AdminModel> getAdminsByUsername(String email) {
        List<AdminModel> admins = new ArrayList<>();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            String query = "SELECT * FROM admin WHERE email = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, email);

            rs = stmt.executeQuery();
            while (rs.next()) {
                AdminModel admin = new AdminModel();
                admin.setId(rs.getInt("id"));
                admin.setfullName(rs.getString("fullName"));
                // Exclude fetching password here for security reasons
                admin.setContact(rs.getString("contact"));
                admin.setEmail(rs.getString("email"));
                admin.setRole(rs.getString("role"));
                admin.setDepartment(rs.getString("department"));
                admin.setPermissions(rs.getString("permissions"));
                admins.add(admin);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return admins;
    }
    
    
 // Method to fetch all admin details and return a list
    @Override
    public List<AdminModel> getAllAdmins() {
        List<AdminModel> admins = new ArrayList<>();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            String query = "SELECT * FROM admin";
            stmt = conn.prepareStatement(query);

            rs = stmt.executeQuery();
            while (rs.next()) {
                AdminModel admin = new AdminModel();
                admin.setId(rs.getInt("id"));
                admin.setfullName(rs.getString("fullName"));
                // Exclude fetching password here for security reasons
                admin.setContact(rs.getString("contact"));
                admin.setEmail(rs.getString("email"));
                admin.setRole(rs.getString("role"));
                admin.setDepartment(rs.getString("department"));
                admin.setPermissions(rs.getString("permissions"));
                admins.add(admin);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return admins;
    }
    
    @Override
	public boolean isDeleteAdminById(int id) {
		try {
			stmt = conn.prepareStatement("DELETE FROM admin WHERE id = ?");
			stmt.setInt(1, id);
			int value = stmt.executeUpdate();
			return value > 0;
		} catch (Exception ex) {
			System.out.println(ex);
			return false;
		}
	}

}
