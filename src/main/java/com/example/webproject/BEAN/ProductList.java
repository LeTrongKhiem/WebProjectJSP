package com.example.webproject.BEAN;

public class ProductList {
    private String id;
    private String link_hinhanh;
    private String linkSP;
    private String ten;
    private long gia;
    private String tenThuongHieu;
    private String loaiSP;

    public ProductList() {
    }

    public ProductList(String id, String link_hinhanh, String linkSP, String ten, long gia, String tenThuongHieu, String loaiSP) {
        this.id = id;
        this.link_hinhanh = link_hinhanh;
        this.linkSP = linkSP;
        this.ten = ten;
        this.gia = gia;
        this.tenThuongHieu = tenThuongHieu;
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

    public String getLinkSP() {
        return linkSP;
    }

    public void setLinkSP(String linkSP) {
        this.linkSP = linkSP;
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

    public String getTenThuongHieu() {
        return tenThuongHieu;
    }

    public void setTenThuongHieu(String tenThuongHieu) {
        this.tenThuongHieu = tenThuongHieu;
    }

    public String getLoaiSP() {
        return loaiSP;
    }

    public void setLoaiSP(String loaiSP) {
        this.loaiSP = loaiSP;
    }

    @Override
    public String toString() {
        return "ProductList{" +
                "id='" + id + '\'' +
                ", link_hinhanh='" + link_hinhanh + '\'' +
                ", linkSP='" + linkSP + '\'' +
                ", ten='" + ten + '\'' +
                ", gia=" + gia +
                ", tenThuongHieu='" + tenThuongHieu + '\'' +
                ", loaiSP='" + loaiSP + '\'' +
                '}';
    }
}
