package vn.edu.hcmuaf.fit.lab5.db;


import java.io.IOException;
import java.util.Properties;

public class DBProperties {
    private static Properties props = new Properties();
    static{

        try{
            props.load(DBProperties.class.getClassLoader().getResourceAsStream("db.properties"));
        }catch (IOException ioException){
            ioException.printStackTrace();
        }
    }
    public  static  String getHost(){
        return props.get("db.host").toString();
    }
    public static String getPort(){
        return props.get("db.port").toString();
    }
    public static String getUsername(){
        return props.get("db.username").toString();
    }
    public static String getPassword(){
        return props.get("db.password").toString();
    }
    public static String getDbOptions(){
        return props.get("db.options").toString();
    }
    public static String getDatabaseName(){
        return props.get("db.databaseName").toString();
    }
}
