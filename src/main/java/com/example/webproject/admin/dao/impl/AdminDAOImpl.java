package com.example.webproject.admin.dao.impl;

import com.example.webproject.BEAN.User;
import com.example.webproject.DB.DBConnection;
import com.example.webproject.BEAN.Admin;
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
            String sql = "insert into `admin`(MatKhau, HoTen, Email, SDT, Address, `Code`, Role) values (?,?,?,?,?,?,?)";
            statement = connection.prepareStatement(sql, statement.RETURN_GENERATED_KEYS);
            statement.setString(1, admin.getMatKhau());
            statement.setString(2, admin.getHoTen());
            statement.setString(3, admin.getEmail());
            statement.setString(4, admin.getSdt());
//            statement.setDate(6, admin.getNgaySinh());
            statement.setString(5, admin.getAddress());
            statement.setString(6, admin.getCode());
            statement.setInt(7, admin.getRole());
            int i = statement.executeUpdate();
            ResultSet resultSet = statement.getGeneratedKeys();

            if (resultSet.next()) {
                resultSet.getInt(1);
            }
            resultSet.close();
            if (i != 0) {
                SendEmail sendEmail = new SendEmail();
                String text = "Your Verification link :: http://tgmoblie.proen.app.ruk-com.cloud/ActivationAdmin?key1=" + admin.getEmail() + "&key2=" + admin.getCode();
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

    @Override
    public Map<String, Admin> getListEmployee() {
        Map<String, Admin> list = new HashMap<>();
        connection = DBConnection.getConnection();
        try {
            String sql = "select AdminId, MatKhau, HoTen, Email, SDT, NgayBD, Quyen, Role ,Address from `admin` where Active='1'";
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("AdminId");
                String pass = resultSet.getString("MatKhau");
                String name = resultSet.getString("HoTen");
                String email = resultSet.getString("Email");
                String phone = resultSet.getString("SDT");
                Date bd = resultSet.getDate("NgayBD");
                String quyen = resultSet.getString("Quyen");
                int role = resultSet.getInt("Role");
                String address = resultSet.getString("Address");
                Admin admin = new Admin(id, pass, name, email, phone, bd, quyen, role, address);
                list.put(email, admin);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public ArrayList<Admin> getListAdminUser() {
        ArrayList<Admin> listAdmin = new ArrayList<Admin>();
        connection = DBConnection.getConnection();
        try {
            String sql = "select HoTen, Email, SDT, NgayBD, Quyen, Role, Active, Address from `admin`";
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String hoTen = resultSet.getString("HoTen");
                String email = resultSet.getString("Email");
                String sdt = resultSet.getString("NgayBD");
                java.sql.Date ngayBD = resultSet.getDate("NgayBD");
                int role = resultSet.getInt("Role");
                int active = resultSet.getInt("Active");
                String address = resultSet.getString("Address");
                Admin admin = new Admin();
                admin.setHoTen(hoTen);
                admin.setEmail(email);
                admin.setSdt(sdt);
                admin.setNgayBD(ngayBD);
                admin.setRole(role);
                admin.setActive(active);
                admin.setAddress(address);
                listAdmin.add(admin);
            }
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        return listAdmin;
    }

    @Override
    public ArrayList<User> getListCustomer() {
        ArrayList<User> listCustomer = new ArrayList<>();
        connection = DBConnection.getConnection();
        try {
            String sql = "SELECT UserId, HoTen, Email, Sdt, GioiTinh, Role, Active, DiaChi FROM `user`";
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String userId = resultSet.getString("UserId");
                String hoTen = resultSet.getString("HoTen");
                String email = resultSet.getString("Email");
                String sdt = resultSet.getString("Sdt");
                String gioiTinh = resultSet.getString("GioiTinh");
                int role = resultSet.getInt("Role");
                int active = resultSet.getInt("Active");
                String diaChi = resultSet.getString("DiaChi");
                User user = new User();
                user.setId(userId);
                user.setName(hoTen);
                user.setEmail(email);
                user.setPhone(sdt);
                user.setGender(gioiTinh);
                user.setRole(role);
                user.setActive(active);
                user.setAddress(diaChi);
                listCustomer.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listCustomer;
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
        Admin admin = new Admin("lekhiem", "le trong khiem", "lekhiem2001123@gmail.com", "0372253243", "DN", "fnjewaflwegfer");
        admin.setRole(2);
        System.out.println(new AdminDAOImpl().register(admin));;
//        System.out.println(new AdminDAOImpl().register(admin));
//        Map<String, Admin> list = new AdminDAOImpl().getListEmployee();
//        for (Map.Entry<String, Admin> entry : list.entrySet()) {
//            System.out.println(entry.getKey() + ":" + entry.getValue().toString());
//        }
//        ArrayList<User> list = new AdminDAOImpl().getListCustomer();
//        for (User admin : list) {
//            System.out.println(admin.getEmail());
//        }
    }
}
