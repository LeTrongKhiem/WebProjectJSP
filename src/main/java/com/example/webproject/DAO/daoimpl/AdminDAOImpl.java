package com.example.webproject.DAO.daoimpl;

import com.example.webproject.BEAN.Admin;

import com.example.webproject.DAO.AdminDAO;
import com.example.webproject.DB.DBConnection;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class AdminDAOImpl implements AdminDAO {
    private static AdminDAOImpl instance;
    Connection connection = null;
    PreparedStatement statement;
    public static AdminDAOImpl getInstance() {
        if (instance == null) {
            return new AdminDAOImpl();
        } else {
            return instance;
        }
    }

    @Override
    public ArrayList<Admin> getListAdmin() {
        Connection connection = DBConnection.getConnection();
        String sql = "SELECT * FROM `admin`";
        ArrayList<Admin> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Admin admin = new Admin();
                admin.setId(resultSet.getInt("AdminId"));
                admin.setMatKhau(resultSet.getString("MatKhau"));
                admin.setHoTen(resultSet.getString("HoTen"));
                admin.setEmail(resultSet.getString("Email"));
                admin.setSdt(resultSet.getString("SDT"));
                admin.setNgayBD((resultSet.getDate("NgayBD")));
                admin.setQuyen(resultSet.getString("Quyen"));
                admin.setQuyen(resultSet.getString("Role"));
                admin.setActive(resultSet.getInt("Active"));
                admin.setCode(resultSet.getString("Code"));
                admin.setAddress(resultSet.getString("Address"));
                list.add(admin);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }





    @Override
    public void editAdmin(int adminId, String matKhau, String hoTen, String email, String sDT, Date ngayBatDau, String quyen, String role, String active, String code, String adress){
        String query = "UPDATE `admin` SET`AdminId` = ? ,`MatKhau`=?,`HoTEN` =?,`Email`=?,`SDT`=?,`NgayBD`=?,`Quyen`=?,`Role`=?,`Active`=?,`code`=?,`Address`=? WHERE MaDanhMuc=?";
        try {
            connection = DBConnection.getConnection();
            statement = connection.prepareStatement(query);
            statement.setInt(1,adminId);
            statement.setString(2,matKhau);
            statement.setString(3,hoTen);
            statement.setString(4,email);
            statement.setString(5,sDT);
            statement.setDate(6, ngayBatDau);
            statement.setString(7,quyen);
            statement.setString(8,role);
            statement.setString(9,active);
            statement.setString(10,code);
            statement.setString(11,adress);

            statement.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void deleteAdmin(String adminId) {
        String query = "DELETE FROM `admin` WHERE AdminId=?";
        try {
            connection = DBConnection.getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1,adminId);
            statement.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }


    public void createAdmin(int adminId, String matKhau, String hoTen, String email, String sDT, Date ngayBatDau, String quyen, String role, String active, String code, String adress) {
        String query = "INSERT INTO admin(AdminId,MatKhau,HoTen,Email,SDT,NgayBD,Quyen,Role,Active,Code,Address) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
        try {
            connection = DBConnection.getConnection();
            statement.setInt(1,adminId);
            statement.setString(2,matKhau);
            statement.setString(3,hoTen);
            statement.setString(4,email);
            statement.setString(5,sDT);
            statement.setDate(6, ngayBatDau);
            statement.setString(7,quyen);
            statement.setString(8,role);
            statement.setString(9,active);
            statement.setString(10,code);
            statement.setString(11,adress);
            statement.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public Admin getAdminByAdminId(int adminId) {
        Connection connection = DBConnection.getConnection();
        Admin admin =null;
        String sql = "SELECT * FROM `admin` WHERE AdminId =?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1,adminId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String matKhau  = resultSet.getString("MatKhau");
                int id = resultSet.getInt("AdminId");
                String email =resultSet.getString("Email");
                String sdt =resultSet.getString("SDT");
                Date ngayBD =resultSet.getDate("NgayBD");
                String quyen =resultSet.getString("Quyen");
                String role =resultSet.getString("Role");
                String active =resultSet.getString("Active");
                String code =resultSet.getString("Code");
                String address =resultSet.getString("Address");
                admin =new Admin(id,matKhau,email,sdt,ngayBD,quyen,role,active,code,address);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return admin;
    }
    public static void main(String[] args) {

    }

}
