package com.example.webproject.DAO.daoimpl;

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

public class UserDAO implements com.example.webproject.DAO.UserDAO {
    private static UserDAO instance;

    public static UserDAO getInstance() {//single ton
        if (instance == null) {
            instance = new UserDAO();
        }
        return instance;
    }
    @Override
    public User getInfoUser(String emailUser) {
        User user = new User();
        try {
            ResultSet resultSet = new DBConnection().selectData("select * from `user`(HoTen, Email, Sdt, GioiTinh, Ngaysinh, Thang, Nam, MatKhau, NhapLaiMK, Role) where Email = '" + emailUser + "'");

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
                int role = resultSet.getInt("Role");
                return new User(name, email, phone, gender, date, month, year, password, re_password, role);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }//get info user in database

//    @Override
//    public boolean checkLogin(String email, String password) {
//        try {
//            ResultSet resultSet = new DBConnection().selectData("select * from `user` where Email = '" + email + "'");
//
//            while (resultSet.next()) {
//                if (resultSet.getString("Email").equals(email) && resultSet.getString("MatKhau").equals(password)) {
//                    return true;
//                }
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return false;
//    }// check login v1

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
        String sql = "update `user` set MatKhau='" + user.getPassword() + "', DiaChi = '" + user.getAddress() + "', NhapLaiMK = '" + user.getRe_password() + "' where Email = '" + user.getEmail() + "'";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    @Override
    public Map<String, User> listUser() {
        Map<String, User> list = new HashMap<>();
        Connection connection = DBConnection.getConnection();
        try {
            String sql = "select HoTen, Email, Sdt, GioiTinh, Ngaysinh, Thang, Nam, Matkhau, NhapLaiMK, Role from `user` where Active='1'";
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
                int role = resultSet.getInt("Role");
                User user = new User(name, email, phone, gender, date, month, year, password, re_password, role);
                list.put(email, user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }//get list user map database
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
    @Override
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

}
