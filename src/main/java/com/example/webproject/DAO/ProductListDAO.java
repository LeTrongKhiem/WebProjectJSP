package com.example.webproject.DAO;

import com.example.webproject.BEAN.Category;
import com.example.webproject.BEAN.PhoneProduct;
import com.example.webproject.BEAN.Product;
import com.example.webproject.BEAN.ProductList;

import java.util.ArrayList;
import java.util.List;

public interface ProductListDAO {
    //get product by category
    //dung de hien thi san pham theo ten danh muc
    public ArrayList<ProductList> getListProductByCategory(String categoryId);
    //get product detail
    public PhoneProduct getProductDetail(String maSP);
    //dem phan trang
    public int count(String txtSearch);
    //tim kiem
    public List<Product> search(String txtSearch, int index);
    //
    public int getNumberPage();
    public Product getProductByID(String id);
    public List<Product> getTop(int index, String category);


}
