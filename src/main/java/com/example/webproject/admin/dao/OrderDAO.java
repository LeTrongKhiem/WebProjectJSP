package com.example.webproject.admin.dao;

import com.example.webproject.BEAN.Order;

import java.util.ArrayList;

public interface OrderDAO {
    public ArrayList<Order> getListOrder();
    public boolean acceptOrder(int orderId);
    public boolean deleteOrder(int orderId);
}
