package com.example.webproject.admin.controller.banner;

import com.example.webproject.DAO.daoimpl.BannerDAOImpl;
import com.example.webproject.DAO.daoimpl.ProductListDAOImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
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
