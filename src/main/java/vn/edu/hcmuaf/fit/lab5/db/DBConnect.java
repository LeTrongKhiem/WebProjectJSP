package vn.edu.hcmuaf.fit.lab5.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnect {
    private Connection connection;
    private static DBConnect instance;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/dbweb";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    public DBConnect() {

    }

    public static DBConnect getInstance() {
        if (instance == null) {
            instance = new DBConnect();
        }
        return instance;
    }

        public void connect() throws SQLException, ClassNotFoundException {
        if (connection==null || connection.isClosed()){
            Class.forName("com.mysql.cj.jdbc.Driver");

        connection =DriverManager.getConnection(DB_URL,USER ,PASSWORD );
        }
    }
    public Statement get(){
        try {
            connect();
            return connection.createStatement();
        }
        catch (SQLException| ClassNotFoundException e){
            e.printStackTrace();
        }
        return  null;
    }
//    public Connection getConnection() throws Exception {
//        try {
//            Class.forName("com.mysql.jdbc.Driver");
//            Connection connection = DriverManager.getConnection(DB_URL, USER, PASSWORD);
//            return connection;
//        } catch (ClassNotFoundException e) {
//            e.printStackTrace();
//        }
//        return connection;
//    }
    public  Connection getConnection() {
    Connection connection = null;
    String url = "jdbc:mysql://localhost:3306/dbweb";
    String userName = "root";
    String pass = "";
    try {
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(url, userName, pass);
        return connection;
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    }
    return null;
}
}
