package com.example.webproject.admin.dao;

import com.example.webproject.BEAN.OrderDetail;
import com.example.webproject.BEAN.WareHouse;

import java.util.ArrayList;
import java.util.List;

public interface WareHouseDAO {
    public ArrayList<WareHouse> getWareHouse();
    public boolean changeQuantity(String productId, int quantity);
    public boolean addQuantity(String productId, int quantity);
    public WareHouse getQuantity(String productId);
    public boolean updateWarehouse(String id, int quantityOrder, int quantityWarehouse);
    public List<OrderDetail> getWarehouseByOrderId(String id);
}
