package com.example.webproject.admin.controller.banner;

import com.example.webproject.BEAN.Banner;
import com.example.webproject.DAO.daoimpl.BannerDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "LoadBannerEdit", value = "/admin/editBanner")
public class LoadBannerEditController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        BannerDAOImpl bannerDAO = new BannerDAOImpl();
        int bannerID = Integer.parseInt(request.getParameter("bannerID"));
        Banner banner = bannerDAO.getBannerByBannerId(bannerID);
        request.setAttribute("detailBanner",banner);

        request.getRequestDispatcher("/admin/editBanner.jsp").forward(request,response);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request,response);
    }

}
