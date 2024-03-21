package com.exam.helper;

import java.io.FileInputStream;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.util.Properties;

/**
 * Helper class to manage file paths and properties loading.
 */
public class PathHelper {
    // Complete path for the properties file
    public static String completePath = "";

    // Properties object to hold loaded properties
    public static Properties properties = new Properties();

    // Default file path for the question bank CSV file
    public static final String filePath = "C:\\Users\\Saurabh\\Downloads\\Tech Hub\\Java\\Project\\Exam-Application-System\\src\\com\\exam\\csv\\QuestionBank";

    static {
        // Load properties file upon class initialization
        loadProperties();
    }

    /**
     * Method to load properties from a file.
     */
    private static void loadProperties() {
        try {
            // Get the current directory path
            Path currentDirectoryPath = FileSystems.getDefault().getPath("");
            String currentDirectoryName = currentDirectoryPath.toAbsolutePath().toString();

            // Construct complete path for the properties file
            completePath = currentDirectoryName + FileSystems.getDefault().getSeparator() + "src"
                    + FileSystems.getDefault().getSeparator() + "resources" + FileSystems.getDefault().getSeparator()
                    + "db.properties";

            // Read properties from the file
            FileInputStream finf = new FileInputStream(completePath);
            properties.load(finf);
        } catch (Exception e) {
            // Handle exceptions gracefully
            System.out.println("Error In PathHelper " + e);
        }
    }
}
