package com.example.webproject.BEAN;

public class PhoneProduct {
    private String maSP;
    private String tenSP;
    private long gia;
    private String linkVideo1, linkVideo2;
    private String manHinh, hdh, camSau, camTr, CPU, RAM, boNhoTrong, theSim, pin, thietKe, imei, baiViet, noiDung, linkAnh1, linkAnh2, linkAnh3;

    public PhoneProduct() {
    }

    public PhoneProduct(String maSP, String tenSP, long gia, String linkVideo1, String linkVideo2, String manHinh, String hdh, String camSau, String camTr, String CPU, String RAM, String boNhoTrong, String theSim, String pin, String thietKe, String imei, String baiViet, String noiDung, String linkAnh1, String linkAnh2, String linkAnh3) {
        this.maSP = maSP;
        this.tenSP = tenSP;
        this.gia = gia;
        this.linkVideo1 = linkVideo1;
        this.linkVideo2 = linkVideo2;
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
        this.linkAnh1 = linkAnh1;
        this.linkAnh2 = linkAnh2;
        this.linkAnh3 = linkAnh3;
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

    public long getGia() {
        return gia;
    }

    public void setGia(long gia) {
        this.gia = gia;
    }

    public String getLinkVideo1() {
        return linkVideo1;
    }

    public void setLinkVideo1(String linkVideo1) {
        this.linkVideo1 = linkVideo1;
    }

    public String getLinkVideo2() {
        return linkVideo2;
    }

    public void setLinkVideo2(String linkVideo2) {
        this.linkVideo2 = linkVideo2;
    }

    public String getManHinh() {
        return manHinh;
    }

    public void setNamHinh(String manHinh) {
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

    public String getLinkAnh1() {
        return linkAnh1;
    }

    public void setLinkAnh1(String linkAnh1) {
        this.linkAnh1 = linkAnh1;
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

    @Override
    public String toString() {
        return "PhoneProduct{" +
                "maSP='" + maSP + '\'' +
                ", tenSP='" + tenSP + '\'' +
                ", gia=" + gia +
                ", linkVideo1='" + linkVideo1 + '\'' +
                ", linkVideo2='" + linkVideo2 + '\'' +
                ", manHinh='" + manHinh + '\'' +
                ", hdh='" + hdh + '\'' +
                ", camSau='" + camSau + '\'' +
                ", camTr='" + camTr + '\'' +
                ", CPU='" + CPU + '\'' +
                ", RAM='" + RAM + '\'' +
                ", boNhoTrong='" + boNhoTrong + '\'' +
                ", theSim='" + theSim + '\'' +
                ", pin='" + pin + '\'' +
                ", thietKe='" + thietKe + '\'' +
                ", imei='" + imei + '\'' +
                ", baiViet='" + baiViet + '\'' +
                ", noiDung='" + noiDung + '\'' +
                ", linkAnh1='" + linkAnh1 + '\'' +
                ", linkAnh2='" + linkAnh2 + '\'' +
                ", linkAnh3='" + linkAnh3 + '\'' +
                '}';
    }
}
