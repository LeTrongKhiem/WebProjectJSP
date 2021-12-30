package com.example.webproject.DAO;

import com.example.webproject.BEAN.User;
import com.example.webproject.DB.DBConnection;
import com.example.webproject.service.SendEmail;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserDAO implements ObjectDAO {
    private static UserDAO instance;

    public static UserDAO getInstance() {//single ton
        if (instance == null) {
            instance = new UserDAO();
        }
        return instance;
    }

    public User getInfoUser(String emailUser) {
        User user = new User();
        try {
            ResultSet resultSet = new DBConnection().selectData("select * from `user`(HoTen, Email, Sdt, GioiTinh, Ngaysinh, Thang, Nam, MatKhau, NhapLaiMK) where Email = '" + emailUser + "'");

            while (resultSet.next()) {
                String name = resultSet.getString(1);
                String email = resultSet.getString(2);
                String phone = resultSet.getString(3);
                String gender = resultSet.getString(4);
                String date = resultSet.getString(5);
                String month = resultSet.getString(6);
                String year = resultSet.getString(7);
                String password = resultSet.getString(8);
                String re_password = resultSet.getString(9);
                return new User(name, email, phone, gender, date, month, year, password, re_password);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }//get info user in database

    @Override
    public boolean checkLogin(String email, String password) {
        try {
            ResultSet resultSet = new DBConnection().selectData("select * from `user` where Email = '" + email + "'");

            while (resultSet.next()) {
                if (resultSet.getString("Email").equals(email) && resultSet.getString("MatKhau").equals(password)) {
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }// check login v1

    @Override
    public boolean addUser(Object obj) { //add user to database
        User user = (User) obj;
        try {
            String sql = "insert into `user`(HoTen, Email, Sdt, GioiTinh, Ngaysinh, Thang, Nam, MatKhau, NhapLaiMK) values ('" + user.getName() + "', '" + user.getEmail() + "','"
                    + user.getPhone() + "','" + user.getGender() + "', '" + user.getDate() + "','"
                    + user.getMonth() + "','" + user.getYear() + "', '" + user.getPassword() + "','" + user.getRe_password() + "')";
            new DBConnection().executeSQL(sql);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public void register(User user) {
        Connection connection = DBConnection.getConnection();
        try {
            String sql = "insert into `user`(HoTen, Email, Sdt, GioiTinh, Ngaysinh, Thang, Nam, MatKhau, NhapLaiMK) values (?,?,?,?,?,?,?,?,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getPhone());
//            statement.setString(4, user.getGender());
            if (user.getGender().equals("1")) {
                statement.setString(4, "Nam");
            } else {
                statement.setString(4, "Nữ");
            }
            statement.setString(5, user.getDate());
            statement.setString(6, user.getMonth());
            statement.setString(7, user.getYear());
            statement.setString(8, user.getPassword());
            statement.setString(9, user.getRe_password());
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String registerUser(User user) {
        Connection connection = DBConnection.getConnection();
        try {
            String sql = "insert into `user`(HoTen, Email, Sdt, GioiTinh, Ngaysinh, Thang, Nam, MatKhau, NhapLaiMK, Code) values (?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getPhone());
            if (user.getGender().equals("1")) {
                statement.setString(4, "Nam");
            } else {
                statement.setString(4, "Nữ");
            }
            statement.setString(5, user.getDate());
            statement.setString(6, user.getMonth());
            statement.setString(7, user.getYear());
            statement.setString(8, user.getPassword());
            statement.setString(9, user.getRe_password());
            statement.setString(10, user.getCode());
            int i = statement.executeUpdate();
            if (i != 0) {
                SendEmail sendEmail = new SendEmail(user.getEmail(), user.getCode());
                sendEmail.sendEmail();
                return "Success";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "Error";
    }

    @Override
    public boolean editPassword(User user) {//method edit password user
        Connection connection = DBConnection.getConnection();
        String sql = "update `user` set MatKhau='" + user.getPassword() + "', DiaChi = '" + user.getAddress() + "' where Email = '" + user.getEmail() + "'";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Map<String, User> listUser() {
        Map<String, User> list = new HashMap<>();
        Connection connection = DBConnection.getConnection();
        try {
            String sql = "select HoTen, Email, Sdt, GioiTinh, Ngaysinh, Thang, Nam, Matkhau, NhapLaiMK from `user` where Active='1'";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString(1);
                String email = resultSet.getString(2);
                String phone = resultSet.getString(3);
                String gender = resultSet.getString(4);
                String date = resultSet.getString(5);
                String month = resultSet.getString(6);
                String year = resultSet.getString(7);
                String password = resultSet.getString(8);
                String re_password = resultSet.getString(9);
                User user = new User(name, email, phone, gender, date, month, year, password, re_password);
                list.put(email, user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }//get list user map database

    public boolean login(String email, String password) { //checkloginv2
        Map<String, User> list = listUser();
        if (list.containsKey(email) && list.get(email).getPassword().equals(password)) {
            return true;
        }
        return false;
    }

    public String hashPassword(String password) {//method hash password
        try {
            MessageDigest sha256 = null;
            sha256 = MessageDigest.getInstance("SHA-256");
            byte[] hash = sha256.digest(password.getBytes());
            BigInteger number = new BigInteger(1, hash);
            return number.toString(16);
        } catch (NoSuchAlgorithmException e) {
            return null;
        }
    }

    public List<String> getListEmail() {
        List<String> listEmail = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        try {
            String sql = "select Email from `user`";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                listEmail.add(resultSet.getString("Email"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listEmail;
    }

    public static void main(String[] args) {//test
        User user = new User("khiem", "khiem2001@gmail.com", "0123456", "Nam", "16", "04", "2001", "123456", "123456");
//        System.out.println(new UserDAO().addUser(user));
//        System.out.println(new UserDAO().checkLogin("lekhiem2001@gmail.com", "letrongkhiem2001"));
        System.out.println(UserDAO.getInstance().listUser());
//        System.out.println(UserDAO.getInstance().login("khiem@gmail.com", "123456"));
//        System.out.println(UserDAO.getInstance().getListEmail());
//        new UserDAO().register(user);
//        System.out.println(UserDAO.getInstance().registerUser(user));
    }
}
