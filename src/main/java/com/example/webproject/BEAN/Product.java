package com.example.webproject.BEAN;

import java.io.Serializable;
import java.text.DecimalFormat;

public class Product implements Serializable {
    private String maSP ;
    private String tenSP;
    private int giaSP;
    private String manHinh;
    private String  hdh, camSau, camTr, CPU, RAM, boNhoTrong, theSim, pin, thietKe, imei, baiViet, noiDung,linkAnh2, linkAnh3;
    private String oCung,cardManHinh,congKetNoi,dacBiet,kichThuocVaTrongLuong,thoiDiemRaMat;
    private  int quantity;
    private int quantitySold;
    private String link_hinhanh;
    private String loaiSP;
    Category maDanhMuc;
    String categoryId;

    public Product(){

    }

    public Product(String maSP, String tenSP, int giaSP, String manHinh, String hdh, String camSau, String camTr, String CPU, String RAM, String boNhoTrong, String theSim, String pin, String thietKe, String imei, String baiViet, String noiDung, String linkAnh2, String linkAnh3, String oCung, String cardManHinh, String congKetNoi, String dacBiet, String kichThuocVaTrongLuong, String thoiDiemRaMat, String link_hinhanh,String loaiSP) {
        this.maSP = maSP;
        this.tenSP = tenSP;
        this.giaSP = giaSP;
        this.manHinh = manHinh;
        this.hdh = hdh;
        this.camSau = camSau;
        this.camTr = camTr;
        this.CPU = CPU;
        this.RAM = RAM;
        this.boNhoTrong = boNhoTrong;
        this.theSim = theSim;
        this.pin = pin;
        this.thietKe = thietKe;
        this.imei = imei;
        this.baiViet = baiViet;
        this.noiDung = noiDung;
        this.linkAnh2 = linkAnh2;
        this.linkAnh3 = linkAnh3;
        this.oCung = oCung;
        this.cardManHinh = cardManHinh;
        this.congKetNoi = congKetNoi;
        this.dacBiet = dacBiet;
        this.kichThuocVaTrongLuong = kichThuocVaTrongLuong;
        this.thoiDiemRaMat = thoiDiemRaMat;
        this.link_hinhanh = link_hinhanh;
        this.loaiSP = loaiSP;
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
    public String getManHinh() {
        return manHinh;
    }

    public void setManHinh(String manHinh) {
        this.manHinh = manHinh;
    }

    public String getHdh() {
        return hdh;
    }

    public void setHdh(String hdh) {
        this.hdh = hdh;
    }

    public String getCamSau() {
        return camSau;
    }

    public void setCamSau(String camSau) {
        this.camSau = camSau;
    }

    public String getCamTr() {
        return camTr;
    }

    public void setCamTr(String camTr) {
        this.camTr = camTr;
    }

    public String getCPU() {
        return CPU;
    }

    public void setCPU(String CPU) {
        this.CPU = CPU;
    }

    public String getRAM() {
        return RAM;
    }

    public void setRAM(String RAM) {
        this.RAM = RAM;
    }

    public String getBoNhoTrong() {
        return boNhoTrong;
    }

    public void setBoNhoTrong(String boNhoTrong) {
        this.boNhoTrong = boNhoTrong;
    }

    public String getTheSim() {
        return theSim;
    }

    public void setTheSim(String theSim) {
        this.theSim = theSim;
    }

    public String getPin() {
        return pin;
    }

    public void setPin(String pin) {
        this.pin = pin;
    }

    public String getThietKe() {
        return thietKe;
    }

    public void setThietKe(String thietKe) {
        this.thietKe = thietKe;
    }

    public String getImei() {
        return imei;
    }

    public void setImei(String imei) {
        this.imei = imei;
    }

    public String getBaiViet() {
        return baiViet;
    }

    public void setBaiViet(String baiViet) {
        this.baiViet = baiViet;
    }

    public String getNoiDung() {
        return noiDung;
    }

    public void setNoiDung(String noiDung) {
        this.noiDung = noiDung;
    }

    public String getLinkAnh2() {
        return linkAnh2;
    }

    public void setLinkAnh2(String linkAnh2) {
        this.linkAnh2 = linkAnh2;
    }

    public String getLinkAnh3() {
        return linkAnh3;
    }

    public void setLinkAnh3(String linkAnh3) {
        this.linkAnh3 = linkAnh3;
    }

    public String getoCung() {
        return oCung;
    }

    public void setoCung(String oCung) {
        this.oCung = oCung;
    }

    public String getCardManHinh() {
        return cardManHinh;
    }

    public void setCardManHinh(String cardManHinh) {
        this.cardManHinh = cardManHinh;
    }

    public String getCongKetNoi() {
        return congKetNoi;
    }

    public void setCongKetNoi(String congKetNoi) {
        this.congKetNoi = congKetNoi;
    }

    public String getDacBiet() {
        return dacBiet;
    }

    public void setDacBiet(String dacBiet) {
        this.dacBiet = dacBiet;
    }

    public String getKichThuocVaTrongLuong() {
        return kichThuocVaTrongLuong;
    }

    public void setKichThuocVaTrongLuong(String kichThuocVaTrongLuong) {
        this.kichThuocVaTrongLuong = kichThuocVaTrongLuong;
    }

    public String getThoiDiemRaMat() {
        return thoiDiemRaMat;
    }

    public void setThoiDiemRaMat(String thoiDiemRaMat) {
        this.thoiDiemRaMat = thoiDiemRaMat;
    }

    public String getLoaiSP() {
        return loaiSP;
    }

    public void setLoaiSP(String loaiSP) {
        this.loaiSP = loaiSP;
    }
    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }
    public Category getMaDanhMuc() {
        return maDanhMuc;
    }

    public void setMaDanhMuc(Category maDanhMuc) {
        this.maDanhMuc = maDanhMuc;
    }
    public String dinhDang(long a) {
        DecimalFormat decimalFormat = new DecimalFormat("000,000 đ");
        return decimalFormat.format(a);
    }
}
