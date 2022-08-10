package com.example.webproject.DAO;



import com.example.webproject.BEAN.News;

import java.util.ArrayList;

public interface NewsDAO {
    //lấy danh sách mã tin túc
    public ArrayList<News> getListNewsId();
    //lấy danh sách tác giả
    public ArrayList<News> getListAuthor();

    public void deleteNews(String maTinTuc);
    public void addNews();
}

