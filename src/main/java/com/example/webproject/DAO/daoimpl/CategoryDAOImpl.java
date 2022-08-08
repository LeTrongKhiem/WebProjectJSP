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

    @Override
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
    public void createCategory(String tenDanhMuc) {
        String query = "INSERT INTO `category` (`TenDanhMuc`) VALUES (?)";
        try {
            connection = DBConnection.getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1,tenDanhMuc);
            statement.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public static void main(String[] args) {
        System.out.println(new CategoryDAOImpl().getListCategoryChild("200001").size());
    }

}
