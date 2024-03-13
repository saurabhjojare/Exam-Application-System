package com.exam.helper;

import java.io.FileInputStream;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.util.Properties;

public class PathHelper {
    public static String completePath =  "";
    public static Properties properties = new Properties();

    public PathHelper() {
        try {
            Path currentDirectoryPath = FileSystems.getDefault().getPath("");
            String currentDirectoryName = currentDirectoryPath.toAbsolutePath().toString();
            completePath = currentDirectoryName + "\\src\\resources\\db.properties";
            FileInputStream finf = new FileInputStream(completePath);
            properties.load(finf);
        } catch (Exception e) {
            System.out.println(e);
        }
       
    }
}