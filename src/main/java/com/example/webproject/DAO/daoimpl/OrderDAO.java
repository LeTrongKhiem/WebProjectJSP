package com.example.webproject.DAO.daoimpl;


import com.example.webproject.BEAN.Order;
import com.example.webproject.BEAN.OrderDetail;
import com.example.webproject.BEAN.User;
import com.example.webproject.DB.DBConnection;

import java.sql.*;

public class OrderDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public int createOrderDetail(OrderDetail order) {
        String query = "INSERT INTO thongtinspgiohang(MaSP,TongGia,SoLuong,OrderId) VALUES (?,?,?,?)";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, order.getProductID());
            ps.setDouble(2, order.getPrice());
            ps.setInt(3, order.getQuantity());
            ps.setInt(4, order.getOrderID());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int createOrder(Order order) {
        String query = "INSERT INTO `order`(Customer_name,Address,Email,PhoneNumber,total,UserId,Status) VALUES(?,?,?,?,?,?,?)";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

//            ps.setInt(1,order.getOrderID());
            ps.setString(1, order.getName());
            ps.setString(2, order.getAddress());
            ps.setString(3, order.getEmail());
            ps.setString(4, order.getPhoneNumber());
            ps.setDouble(5, order.getTotalPrice());
            ps.setString(6, order.getUser());
            ps.setInt(7, 0);
            ps.executeUpdate();
            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    public void createOrderDetail1(OrderDetail order) {
        String query = "INSERT INTO thongtinspgiohang(OrderId,MaSP,TongGia,SoLuong) VALUES (?,?,?,?)";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, order.getId());
            ps.setString(2, order.getProductID());
            ps.setDouble(3, order.getPrice());
            ps.setInt(4, order.getQuantity());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int createOrder1(Order order) {

        String query = "INSERT INTO `order`(Customer_name,Address,Email,PhoneNumber,total) VALUES(?,?,?,?,?)";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, order.getName());
            ps.setString(2, order.getAddress());
            ps.setString(3, order.getEmail());
            ps.setString(4, order.getPhoneNumber());
            ps.setDouble(5, order.getTotalPrice());
            ps.executeUpdate();
            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -5;
    }

    public int themVaoGioHang(OrderDetail order, User user) {
        String query = "INSERT INTO thongtinspgiohang(MaSP,TongGia,SoLuong,OrderId) VALUES (?,?,?,?)";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, order.getProductID());
            ps.setDouble(2, order.getPrice());
            ps.setInt(3, order.getQuantity());
            ps.setInt(4, order.getOrderID());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public void updateStatusSignature(int orderId) {
        Connection connection = DBConnection.getConnection();
        String sql = "update `order` set `order`.IsCheckSingature = 1\n" +
                "where `order`.OrderId = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, orderId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Order getOrderDetail(int orderId) {
        Order order = new Order();
        OrderDetail orderDetail = new OrderDetail();
        Connection connection = DBConnection.getConnection();
        try {
            String sql = "SELECT * FROM `order` join thongtinspgiohang on `order`.OrderId = thongtinspgiohang.OrderId\n" +
                            "where `order`.OrderId = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, orderId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                order.setOrderID(resultSet.getInt("OrderId"));
                order.setName(resultSet.getString("Customer_name"));
                order.setAddress(resultSet.getString("Address"));
                order.setEmail(resultSet.getString("Email"));
                order.setPhoneNumber(resultSet.getString("PhoneNumber"));
                order.setTotalPrice(resultSet.getDouble("total"));
                order.setUser(resultSet.getString("UserId"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }
    public static void main(String[] args) {
        Order order = new Order("1", "2", "3", "4", "5", 6);
        OrderDAO dao = new OrderDAO();
        System.out.println(dao.getOrderDetail(17));
    }
}
