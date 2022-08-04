package com.example.webproject.admin.dao;

import com.example.webproject.BEAN.WareHouse;

import java.util.ArrayList;

public interface WareHouseDAO {
    public ArrayList<WareHouse> getWareHouse();
    public boolean changeQuantity(String productId, int quantity);
    public boolean addQuantity(String productId, int quantity);
    public WareHouse getQuantity(String productId);
}
