package com.example.webproject.DAO;

import com.example.webproject.BEAN.Category;
import com.example.webproject.BEAN.PhoneProduct;
import com.example.webproject.BEAN.Product;
import com.example.webproject.BEAN.ProductList;

import java.util.ArrayList;
import java.util.List;

public interface ProductListDAO {
    public ArrayList<ProductList> getListProductByCategory(String categoryId);

    public PhoneProduct getProductDetail(String maSP);
    public int count(String txtSearch);
    public List<Product> search(String txtSearch, int index);
    public int getNumberPage();
    public Product getLaptopByID(String id);
    public List<Product> getTop(int index);

}
