package com.example.webproject.admin.controller.banner;

import com.example.webproject.DAO.daoimpl.BannerDAOImpl;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "EditBannerController", value = "/editBanner")
public class EditBannerController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bannerID = request.getParameter("bannerID");
        String hinhanh = request.getParameter("Ehinhanh");
        String link_video = request.getParameter("Elvd");
        String link_banner_content = request.getParameter("Elbc");
        BannerDAOImpl dao = new BannerDAOImpl();
        dao.editBanner(Integer.parseInt(bannerID),hinhanh,link_video,link_banner_content);

        response.sendRedirect("category");
    }
}
