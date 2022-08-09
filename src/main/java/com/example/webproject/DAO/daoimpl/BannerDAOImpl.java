package com.example.webproject.DAO.daoimpl;

import com.example.webproject.BEAN.Banner;
import com.example.webproject.DAO.BannerDAO;
import com.example.webproject.DB.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BannerDAOImpl implements BannerDAO {
    private static BannerDAOImpl instance;
    Connection connection = null;
    PreparedStatement statement;

    public static BannerDAOImpl getInstance() {
        if (instance == null) {
           return new BannerDAOImpl();
        }else{
        return instance;
    }
    }

    @Override
    public ArrayList<Banner> listBanner() {
        Connection connection = DBConnection.getConnection();
        String sql = "SELECT * FROM `banner` where IDBanner='null'";
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

    @Override
    public ArrayList<Banner> getListBanner() {
        Connection connection = DBConnection.getConnection();
        String sql = "SELECT * FROM `banner`";
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

    @Override
    public void createBanner(String linkanh) {
        String query = "INSERT INTO `banner` (`Link_hinhanh`) VALUES (?)";
        try {
            connection = DBConnection.getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1,linkanh);
            statement.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void editBanner(String id, String linkanh) {
        String query = "UPDATE `banner` SET `Link_hinhanh`=? WHERE IDBanner=?";
        try {
            connection = DBConnection.getConnection();
            statement = connection.prepareStatement(query);
//            statement.setString(1,id);
            statement.setString(1   ,linkanh);
            statement.setString(2,id);
            statement.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void deleteBanner(String id) {
        String query = "DELETE FROM `banner` WHERE IDBanner=?";
        try {
            connection = DBConnection.getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1,id);
            statement.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        ArrayList<Banner> list = BannerDAOImpl.getInstance().getListBanner();
        for (Banner b : list) {
            System.out.println(b);
        }
    }
}
