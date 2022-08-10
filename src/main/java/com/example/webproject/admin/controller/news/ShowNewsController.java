package com.example.webproject.admin.controller.news;


import com.example.webproject.BEAN.News;
import com.example.webproject.DAO.daoimpl.NewsDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ShowNewsController", value = "/admin/news")
public class ShowNewsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        NewsDAOImpl NewsDAO = new NewsDAOImpl();
        List<News> listN = NewsDAO.getAllNews();
        request.setAttribute("listN", listN);
        request.getRequestDispatcher("/admin/quanlytintuc.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
