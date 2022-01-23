package com.example.webproject.BEAN;

import java.io.Serializable;
import java.text.DecimalFormat;

public class ProductList implements Serializable {
    private static final long serialVersionUID = 1L;
    private String id;
    private String link_hinhanh;
    private Category category;
    private String ten;
    private long gia;
    private String maDanhMuc;
    private String tenDanhMuc;
    private String loaiSP;
    private int rank;

    public ProductList() {
    }

    public ProductList(String id, String link_hinhanh, Category category, String ten, long gia, String maDanhMuc, String tenDanhMuc, String loaiSP) {
        this.id = id;
        this.link_hinhanh = link_hinhanh;
        this.category = category;
        this.ten = ten;
        this.gia = gia;
        this.maDanhMuc = maDanhMuc;
        this.tenDanhMuc = tenDanhMuc;
        this.loaiSP = loaiSP;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getLink_hinhanh() {
        return link_hinhanh;
    }

    public void setLink_hinhanh(String link_hinhanh) {
        this.link_hinhanh = link_hinhanh;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public long getGia() {
        return gia;
    }

    public void setGia(long gia) {
        this.gia = gia;
    }

    public String getTenDanhMuc() {
        return tenDanhMuc;
    }

    public void setTenDanhMuc(String tenDanhMuc) {
        this.tenDanhMuc = tenDanhMuc;
    }

    public String getLoaiSP() {
        return loaiSP;
    }

    public void setLoaiSP(String loaiSP) {
        this.loaiSP = loaiSP;
    }

    public String getMaDanhMuc() {
        return maDanhMuc;
    }

    public void setMaDanhMuc(String maDanhMuc) {
        this.maDanhMuc = maDanhMuc;
    }

    public String dinhDang(long a) {
        DecimalFormat decimalFormat = new DecimalFormat("000,000 đ");
        return decimalFormat.format(a);
    }


    public int getRank() {
        return rank;
    }

    public void setRank(int rank) {
        this.rank = rank;
    }
}
