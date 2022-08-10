package com.example.webproject.admin.controller.banner;

import com.example.webproject.BEAN.Banner;
import com.example.webproject.DAO.daoimpl.BannerDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ShowBannerController", value = "/admin/banner")
public class ShowBannerController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BannerDAOImpl dao = new BannerDAOImpl();
        List<Banner> listBanner = dao.getListBanner();
        System.out.println(listBanner);
        request.setAttribute("listBanner",listBanner);
        request.getRequestDispatcher("/admin/quanlybanner.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
