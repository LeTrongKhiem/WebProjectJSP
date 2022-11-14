package com.example.webproject.admin.dao.impl;

import com.example.webproject.BEAN.News;
import com.example.webproject.DB.DBConnection;
import com.example.webproject.admin.dao.NewsDAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class NewsDAOImpl implements NewsDAO {
    private static NewsDAOImpl instance;
    Connection connection = null;
    PreparedStatement statement;
    public static NewsDAOImpl getInstance() {
        if (instance == null) {
            return new NewsDAOImpl();
        } else {
            return instance;
        }
    }

    @Override
    public ArrayList<News> getListNewsId() {
        Connection connection = DBConnection.getConnection();
        String sql = "SELECT * FROM `tintuc` where MaTinTuc = 'null'";
        ArrayList<News> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                News news = new News();
                news.setmaTinTuc(resultSet.getString("MaTinTuc"));
                list.add(news);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    @Override
    public ArrayList<News> getListAuthor() {
        Connection connection = DBConnection.getConnection();
        String sql = "SELECT * FROM `tintuc` where TacGia = 'null'";
        ArrayList<News> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                News news = new News();
                news.setTacGia(resultSet.getString("TacGia"));
                list.add(news);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    public List<News> getAllNews() {
        Connection connection = DBConnection.getConnection();
        String sql = "SELECT * FROM tintuc ";
        List<News> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                News news = new News();
                news.setmaTinTuc(resultSet.getString("MaTinTuc"));
                news.settieuDe(resultSet.getString("TieuDe"));
                news.settomTat(resultSet.getString("TomTat"));
                news.setnoiDung(resultSet.getString("NoiDung"));
                news.setNgayDang(resultSet.getDate("NgayDang"));
                news.setTacGia(resultSet.getString("TacGia"));
                news.setLink_hinhanh(resultSet.getString("Link_hinhanh"));
                list.add(news);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    public void createNews(String maTinTuc,String tieuDe, String tomTat,String noiDung,Date ngayDang,String tacGia,String linkanh) {
        String query = "INSERT INTO tintuc(MaTinTuc,TieuDe,TomTat,NoiDung,NgayDang,TAcGia,Link_hinhanh) VALUES(?,?,?,?,?,?,?)";
        try {
            connection = DBConnection.getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1,maTinTuc);
            statement.setString(2,tieuDe);
            statement.setString(3,tomTat);
            statement.setString(4,noiDung);
            statement.setDate(5,ngayDang);
            statement.setString(6,tacGia);
            statement.setString(7,linkanh);

            statement.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    @Override
    public void deleteNews(String maTinTuc) {
        String query = "DELETE FROM `tintuc` WHERE MaTinTuc=?";
        try {
            connection = DBConnection.getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1,maTinTuc);
            statement.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void addNews() {

    }
    public News getNewsByID(String newsId) {
        Connection connection = DBConnection.getConnection();
        News news =null;
        String sql = "SELECT * FROM tintuc WHERE MaTinTuc =?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1,newsId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String maTinTuc = resultSet.getString("MaTinTuc");
                String tieuDe = resultSet.getString("TieuDe");
                String tomTat = resultSet.getString("TomTat");
                String noiDung = resultSet.getString("NoiDung");
                Date ngayDang = resultSet.getDate("NgayDang");
                String tacGia = resultSet.getString("TacGia");
                String linkAnh = resultSet.getString("Link_hinhanh");
                news =new News(maTinTuc,tieuDe,tomTat,noiDung,ngayDang,tacGia, linkAnh);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return news;
    }
    public void editNews(String maTinTuc, String tieuDe, String tomTat,String noiDung,Date ngayDang,String tacGia,String linkAnh){
        String query = "UPDATE `tintuc` SET`MaTinTuc` = ? ,`TieuDe` =?,`TomTat` =?,`NoiDung` =?,`NgayDang` =?,`TacGia` =?,`Link_hinhanh` =? WHERE MaTinTuc=?";
        try {
            connection = DBConnection.getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(2,maTinTuc);
            statement.setString(1,tieuDe);
            statement.setString(3,tomTat);
            statement.setString(4,noiDung);
            statement.setDate(5,ngayDang);
            statement.setString(6,tacGia);
            statement.setString(7,linkAnh);

            statement.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        NewsDAOImpl dao = new NewsDAOImpl();
        System.out.println(dao.getAllNews());
        List<News> list = dao.getAllNews();
        for(News s :list){
            System.out.println(s);
        }

//        }
    }

}
