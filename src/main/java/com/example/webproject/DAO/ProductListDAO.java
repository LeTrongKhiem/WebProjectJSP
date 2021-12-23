package com.example.webproject.DAO;

import com.example.webproject.BEAN.ProductList;
import com.example.webproject.DB.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductListDAO {
    PreparedStatement statement;
    ResultSet resultSet;
    private static ProductListDAO instance;

    public static ProductListDAO getInstance() {
        if (instance == null) {
            instance = new ProductListDAO();
        }
        return instance;
    }

    public ProductList layDTbangThuongHieu(String thuongHieu, String loaiSP) {
        try {
            String sql = "select * from danhsachsp where TenThuongHieu = ? and LoaiSP = ?";
//            ResultSet resultSet = DBConnection.getInstance().selectData(sql);
            Connection connection = DBConnection.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1, thuongHieu);
            statement.setString(2, loaiSP);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                ProductList productList = new ProductList(resultSet.getString("Id"), resultSet.getString("Link_hinhanh"),
                        resultSet.getString("Linksp"), resultSet.getString("Ten"), resultSet.getLong("Gia"),
                        resultSet.getString("TenThuongHieu"), resultSet.getString("LoaiSP"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
