package com.example.webproject.admin.dao;

import com.example.webproject.BEAN.Order;
import com.example.webproject.BEAN.OrderDetail;

import java.util.ArrayList;
import java.util.List;

public interface OrderDAO {
    public ArrayList<Order> getListOrder(boolean status);
    public boolean acceptOrder(int orderId);
    public boolean deleteOrder(int orderId);
}
