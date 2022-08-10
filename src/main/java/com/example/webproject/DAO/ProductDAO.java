package com.example.webproject.DAO;

import com.example.webproject.BEAN.Product;
import com.example.webproject.BEAN.ProductList;

import java.util.ArrayList;
import java.util.List;

public interface ProductDAO {
    //method get all Phone, Laptop , ...
    public ArrayList<ProductList> getListProductByCategoryParent(String type);
    //lấy danh sách sản phẩm tiếp theo, loadmore
    public List<ProductList> getNextProduct(int amount, String type);
    public List<ProductList> getProductRelated(String cateId, String productId);
    public List<ProductList> getAccessories(String cateId);
}
