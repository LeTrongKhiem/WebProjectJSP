package com.example.webproject.admin.dao;

import com.example.webproject.BEAN.News;

import java.sql.Date;
import java.util.ArrayList;

public interface NewsDAO {
    //lấy danh sách mã tin túc
    public ArrayList<News> getListNewsId();
    //lấy danh sách tác giả
    public ArrayList<News> getListAuthor();

    public void deleteNews(String maTinTuc);
    public void addNews();
    public void createNews(String maTinTuc, String tieuDe, String tomTat, String noiDung, Date ngayDang, String tacGia, String linkanh);
}
