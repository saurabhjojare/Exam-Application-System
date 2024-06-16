package com.exam.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DBConfig {

    private static final Logger logger = LoggerFactory.getLogger(DBConfig.class);
    private static HikariDataSource dataSource;

    static {
        HikariConfig config = new HikariConfig();
        config.setJdbcUrl("jdbc:mysql://localhost:3306/ExamApplicationSystem");
        config.setUsername("root");
        config.setPassword("root");
        // config.setJdbcUrl("jdbc:mysql://localhost:3306/smprowor_examapplicationsystem");
        // config.setUsername("smprowor_saurabh");
        // config.setPassword("ViT^O5=yk?.B");
        config.setDriverClassName("com.mysql.cj.jdbc.Driver");
        config.setMaximumPoolSize(250);
        config.setMinimumIdle(25);
        config.setConnectionTimeout(30000); // 30 seconds
        config.setIdleTimeout(600000);      // 10 minutes
        config.setMaxLifetime(1800000);     // 30 minutes
        config.setLeakDetectionThreshold(60000); // 2 seconds

        dataSource = new HikariDataSource(config);
    }

    public DBConfig() {
        try (Connection conn = dataSource.getConnection()) {
            ensureAdminUserExists(conn);
        } catch (SQLException ex) {
            logger.error("Error initializing DBConfig", ex);
        }
    }

    private void ensureAdminUserExists(Connection conn) {
        String checkQuery = "SELECT COUNT(*) FROM admin WHERE email = ?";
        String insertQuery = "INSERT INTO admin (fullName, password, contact, email, role, department, permissions) VALUES (?, ?, ?, ?, ?, ?, ?)";

        String fullName = "Saurabh Jojare";
        String password = "Saurabh@9898"; // Ideally, this should be a hashed password
        String contact = "+917083900700";
        String email = "saurabh.jojare@gmail.com";
        String role = "Administrator";
        String department = "IT Department";
        String permissions = "Full Access";

        try (PreparedStatement checkStmt = conn.prepareStatement(checkQuery)) {
            checkStmt.setString(1, email);

            try (ResultSet rs = checkStmt.executeQuery()) {
                if (rs.next() && rs.getInt(1) == 0) {
                    try (PreparedStatement insertStmt = conn.prepareStatement(insertQuery)) {
                        insertStmt.setString(1, fullName);
                        insertStmt.setString(2, password);
                        insertStmt.setString(3, contact);
                        insertStmt.setString(4, email);
                        insertStmt.setString(5, role);
                        insertStmt.setString(6, department);
                        insertStmt.setString(7, permissions);

                        insertStmt.executeUpdate();
                    }
                } else {
                    logger.info("Admin user already exists: " + email);
                }
            }
        } catch (SQLException ex) {
            logger.error("Error ensuring admin user exists", ex);
        }
    }

    public static Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }
}