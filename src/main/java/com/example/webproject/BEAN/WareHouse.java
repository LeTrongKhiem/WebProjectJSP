package com.example.webproject.BEAN;

public class WareHouse {
    private String productId;
    private int quantity;

    public WareHouse() {
    }

    public WareHouse(String productId, int quantity) {
        this.productId = productId;
        this.quantity = quantity;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }
}
