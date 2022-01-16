package com.example.webproject.DAO;


import com.example.webproject.BEAN.Order;
import com.example.webproject.BEAN.OrderDetail;
import com.example.webproject.DB.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class OrderDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public void createOrderDetail(OrderDetail order) {
        String query = "INSERT INTO thongtinspgiohang(OrderId,MaSP,TongGia,SoLuong) VALUES (?,?,?,?)";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1,order.getId());
            ps.setString(2,order.getProductID());
            ps.setDouble(3,order.getPrice());
            ps.setInt(4,order.getQuantity());
            rs = ps.executeQuery();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public void createOrder(Order order) {
        String query = "INSERT INTO `order`(Customer_name,Address,Email,PhoneNumber) VALUES(?,?,?,?)";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,order.getName());
            ps.setString(2,order.getAddress());
            ps.setString(3,order.getEmail());
            ps.setString(4,order.getPhoneNumber());
            rs = ps.executeQuery();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void createOrderDetail1(OrderDetail order) {
        String query = "INSERT INTO thongtinspgiohang(OrderId,MaSP,TongGia,SoLuong) VALUES (?,?,?,?)";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1,order.getId());
            ps.setString(2,order.getProductID());
            ps.setDouble(3,order.getPrice());
            ps.setInt(4,order.getQuantity());
            rs = ps.executeQuery();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public int createOrder1(Order order) {
        int id = -1;
        String query = "INSERT INTO `order`(Customer_name,Address,Email,PhoneNumber) VALUES(?,?,?,?)";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,order.getName());
            ps.setString(2,order.getAddress());
            ps.setString(3,order.getEmail());
            ps.setString(4,order.getPhoneNumber());
            rs = ps.executeQuery();
            while (rs.next()){
                 id = rs.getInt("OrderId");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return id;
    }
}
