package com.example.webproject.DAO.daoimpl;

import com.example.webproject.BEAN.Category;
import com.example.webproject.BEAN.ProductList;
import com.example.webproject.DAO.ProductListDAO;
import com.example.webproject.DB.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductListDAOImpl implements ProductListDAO {
    PreparedStatement statement;
    ResultSet resultSet;
    private static ProductListDAOImpl instance;

    public static ProductListDAOImpl getInstance() {
        if (instance == null) {
            instance = new ProductListDAOImpl();
        }
        return instance;
    }

    @Override
    public ArrayList<ProductList> getListProductByCategory(String categoryId) {
        Connection connection = DBConnection.getConnection();
        String sql = "select * from danhsachsp where MaDanhMuc = '" + categoryId + "'";
        ArrayList<ProductList> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                ProductList productList = new ProductList();
                productList.setId(resultSet.getString("id"));
                Category category = new Category(resultSet.getString("MaDanhMuc"), "", "", "");
                productList.setCategory(category);
                productList.setLink_hinhanh(resultSet.getString("Link_hinhanh"));
                productList.setTen(resultSet.getString("Ten"));
                productList.setGia(resultSet.getLong("Gia"));
                productList.setMaDanhMuc(resultSet.getString("MaDanhMuc"));
                productList.setTenDanhMuc(resultSet.getString("TenDanhMuc"));
                productList.setLoaiSP(resultSet.getString("LoaiSP"));
                list.add(productList);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void main(String[] args) {
        System.out.println(new ProductListDAOImpl().getListProductByCategory("100002").size());
    }
}
