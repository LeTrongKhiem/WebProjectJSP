package com.example.webproject.service;

import java.util.List;

public class ProductListService implements IProduct{
    private static ProductListService instance;

    public static ProductListService getInstance() {
        if (instance == null) {
            instance = new ProductListService();
        }
        return instance;
    }

    @Override
    public List<Object> getAll() {
        return null;
    }
}
