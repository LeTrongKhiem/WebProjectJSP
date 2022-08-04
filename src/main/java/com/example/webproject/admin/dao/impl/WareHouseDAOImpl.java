package com.example.webproject.admin.dao.impl;

import com.example.webproject.BEAN.Order;
import com.example.webproject.BEAN.WareHouse;
import com.example.webproject.DB.DBConnection;
import com.example.webproject.admin.dao.WareHouseDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class WareHouseDAOImpl implements WareHouseDAO {
    Connection connection = null;
    PreparedStatement statement;
    ResultSet resultSet;
    private static WareHouseDAOImpl instance;

    public static WareHouseDAOImpl getInstance() {
        if (instance == null) {
            instance = new WareHouseDAOImpl();
        }
        return instance;
    }

    @Override
    public ArrayList<WareHouse> getWareHouse() {
        ArrayList<WareHouse> listWareHouse = new ArrayList<>();
        connection = DBConnection.getConnection();
        try {
            String query = "select * from `kho`";
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String productId = resultSet.getString("Id");
                int quantity = resultSet.getInt("SoLuong");
                WareHouse wareHouse = new WareHouse(productId, quantity);
                listWareHouse.add(wareHouse);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listWareHouse;
    }

    @Override
    public boolean changeQuantity(String productId, int quantity) {
        connection = DBConnection.getConnection();
        try {
            String query = "update `kho` set SoLuong = ? where Id = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, quantity);
            statement.setString(2, productId);
            int i = statement.executeUpdate();
            if (i == 0) {
                return false;
            } else
                return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean addQuantity(String productId, int quantity) {
        connection = DBConnection.getConnection();
        try {
            String query = "insert into kho(Id, SoLuong) values(?,?)";
            statement = connection.prepareStatement(query);
            statement.setString(1, productId);
            statement.setInt(2, quantity);
            int i = statement.executeUpdate();
            if (i == 0) {
                return false;
            } else
                return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public WareHouse getQuantity(String productId) {
        connection = DBConnection.getConnection();
        WareHouse wareHouse = new WareHouse();
        try {
            String query = "select * from `kho` where Id = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, productId);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                wareHouse.setProductId(resultSet.getString("Id"));
                wareHouse.setQuantity(resultSet.getInt("SoLuong"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return wareHouse;
    }

    public static void main(String[] args) {
//        ArrayList<WareHouse> list = new WareHouseDAOImpl().getWareHouse();
//        for (WareHouse w : list) {
//            System.out.println(w.getProductId());
//        }
//        System.out.println(new WareHouseDAOImpl());
        System.out.println(new WareHouseDAOImpl().getQuantity("ip11"));
    }
}
