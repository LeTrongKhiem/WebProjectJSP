package com.example.webproject.BEAN;

import java.io.Serializable;

public class Category implements Serializable {
    private static final long serialVersionUID= 1L;
    private String maDanhMuc;
    private String tenDanhMuc;
    private String danhMucCha;
    private String icon;

    public Category() {
    }

    public Category(String maDanhMuc, String tenDanhMuc, String danhMucCha, String icon) {
        this.maDanhMuc = maDanhMuc;
        this.tenDanhMuc = tenDanhMuc;
        this.danhMucCha = danhMucCha;
        this.icon = icon;
    }
    public Category(String maDanhMuc, String tenDanhMuc, String danhMucCha) {
        this.maDanhMuc = maDanhMuc;
        this.tenDanhMuc = tenDanhMuc;
        this.danhMucCha = danhMucCha;

    }

    public String getMaDanhMuc() {
        return maDanhMuc;
    }

    public void setMaDanhMuc(String maDanhMuc) {
        this.maDanhMuc = maDanhMuc;
    }

    public String getTenDanhMuc() {
        return tenDanhMuc;
    }

    public void setTenDanhMuc(String tenDanhMuc) {
        this.tenDanhMuc = tenDanhMuc;
    }

    public String getDanhMucCha() {
        return danhMucCha;
    }

    public void setDanhMucCha(String danhMucCha) {
        this.danhMucCha = danhMucCha;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }
}
