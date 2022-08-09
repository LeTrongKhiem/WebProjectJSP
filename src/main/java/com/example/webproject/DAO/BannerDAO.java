package com.example.webproject.DAO;

import com.example.webproject.BEAN.Banner;

import java.util.ArrayList;
import java.util.List;

public interface BannerDAO {
    //lấy danh sách các banner
    public ArrayList<Banner> listBanner();
    public List<Banner> getListBanner();
    public void createBanner(String bannerID,String link_hinhanh,String link_video1,String link_banner_content);

    void editBanner(String id, String linkanh);

    public void deleteBanner(String id);
}
