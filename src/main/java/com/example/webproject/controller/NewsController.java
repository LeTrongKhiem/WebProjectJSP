package com.example.webproject.controller;

import com.example.webproject.BEAN.News;
import com.example.webproject.admin.dao.impl.NewsDAOImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "NewsController", value = "/news")
public class NewsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        NewsDAOImpl dao = new NewsDAOImpl();
        List<News> list = dao.getAllNews();
        request.setAttribute("news",list);

        request.getRequestDispatcher("tintuc.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
