package com.example.webproject.BEAN;

public class OrderDetail {
    private int id;
    private String productID;
    private int quantity;
    private double price;
    public OrderDetail() {

    }

    public OrderDetail(int id, String productID, int quantity, double price) {
        this.id = id;
        this.productID = productID;
        this.quantity = quantity;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
