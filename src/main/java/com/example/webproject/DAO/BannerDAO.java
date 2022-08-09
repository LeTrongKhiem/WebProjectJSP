package com.example.webproject.DAO;

import com.example.webproject.BEAN.Banner;

import java.util.ArrayList;
import java.util.List;

public interface BannerDAO {
    //lấy danh sách các banner
    public ArrayList<Banner> listBanner();
    public ArrayList<Banner> getListBanner();
    public void createBanner(String linkanh);

    void editBanner(String id, String linkanh);

    public void deleteBanner(String id);
}
