package com.example.webproject.admin.dao.impl;

import com.example.webproject.DB.DBConnection;
import com.example.webproject.admin.BEAN.Admin;
import com.example.webproject.admin.dao.AdminDAO;
import com.example.webproject.service.SendEmail;

import java.sql.*;
import java.util.Date;
import java.util.*;

public class AdminDAOImpl implements AdminDAO {
    Connection connection = null;
    PreparedStatement statement;
    ResultSet resultSet;
    private static AdminDAOImpl instance;

    public static AdminDAOImpl getInstance() {
        if (instance == null) {
            instance = new AdminDAOImpl();
        }
        return instance;
    }

    @Override
    public String register(Admin admin) {
        connection = DBConnection.getConnection();
        try {
            String sql = "insert into `admin`(MatKhau, HoTen, Email, SDT, Address, `Code`) values (?,?,?,?,?,?)";
            statement = connection.prepareStatement(sql, statement.RETURN_GENERATED_KEYS);
            statement.setString(1, admin.getMatKhau());
            statement.setString(2, admin.getHoTen());
            statement.setString(3, admin.getEmail());
            statement.setString(4, admin.getSdt());
//            statement.setDate(6, admin.getNgaySinh());
            statement.setString(5, admin.getAddress());
            statement.setString(6, admin.getCode());
            int i = statement.executeUpdate();
            ResultSet resultSet = statement.getGeneratedKeys();

            if (resultSet.next()) {
                resultSet.getInt(1);
            }
            resultSet.close();
            if (i != 0) {
                SendEmail sendEmail = new SendEmail();
                String text = "Your Verification link :: http://localhost:2222/WebProject/ActivationAdmin?key1=" + admin.getEmail() + "&key2=" + admin.getCode();
                sendEmail.sendMail1(admin.getEmail(), "Verification Email TGMobile Employee", text);
                return "Success";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "Error";
    }

    @Override
    public Map<String, Admin> listAdmin() {
        Map<String, Admin> list = new HashMap<>();
        connection = DBConnection.getConnection();
        try {
            String sql = "select MatKhau, HoTen, Email, SDT, Address from `admin` where Active='1'";
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String pass = resultSet.getString("MatKhau");
                String name = resultSet.getString("HoTen");
                String email = resultSet.getString("Email");
                String phone = resultSet.getString("SDT");
//                Date bd = resultSet.getDate("NgaySinh");
                String address = resultSet.getString("Address");
                Admin admin = new Admin(pass, name, email, phone, address);
                list.put(email, admin);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<String> getListEmail() {
        List<String> listEmail = new ArrayList<>();
        connection = DBConnection.getConnection();
        try {
            String sql = "select Email from `admin`";
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                listEmail.add(resultSet.getString("Email"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listEmail;
    }

    public static void main(String[] args) {
//        Map<String, Admin> list = new AdminDAOImpl().listAdmin();
//        for (Map.Entry<String, Admin> entry : list.entrySet()) {
//            System.out.println(entry.getKey() + ":" + entry.getValue().toString());
//        }
//        ArrayList<String> list = (ArrayList<String>) getInstance().getListEmail();
//        for (String p : list) {
//            System.out.println(p);
//        }
        Admin admin = new Admin("lekhiem", "le trong khiem", "lekhiem2001@gmail.com", "0372253243", "DN", "fnjewaflwegfer");

        System.out.println(new AdminDAOImpl().register(admin));
    }
}
