package com.example.webproject.service.serviceimpl;

import com.example.webproject.BEAN.ProductList;
import com.example.webproject.service.ProductListService;

import java.util.List;

public class ProductListServiceImpl implements ProductListService {
    private static ProductListServiceImpl instance;

    public static ProductListServiceImpl getInstance() {
        if (instance == null) {
            instance = new ProductListServiceImpl();
        }
        return instance;
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
