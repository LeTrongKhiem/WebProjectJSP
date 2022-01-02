package com.example.webproject.DAO.daoimpl;

import com.example.webproject.BEAN.ProductList;
import com.example.webproject.DAO.ProductListDAO;
import com.example.webproject.DB.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

    @Override
    public void insert(ProductList product) {

    }

    @Override
    public void edit(ProductList product) {

    }

    @Override
    public void delete(int id) {

    }

    @Override
    public ProductList get(int id) {
        return null;
    }

    @Override
    public List<ProductList> getAll() {
        return null;
    }

    @Override
    public List<ProductList> search(String username) {
        return null;
    }

    @Override
    public List<ProductList> seachByCategory(int cate_id) {
        return null;
    }

    @Override
    public List<ProductList> seachByName(String productName) {
        return null;
    }
}
