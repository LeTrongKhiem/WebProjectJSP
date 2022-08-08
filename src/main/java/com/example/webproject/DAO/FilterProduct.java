package com.example.webproject.DAO;

import com.example.webproject.BEAN.ProductList;

import java.util.ArrayList;

public interface FilterProduct {
    //method filter product by price
    public void selectByPrice(int priceF);

    //filter product by hdh
    public void selectByHDH(String hdhF);

    //sort price
    public ArrayList<ProductList> sortByPrice(String locGia, String madanhmuc, String loaisanpham);

    public void selectByCategory(String categoryF);
}
