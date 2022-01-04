package vn.edu.hcmuaf.fit.lab5.beans;

import java.io.Serializable;
import java.text.DecimalFormat;

public class Product implements Serializable {
//    private  String img;
//    private String name;
//    private int price;
//    private String markerList;
//    private String linkProduct;
//    private String linkGuarantee;
//
//    public Product() {
//
//    }
//
//    public Product(String img, String name, int price, String markerList, String linkProduct, String linkGuarantee) {
//        this.img = img;
//        this.name = name;
//        this.price = price;
//        this.markerList = markerList;
//        this.linkProduct = linkProduct;
//        this.linkGuarantee = linkGuarantee;
//    }
//
//    public String getImg() {
//        return img;
//    }
//
//    public void setImg(String img) {
//        this.img = img;
//    }
//
//    public String getName() {
//        return name;
//    }
//
//    public void setName(String name) {
//        this.name = name;
//    }
//
//    public int getPrice() {
//        return price;
//    }
//
//    public void setPrice(int price) {
//        this.price = price;
//    }
//
//    public String getMarkerList() {
//        return markerList;
//    }
//
//    public void setMarkerList(String markerList) {
//        this.markerList = markerList;
//    }
//
//    public String getLinkProduct() {
//        return linkProduct;
//    }
//
//    public void setLinkProduct(String linkProduct) {
//        this.linkProduct = linkProduct;
//    }
//
//    public String getLinkGuarantee() {
//        return linkGuarantee;
//    }
//
//    public void setLinkGuarantee(String linkGuarantee) {
//        this.linkGuarantee = linkGuarantee;
//    }
    private String maSP ;
    private String tenSP;
    private int giaSP;
    private  int quantity;
    private int quantitySold;
    private String link_hinhanh;
    public Product(){

    }

    public Product(String maSP, String tenSP, int giaSP,int quantity, String link_hinhanh) {
        this.maSP = maSP;
        this.tenSP = tenSP;
        this.giaSP = giaSP;
        this.quantity = quantity;
        this.link_hinhanh = link_hinhanh;
    }

    public String getMaSP() {
        return maSP;
    }

    public void setMaSP(String maSP) {
        this.maSP = maSP;
    }

    public String getTenSP() {
        return tenSP;
    }

    public void setTenSP(String tenSP) {
        this.tenSP = tenSP;
    }

    public int getGiaSP() {
        return giaSP;
    }

    public void setGiaSP(int giaSP) {
        this.giaSP = giaSP;
    }

    public String getLink_hinhanh() {
        return link_hinhanh;
    }

    public void setLink_hinhanh(String link_hinhanh) {
        this.link_hinhanh = link_hinhanh;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getQuantitySold() {
        return quantitySold;
    }

    public void setQuantitySold(int quantitySold) {
        this.quantitySold = quantitySold;
    }
    public int getTotalMoney(){
        return quantitySold * giaSP;
    }


}





