package com.example.webproject.admin.controller.banner;

import com.example.webproject.BEAN.Banner;
import com.example.webproject.DAO.daoimpl.BannerDAOImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ShowBannerController", value = "/admin/banner")
public class ShowBannerController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BannerDAOImpl dao = new BannerDAOImpl();
        ArrayList<Banner> banner = dao.getListBanner();
        request.setAttribute("listBanner", banner);
        request.getRequestDispatcher("/admin/quanlybanner.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
