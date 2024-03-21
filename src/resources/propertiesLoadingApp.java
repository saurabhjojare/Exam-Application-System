package resources;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.util.Properties;

public class propertiesLoadingApp {
    public static void main(String x[]) throws IOException {
        // Get the current directory path
        Path currentDirectoryPath = FileSystems.getDefault().getPath("");
        // Convert the path to string
        String currentDirectoryName = currentDirectoryPath.toAbsolutePath().toString();
        // Construct the complete path to the properties file
        String completePath = currentDirectoryName + "\\src\\resources\\db.properties";
        // Print the current directory path
        System.out.println("Current Directory = \"" + completePath + "\"");

        // Create a Properties object to hold the properties
        Properties properties = new Properties();
        // Create a FileInputStream to read the properties file
        FileInputStream finf = new FileInputStream(completePath);
        // Load the properties from the file
        properties.load(finf);

        // Retrieve properties from the loaded file
        String driverClassName = properties.getProperty("driverClassName");
        String urlName = properties.getProperty("url");
        String userName = properties.getProperty("userName");
        String password = properties.getProperty("password");

        // Print the properties
        System.out.println(driverClassName);
        System.out.println(userName);
        System.out.println(password);
        System.out.println(urlName);
    }
}
