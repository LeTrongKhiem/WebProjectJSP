package com.example.webproject.BEAN;

import java.util.Date;

public class News {
    private static final long serialVersionUID= 1L;
    private String maTinTuc;
    private String tieuDe;
    private String tomTat;
    private String noiDung;
    private Date ngayDang;
    private String tacGia;
    private String link_hinhanh;

    public News() {
    }

    public News(String maTinTuc, String tieuDe, String tomTat, String noiDung) {
        this.maTinTuc = maTinTuc;
        this.tieuDe = tieuDe;
        this.tomTat = tomTat;
        this.noiDung = noiDung;
        this.ngayDang=ngayDang;
        this.tacGia=tacGia;
        this.link_hinhanh=link_hinhanh;
    }


    public News(String maTinTuc, String tieuDe, String tomTat, String noiDung, java.sql.Date ngayDang, String tacGia, String linkAnh) {
    }

    public String getmaTinTuc() {
        return maTinTuc;
    }

    public void setmaTinTuc(String maTinTuc) {
        this.maTinTuc = maTinTuc;
    }

    public String gettieuDe() {
        return tieuDe;
    }

    public void settieuDe(String tieuDe) {
        this.tieuDe = tieuDe;
    }

    public String gettomTat() {
        return tomTat;
    }

    public void settomTat(String tomTat) {
        this.tomTat = tomTat;
    }


    public String getnoiDung() {
        return noiDung;
    }

    public void setnoiDung(String noiDung) {
        this.noiDung = noiDung;
    }
    public Date getNgayDang() {
        return ngayDang;
    }

    public void setNgayDang(Date ngayDang) {
        this.ngayDang = ngayDang;
    }
    public String getTacGia() {
        return tacGia;
    }

    public void setTacGia(String tacGia) {
        this.tacGia = tacGia;
    }
    public String getLink_hinhanh() {
        return link_hinhanh;
    }

    public void setLink_hinhanh(String link_hinhanh) {
        this.link_hinhanh = link_hinhanh;
    }

    @Override
    public String toString() {
        return "News{" +
                "maTinTuc='" + maTinTuc + '\'' +
                ", tieuDe='" + tieuDe + '\'' +
                ", tomTat='" + tomTat + '\'' +
                ", noiDung='" + noiDung + '\'' +
                ", ngayDang=" + ngayDang +
                ", tacGia='" + tacGia + '\'' +
                ", link_hinhanh='" + link_hinhanh + '\'' +
                '}';
    }
}


