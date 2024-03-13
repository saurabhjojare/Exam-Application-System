package resources;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.util.Properties;


public class propertiesLoadingApp {
   public static void main(String x[]) throws IOException {
   Path currentDirectoryPath = FileSystems.getDefault().getPath("");
   String currentDirectoryName = currentDirectoryPath.toAbsolutePath().toString();
   String completePath = currentDirectoryName + "\\src\\resources\\db.properties";
   System.out.println("Current Directory = \"" + completePath + "\"");
   Properties properties = new Properties();
   FileInputStream finf = new FileInputStream(completePath);
   properties.load(finf);
   String driverClassName = properties.getProperty("driverClassName");
   String urlName = properties.getProperty("url");
   String userName = properties.getProperty("userName");
   String password = properties.getProperty("password");

   System.out.println(driverClassName);
   System.out.println(userName);
   System.out.println(password);
   System.out.println(urlName);
   }
}
