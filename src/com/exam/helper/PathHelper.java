package com.exam.helper;

import java.io.FileInputStream;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.util.Properties;

public class PathHelper {
    public static String completePath = "";
    public static Properties properties = new Properties();
    public static final String filePath = "C:\\Users\\Saurabh\\Downloads\\Tech Hub\\Java\\Project\\Exam-Application-System\\src\\com\\exam\\csv\\QuestionBank";

    static {
        loadProperties();
    }

    private static void loadProperties() {
        try {
            Path currentDirectoryPath = FileSystems.getDefault().getPath("");
            String currentDirectoryName = currentDirectoryPath.toAbsolutePath().toString();
            completePath = currentDirectoryName + FileSystems.getDefault().getSeparator() + "src"
                    + FileSystems.getDefault().getSeparator() + "resources" + FileSystems.getDefault().getSeparator()
                    + "db.properties";
            FileInputStream finf = new FileInputStream(completePath);
            properties.load(finf);
        } catch (Exception e) {
            System.out.println("Error In PathHelper " + e);
        }
    }
}
