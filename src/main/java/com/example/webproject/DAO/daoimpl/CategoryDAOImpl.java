package com.example.webproject.DAO.daoimpl;

import com.example.webproject.BEAN.Category;
import com.example.webproject.DAO.CategoryDAO;
import com.example.webproject.DB.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CategoryDAOImpl implements CategoryDAO {
    private static CategoryDAOImpl instance;

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

    public static void main(String[] args) {
//        System.out.println(new CategoryDAOImpl().getListCategoryChild("100001").size());
        ArrayList<Category> list = getInstance().getListCategoryPhone();
        for (Category name : list) {
            System.out.println(name.getTenDanhMuc());
        }
    }

}
