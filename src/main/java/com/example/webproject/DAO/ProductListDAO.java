package com.example.webproject.DAO;

import com.example.webproject.BEAN.ProductList;

import java.util.List;

public interface ProductListDAO {
    void insert(ProductList product);

    void edit(ProductList product);

    void delete(int id);

    ProductList get(int id);

    List<ProductList> getAll();

    List<ProductList> search(String username);

    List<ProductList> seachByCategory(int cate_id);

    List<ProductList> seachByName(String productName);
}
