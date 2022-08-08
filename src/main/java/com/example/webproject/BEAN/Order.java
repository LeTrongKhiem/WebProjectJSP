package com.example.webproject.BEAN;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;

public class Order implements Serializable {
    private int orderID;
    private String  user;
    private List<OrderDetail> details;
    private String name;
    private String address;
    private String email;
    private String phoneNumber;
    private double totalPrice;
    private Date createdAt;
    private Date updatedAt;
    private boolean status;

    public Order() {
    }

    @Override
    public String toString() {
        return "Order{" +
                "user='" + user + '\'' +
                ", name='" + name + '\'' +
                ", address='" + address + '\'' +
                ", email='" + email + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", totalPrice=" + totalPrice +
                ", status=" + status +
                '}';
    }

    public Order(int orderID, String name, String address, String email, String phoneNumber, double totalPrice, Date createdAt, Date updatedAt) {
        this.orderID = orderID;
        this.name = name;
        this.address = address;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.totalPrice = totalPrice;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public Order(String user,String name, String address, String email, String phoneNumber, double totalPrice, boolean status) {
        this.user = user;
        this.name = name;
        this.address = address;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.totalPrice = totalPrice;
        this.status = status;
    }

    public Order(String user,String name, String address, String email, String phoneNumber, double totalPrice) {
        this.user = user;
        this.name = name;
        this.address = address;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.totalPrice = totalPrice;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean user) {
        this.status = status;
    }

    public List<OrderDetail> getDetails() {
        return details;
    }

    public void setDetails(List<OrderDetail> details) {
        this.details = details;
    }
    public String dinhDang(double a) {
        DecimalFormat decimalFormat = new DecimalFormat("000,000 đ");
        return decimalFormat.format(a);
    }
}