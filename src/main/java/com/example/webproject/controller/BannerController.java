package com.example.webproject.controller;

import com.example.webproject.BEAN.Banner;
import com.example.webproject.DAO.daoimpl.BannerDAOImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "BannerController", value = "/BannerController")
public class BannerController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int count = BannerDAOImpl.getInstance().listBanner().size();
        int percent = 100 / count;
        ArrayList bannerPaginations;
        for (Banner b : BannerDAOImpl.getInstance().listBanner()) {
            String first = "";
            
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
