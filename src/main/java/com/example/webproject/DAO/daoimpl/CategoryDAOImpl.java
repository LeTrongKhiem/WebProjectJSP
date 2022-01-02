package com.example.webproject.DAO.daoimpl;

import com.example.webproject.BEAN.Category;
import com.example.webproject.DAO.CategoryDAO;
import com.example.webproject.DB.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CategoryDAOImpl implements CategoryDAO {
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
                list.add(category);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}
