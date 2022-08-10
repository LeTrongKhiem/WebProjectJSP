package com.example.webproject.BEAN;

import java.text.DecimalFormat;
import java.util.Date;

public class OrderDetail {
    private int id;
    private int orderID;
    private String productId;
    private String productID;
    private int quantity;
    private Date createAt;
    private Date createUpdate;
    private double price;
    public OrderDetail() {

    }

//    public OrderDetail(int id, String productID, int quantity, double price) {
//        this.id = id;
//        this.productID = productID;
//        this.quantity = quantity;
//        this.price = price;
//    }
    public OrderDetail(int orderID, String productID, int quantity, double price) {
        this.orderID = orderID;
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

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public Date getCreateUpdate() {
        return createUpdate;
    }

    public void setCreateUpdate(Date createUpdate) {
        this.createUpdate = createUpdate;
    }

    @Override
    public String toString() {
        return "OrderDetail{" +
                "id=" + id +
                ", orderID=" + orderID +
                ", productId='" + productId + '\'' +
                ", productID='" + productID + '\'' +
                ", quantity=" + quantity +
                ", createAt=" + createAt +
                ", createUpdate=" + createUpdate +
                ", price=" + price +
                '}';
    }
    public String dinhDang(double a) {
        DecimalFormat decimalFormat = new DecimalFormat("000,000 đ");
        return decimalFormat.format(a);
    }
}
