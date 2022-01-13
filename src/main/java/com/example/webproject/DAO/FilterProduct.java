package com.example.webproject.DAO;

public interface FilterProduct {
    //method filter product by price
    public void selectByPrice(int priceF);

    //filter product by hdh
    public void selectByHDH(String hdhF);

    //sort price
    public void sortByPrice(String price);

    public void selectByCategory(String categoryF);
}
