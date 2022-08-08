package com.example.webproject.DAO.daoimpl;

import com.example.webproject.BEAN.Category;
import com.example.webproject.BEAN.ProductList;
import com.example.webproject.DAO.ProductDAO;
import com.example.webproject.DB.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAOImpl implements ProductDAO {
    Connection connection = null;
    PreparedStatement statement;
    ResultSet resultSet;

    @Override
    public ArrayList<ProductList> getListProductByCategoryParent(String type) {
        String sql = "SELECT * FROM `danhsachsp` where LoaiSP='" + type + "' limit 10";
        ArrayList<ProductList> list = new ArrayList<>();
        try {
            connection = DBConnection.getConnection();
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
//            statement.setString(1, type);
            while (resultSet.next()) {
                ProductList productList = new ProductList();
                productList.setId(resultSet.getString("id"));
                Category category = new Category(resultSet.getString("MaDanhMuc"), "", "DanhMucCha", "");
                productList.setCategory(category);
                productList.setLink_hinhanh(resultSet.getString("Link_hinhanh"));
                productList.setTen(resultSet.getString("Ten"));
                long gia = resultSet.getLong("Gia");
                productList.setGia(gia);
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

    @Override
    public List<ProductList> getNextProduct(int amount, String type) {
        String sql = "SELECT DISTINCT * FROM danhsachsp where LoaiSP = '" + type + "'\n" +
                "                ORDER BY rank asc\n" +
                "                LIMIT 10 \n" +
                "                OFFSET ?";
        ArrayList<ProductList> list = new ArrayList<>();
        try {
            connection = DBConnection.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, amount);
            resultSet = statement.executeQuery();
//            statement.setString(1, type);
            while (resultSet.next()) {
                ProductList productList = new ProductList();
                productList.setId(resultSet.getString("id"));
                Category category = new Category(resultSet.getString("MaDanhMuc"), "", "DanhMucCha", "");
                productList.setCategory(category);
                productList.setLink_hinhanh(resultSet.getString("Link_hinhanh"));
                productList.setTen(resultSet.getString("Ten"));
                long gia = resultSet.getLong("Gia");
                productList.setGia(gia);
                productList.setMaDanhMuc(resultSet.getString("MaDanhMuc"));
                productList.setTenDanhMuc(resultSet.getString("TenDanhMuc"));
                productList.setLoaiSP(resultSet.getString("LoaiSP"));
                productList.setRank(resultSet.getInt("rank"));
                list.add(productList);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<ProductList> getNextProduct(int amount, String type, String madanhmuc) {
        String sql = "SELECT DISTINCT * FROM danhsachsp where LoaiSP = ? and MaDanhMuc = ?\n" +
                "                              ORDER BY rank desc\n" +
                "                             LIMIT 10 \n" +
                "                               OFFSET ?";
        ArrayList<ProductList> list = new ArrayList<>();
        try {
            connection = DBConnection.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1, type);
            statement.setString(2, madanhmuc);
            statement.setInt(3, amount);
            resultSet = statement.executeQuery();
//            statement.setString(1, type);
            while (resultSet.next()) {
                ProductList productList = new ProductList();
                productList.setId(resultSet.getString("id"));
                Category category = new Category(resultSet.getString("MaDanhMuc"), "", "DanhMucCha", "");
                productList.setCategory(category);
                productList.setLink_hinhanh(resultSet.getString("Link_hinhanh"));
                productList.setTen(resultSet.getString("Ten"));
                long gia = resultSet.getLong("Gia");
                productList.setGia(gia);
                productList.setMaDanhMuc(resultSet.getString("MaDanhMuc"));
                productList.setTenDanhMuc(resultSet.getString("TenDanhMuc"));
                productList.setLoaiSP(resultSet.getString("LoaiSP"));
                productList.setRank(resultSet.getInt("rank"));
                list.add(productList);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<ProductList> getNextProductChild(int amount, String madanhmuc) {
        String sql = "SELECT DISTINCT * FROM danhsachsp where MaDanhMuc = ?\n" +
                "                              ORDER BY rank DESC\n" +
                "                             LIMIT 10 \n" +
                "                               OFFSET ?";
        ArrayList<ProductList> list = new ArrayList<>();
        try {
            connection = DBConnection.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1, madanhmuc);
            statement.setInt(2, amount);
            resultSet = statement.executeQuery();
//            statement.setString(1, type);
            while (resultSet.next()) {
                ProductList productList = new ProductList();
                productList.setId(resultSet.getString("id"));
                Category category = new Category(resultSet.getString("MaDanhMuc"), "", "DanhMucCha", "");
                productList.setCategory(category);
                productList.setLink_hinhanh(resultSet.getString("Link_hinhanh"));
                productList.setTen(resultSet.getString("Ten"));
                long gia = resultSet.getLong("Gia");
                productList.setGia(gia);
                productList.setMaDanhMuc(resultSet.getString("MaDanhMuc"));
                productList.setTenDanhMuc(resultSet.getString("TenDanhMuc"));
                productList.setLoaiSP(resultSet.getString("LoaiSP"));
                productList.setRank(resultSet.getInt("rank"));
                list.add(productList);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    public static void main(String[] args) {
        List<ProductList> list = new ProductDAOImpl().getNextProduct(1, "DT", "100002");
        for (ProductList p : list) {
            System.out.println(p);
        }
    }
}
