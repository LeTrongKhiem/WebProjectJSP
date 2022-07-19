package com.example.webproject.BEAN.Common;

public class PagingProduct {
    private String keyword;
    private int price;
    private String brand;
    private String operatingSystem;
    private String display;

    public PagingProduct() {
    }

    public PagingProduct(String keyword, int price, String brand, String operatingSystem, String display) {
        this.keyword = keyword;
        this.price = price;
        this.brand = brand;
        this.operatingSystem = operatingSystem;
        this.display = display;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getOperatingSystem() {
        return operatingSystem;
    }

    public void setOperatingSystem(String operatingSystem) {
        this.operatingSystem = operatingSystem;
    }

    public String getDisplay() {
        return display;
    }

    public void setDisplay(String display) {
        this.display = display;
    }
}
