package com.example.webproject.admin.dao.impl;

import com.example.webproject.BEAN.Order;
import com.example.webproject.BEAN.OrderDetail;
import com.example.webproject.DB.DBConnection;
import com.example.webproject.admin.dao.OrderDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OrderDAOImpl implements OrderDAO {
    Connection connection = null;
    PreparedStatement statement;
    ResultSet resultSet;
    private static OrderDAOImpl instance;

    public static OrderDAOImpl getInstance() {
        if (instance == null) {
            instance = new OrderDAOImpl();
        }
        return instance;
    }

    @Override
    public ArrayList<Order> getListOrder(boolean status) {
        ArrayList<Order> listOrder = new ArrayList<>();
        connection = DBConnection.getConnection();
        try {
            String query = query = "select * from `order` where Status = ?";
            statement = connection.prepareStatement(query);
            statement.setBoolean(1, status);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int orderId = resultSet.getInt("OrderId");
                String userId = resultSet.getString("UserId");
                String name = resultSet.getString("Customer_name");
                String email = resultSet.getString("Email");
                String address = resultSet.getString("Address");
                String phone = resultSet.getString("PhoneNumber");
                double total = resultSet.getDouble("total");
                boolean statuss = resultSet.getBoolean("Status");
                Order order = new Order(userId, name, address, email, phone, total, statuss);
                order.setOrderID(orderId);
                listOrder.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listOrder;
    }

    @Override
    public boolean acceptOrder(int orderId) {
        connection = DBConnection.getConnection();
        try {
            String query = "update `order` set Status = 1 where OrderId = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, orderId);
            int i = statement.executeUpdate();
            if (i > 0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteOrder(int orderId) {
        connection = DBConnection.getConnection();
        try {
            String query = "delete from `order` where OrderId = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, orderId);
            int i = statement.executeUpdate();
            if (i > 0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    @Override
    public boolean deleteOrderDetail(int orderId) {
        connection = DBConnection.getConnection();
        try {
            String query = "delete from `thongtinspgiohang` where OrderId = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, orderId);
            int i = statement.executeUpdate();
            if (i > 0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }


    public static void main(String[] args) {
        ArrayList<Order> list = OrderDAOImpl.getInstance().getListOrder(true);
        for (Order order : list) {
            System.out.println(order.toString());
        }
    }
}
