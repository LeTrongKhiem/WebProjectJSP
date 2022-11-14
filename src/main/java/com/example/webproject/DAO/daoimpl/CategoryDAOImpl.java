package com.example.webproject.DAO.daoimpl;

import com.example.webproject.BEAN.Category;
import com.example.webproject.DAO.CategoryDAO;
import com.example.webproject.DB.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAOImpl implements CategoryDAO {
    private static CategoryDAOImpl instance;
    Connection connection = null;
    PreparedStatement statement;
    public static CategoryDAOImpl getInstance() {
        if (instance == null) {
            return new CategoryDAOImpl();
        } else {
            return instance;
        }
    }

    @Override
    public ArrayList<Category> getListCategoryParent() {
        Connection connection = DBConnection.getConnection();
        String sql = "SELECT * FROM `danhmuc` where DanhMucCha = 'null'";
        ArrayList<Category> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Category category = new Category();
                category.setMaDanhMuc(resultSet.getString("MaDanhMuc"));
                category.setTenDanhMuc(resultSet.getString("TenDanhMuc"));
                category.setDanhMucCha(resultSet.getString("DanhMucCha"));
                category.setIcon(resultSet.getString("Icon"));
                list.add(category);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public ArrayList<Category> getListCategoryChild(String categoryId) {
        Connection connection = DBConnection.getConnection();
        String sql = "SELECT * FROM `danhmuc` where DanhMucCha = '" + categoryId + "'";
        ArrayList<Category> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Category category = new Category();
                category.setMaDanhMuc(resultSet.getString("MaDanhMuc"));
                category.setTenDanhMuc(resultSet.getString("TenDanhMuc"));
                category.setDanhMucCha(resultSet.getString("DanhMucCha"));
                category.setIcon(resultSet.getString("Icon"));
                list.add(category);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public Category getCategotyByMaDanhMuc(String categoryId) {
        Connection connection = DBConnection.getConnection();
        Category category =null;
        String sql = "SELECT * FROM danhmuc WHERE MaDanhMuc =?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1,categoryId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String maDanhMuc = resultSet.getString("MaDanhMuc");
                String tenDanhMuc = resultSet.getString("TenDanhMuc");
                String danhMucCha = resultSet.getString("DanhMucCha");
                category =new Category(maDanhMuc,tenDanhMuc,danhMucCha);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return category;
    }
    public void editCatelogy(String madanhmuc, String tenDanhMuc, String danhMucCha){
        String query = "UPDATE `danhmuc` SET`TenDanhMuc` = ? ,`DanhMucCha` =? WHERE MaDanhMuc=?";
        try {
            connection = DBConnection.getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(2,tenDanhMuc);
            statement.setString(1,madanhmuc);
            statement.setString(3,danhMucCha);
            statement.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public ArrayList<Category> getListCategoryPhone() {
        Connection connection = DBConnection.getConnection();
        String sql = "SELECT * FROM danhmuc where DanhMucCha = '100001'";
        ArrayList<Category> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Category category = new Category();
                category.setMaDanhMuc(resultSet.getString("MaDanhMuc"));
                category.setTenDanhMuc(resultSet.getString("TenDanhMuc"));
                category.setDanhMucCha(resultSet.getString("DanhMucCha"));
                category.setIcon(resultSet.getString("Icon"));
                list.add(category);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public void deleteCategory(String maDanhMuc) {
        String query = "DELETE FROM `danhmuc` WHERE MaDanhMuc=?";
        try {
            connection = DBConnection.getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1,maDanhMuc);
            statement.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public List<Category> getAllCategories() {
        Connection connection = DBConnection.getConnection();
        String sql = "SELECT * FROM danhmuc ";
        List<Category> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Category category = new Category();
                category.setMaDanhMuc(resultSet.getString("MaDanhMuc"));
                category.setTenDanhMuc(resultSet.getString("TenDanhMuc"));
                category.setDanhMucCha(resultSet.getString("DanhMucCha"));
                list.add(category);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public void createCategory(String tenDanhMuc,String maDanhMuc, String danhMucCha) {
        String query = "INSERT INTO danhmuc(TenDanhMuc,MaDanhMuc,DanhMucCha) VALUES(?,?,?)";
        try {
            connection = DBConnection.getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1,tenDanhMuc);
            statement.setString(2,maDanhMuc);
            statement.setString(3,danhMucCha);
            statement.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public static void main(String[] args) {
        System.out.println(new CategoryDAOImpl().getListCategoryChild("200001").size());
    }

}
