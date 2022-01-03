package com.example.webproject.DAO;

import com.example.webproject.BEAN.ProductList;

import java.util.ArrayList;
import java.util.List;

public interface ProductListDAO {
    public ArrayList<ProductList> getListProductByCategory(String categoryId);
//    ProductList get(int id);
//
//    List<ProductList> getProductByCategory(String category);
//
//    List<ProductList> getAll();
//
//    List<ProductList> search(String username);
//
//    List<ProductList> seachByCategory(int cate_id);
//
//    List<ProductList> seachByName(String productName);
}
