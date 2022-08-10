package com.example.webproject.DAO.daoimpl;


import com.example.webproject.BEAN.News;
import com.example.webproject.DAO.NewsDAO;
import com.example.webproject.DB.DBConnection;

import java.sql.Connection;
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
        String sql = "SELECT * FROM danhmuc ";
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

    public static void main(String[] args) {
        System.out.println(new NewsDAOImpl().getListNewsId().size());
//        ArrayList<Category> list = getInstance().getListCategoryPhone();
//        for (Category name : list) {
//            System.out.println(name.getTenDanhMuc());
//        }
    }

}
