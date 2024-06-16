package com.exam.repository;

import com.exam.config.DBConfig;
import com.exam.model.AdminModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminRepositoryImpl extends DBConfig implements AdminRepository {
	PreparedStatement stmt;

	@Override
	public boolean insertAdmin(AdminModel admin) {
	    boolean success = false;
	    PreparedStatement stmt = null;

	    try {
	        String query = "INSERT INTO admin (fullName, password, contact, email, role, department, permissions) VALUES (?, ?, ?, ?, ?, ?, ?)";
	        stmt = getConnection().prepareStatement(query);
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


    @Override
    public boolean loginAdmin(String email, String password) {
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            String query = "SELECT * FROM admin WHERE email = ? AND password = ?";
            stmt = getConnection().prepareStatement(query);
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
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    
    
    @Override
    public List<AdminModel> getAdminsByUsername(String email) {
        List<AdminModel> admins = new ArrayList<>();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            String query = "SELECT * FROM admin WHERE email = ?";
            stmt = getConnection().prepareStatement(query);
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
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
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
    public List<AdminModel> getAllAdmins() {
        List<AdminModel> admins = new ArrayList<>();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            String query = "SELECT * FROM admin";
            stmt = getConnection().prepareStatement(query);

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
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
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
            stmt = getConnection().prepareStatement("DELETE FROM admin WHERE id = ?");
            stmt.setInt(1, id);
            int value = stmt.executeUpdate();
            return value > 0;
        } catch (Exception ex) {
            System.out.println(ex);
            return false;
        } finally {
            // Close resources in the finally block to ensure they are always closed
            try {
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException ex) {
                System.out.println("Error closing resources: " + ex);
            }
        }
    }

    @Override
    public List<String> getAdminDepartments() {
        List<String> adminDepartments = new ArrayList<>();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            String query = "SELECT DISTINCT department FROM admin";
            stmt = getConnection().prepareStatement(query);

            rs = stmt.executeQuery();
            while (rs.next()) {
                adminDepartments.add(rs.getString("department"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return adminDepartments;
    }

    
    @Override
    public List<AdminModel> getAdminsByDepartment(String department) {
        List<AdminModel> admins = new ArrayList<>();
        String query = "SELECT * FROM admin WHERE department = ?";
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try (Connection connection = getConnection()) {
            stmt = connection.prepareStatement(query);
            stmt.setString(1, department);
            rs = stmt.executeQuery();
            while (rs.next()) {
                AdminModel admin = new AdminModel();
                admin.setId(rs.getInt("id"));
                admin.setfullName(rs.getString("fullName"));
                admin.setPassword(rs.getString("password"));
                admin.setContact(rs.getString("contact"));
                admin.setEmail(rs.getString("email"));
                admin.setRole(rs.getString("role"));
                admin.setDepartment(rs.getString("department"));
                admin.setPermissions(rs.getString("permissions"));
                admins.add(admin);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Consider logging the exception
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return admins;
    }


    
    @Override
    public boolean updateAdminById(int id, AdminModel admin) {
        boolean success = false;
        PreparedStatement stmt = null;

        try {
            StringBuilder query = new StringBuilder("UPDATE admin SET fullName = ?, email = ?, contact = ?");
            if (admin.getPassword() != null && !admin.getPassword().isEmpty()) {
                query.append(", password = ?");
            }
            query.append(" WHERE id = ?");

            stmt = getConnection().prepareStatement(query.toString());
            stmt.setString(1, admin.getfullName());
            stmt.setString(2, admin.getEmail());
            stmt.setString(3, admin.getContact());

            int parameterIndex = 4;
            if (admin.getPassword() != null && !admin.getPassword().isEmpty()) {
                stmt.setString(parameterIndex++, admin.getPassword());
            }
            stmt.setInt(parameterIndex, id);

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
    
    @Override
	public boolean isLimitedAccessByEmail(String email) {
	    PreparedStatement stmt = null;
	    ResultSet rs = null;

	    try {
	        String query = "SELECT permissions FROM admin WHERE email = ?";
	        stmt = getConnection().prepareStatement(query);
	        stmt.setString(1, email);

	        rs = stmt.executeQuery();
	        if (rs.next()) {
	            String permissions = rs.getString("permissions");
	            return "Limited Access".equals(permissions);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) {
	                rs.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        try {
	            if (stmt != null) {
	                stmt.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    return false;
	}



}
