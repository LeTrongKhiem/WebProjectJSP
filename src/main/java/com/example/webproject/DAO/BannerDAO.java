package com.example.webproject.DAO;

import com.example.webproject.BEAN.Banner;

import java.util.ArrayList;
import java.util.List;

public interface BannerDAO {
    //lấy danh sách các banner
    public ArrayList<Banner> listBanner();
}
