package com.example.webproject.controller;

import com.example.webproject.BEAN.Banner;
import com.example.webproject.DAO.daoimpl.BannerDAOImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "BannerController", value = "/BannerController")
public class BannerController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Banner> banners = new ArrayList<Banner>();
        banners = BannerDAOImpl.getInstance().listBanner();
        request.setAttribute("banners", banners);
        request.getRequestDispatcher("index.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
