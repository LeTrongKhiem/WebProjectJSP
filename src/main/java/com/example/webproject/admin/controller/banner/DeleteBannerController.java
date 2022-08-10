package com.example.webproject.admin.controller.banner;

import com.example.webproject.DAO.daoimpl.BannerDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteBannerController", value = "/admin/deleteBanner")
public class DeleteBannerController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bannerID = request.getParameter("bannerID");
        BannerDAOImpl dao = new BannerDAOImpl();
        dao.deleteBanner(bannerID);
        response.sendRedirect(request.getContextPath()+"/admin/banner");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
