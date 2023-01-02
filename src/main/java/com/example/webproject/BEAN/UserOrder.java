package com.example.webproject.BEAN;

import java.io.Serializable;
import java.sql.Date;
import java.text.DecimalFormat;

public class UserOrder implements Serializable {
    private int orderId;
    private String email;
    private String productName;
    private Date createDate;
    private int quantity;
    private double total;

    private boolean isSignature;

    public UserOrder() {
    }

    public UserOrder(int orderId, String email, String productName, Date createDate, int quantity, double total) {
        this.orderId = orderId;
        this.email = email;
        this.productName = productName;
        this.createDate = createDate;
        this.quantity = quantity;
        this.total = total;
    }

    public UserOrder(int orderId, String email, String productName, Date createDate, int quantity, double total, boolean isSignature) {
        this.orderId = orderId;
        this.email = email;
        this.productName = productName;
        this.createDate = createDate;
        this.quantity = quantity;
        this.total = total;
        this.isSignature = isSignature;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
    public String dinhDang(long a) {
        DecimalFormat decimalFormat = new DecimalFormat("000,000 đ");
        return decimalFormat.format(a);
    }

    @Override
    public String toString() {
        return "UserOrder{" +
                "orderId=" + orderId +
                ", email='" + email + '\'' +
                ", productName='" + productName + '\'' +
                ", createDate=" + createDate +
                ", quantity=" + quantity +
                ", total=" + total +
                ", isSignature=" + isSignature +
                '}';
    }

    public boolean getIsSignature() {
        return isSignature;
    }

    public void setSignature(boolean signature) {
        isSignature = signature;
    }
}
