package com.example.webproject.BEAN;

import java.io.Serializable;

public class Banner implements Serializable {
    private int bannerID;
    private String link_banner;
    private String link_hinhanh;
    private String link_video1;
    private String link_video2;
    private String link_banner_content;

    public Banner() {
    }

    public Banner(int bannerID, String link_banner, String link_hinhanh, String link_video1, String link_video2, String link_banner_content) {
        this.bannerID = bannerID;
        this.link_banner = link_banner;
        this.link_hinhanh = link_hinhanh;
        this.link_video1 = link_video1;
        this.link_video2 = link_video2;
        this.link_banner_content = link_banner_content;
    }
    public Banner(int bannerID, String linkanh, String link_video, String link_banner_content) {
        this.bannerID=bannerID;
        this.link_hinhanh = link_hinhanh;
        this.link_video1 = link_video1;
        this.link_banner_content = link_banner_content;
    }
    public int getBannerID() {
        return bannerID;
    }

    public void setBannerID(int bannerID) {
        this.bannerID = bannerID;
    }

    public String getLink_banner() {
        return link_banner;
    }

    public void setLink_banner(String link_banner) {
        this.link_banner = link_banner;
    }

    public String getLink_hinhanh() {
        return link_hinhanh;
    }

    public void setLink_hinhanh(String link_hinhanh) {
        this.link_hinhanh = link_hinhanh;
    }

    public String getLink_video1() {
        return link_video1;
    }

    public void setLink_video1(String link_video1) {
        this.link_video1 = link_video1;
    }

    public String getLink_video2() {
        return link_video2;
    }

    public void setLink_video2(String link_video2) {
        this.link_video2 = link_video2;
    }


    public String getLink_banner_content() {
        return link_banner_content;
    }

    public void setLink_banner_content(String link_banner_content) {
        this.link_banner_content = link_banner_content;
    }

    @Override
    public String toString() {
        return "Banner{" +
                "bannerID=" + bannerID +
                ", link_banner='" + link_banner + '\'' +
                ", link_hinhanh='" + link_hinhanh + '\'' +
                ", link_video1='" + link_video1 + '\'' +
                ", link_video2='" + link_video2 + '\'' +
                ", link_banner_content='" + link_banner_content + '\'' +
                '}';
    }
}
