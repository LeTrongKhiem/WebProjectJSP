package com.example.webproject.DAO.daoimpl;

import com.example.webproject.BEAN.Banner;
import com.example.webproject.BEAN.Category;
import com.example.webproject.BEAN.ProductList;
import com.example.webproject.DAO.BannerDAO;
import com.example.webproject.DB.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BannerDAOImpl implements BannerDAO {
    private static BannerDAOImpl instance;
    Connection connection = null;
    PreparedStatement statement;
    ResultSet resultSet;

    public static BannerDAOImpl getInstance() {
        if (instance == null) {
            instance = new BannerDAOImpl();
        }
        return instance;
    }

    @Override
    public ArrayList<Banner> listBanner() {
        Connection connection = DBConnection.getConnection();
        String sql = "SELECT * FROM `banner` where IDBanner=1 or IDBanner=2 or IDBanner=3 or IDBanner=4";
        ArrayList<Banner> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Banner banner = new Banner();
                banner.setBannerID(resultSet.getInt("IDBanner"));
                banner.setLink_banner(resultSet.getString("Link_Banner"));
                banner.setLink_hinhanh(resultSet.getString("Link_hinhanh"));
                banner.setLink_video1(resultSet.getString("Link_Video1"));
                banner.setLink_video2(resultSet.getString("Link_Video2"));
                banner.setLink_banner_content(resultSet.getString("Link_banner_content"));
                list.add(banner);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void main(String[] args) {
        ArrayList<Banner> list = BannerDAOImpl.getInstance().listBanner();
        for (Banner b : list) {
            System.out.println(b);
        }
    }
}
