package com.example.webproject.admin.controller.news;

import com.example.webproject.BEAN.News;
import com.example.webproject.DAO.daoimpl.NewsDAOImpl;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.sql.Date;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10 * 2, // 10MB
        maxRequestSize = 1024 * 1024 * 50 * 2)
@WebServlet(name = "AddCategoryController", value = "/admin/addtintuc")
public class AddNewsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String maTinTuc=request.getParameter("pMaTinTuc");
        String tieuDe = request.getParameter("pTieuDe");
        String tomTat = request.getParameter("pTomTat");
        String noiDung = request.getParameter("pNoiDung");
        Date ngayDang= Date.valueOf(request.getParameter("pNgayDang"));
        String tacGia = request.getParameter("pTacGia");
        String linkanh = request.getParameter("pLinkanh");

        NewsDAOImpl dao = new NewsDAOImpl();
        dao.createNews(maTinTuc,tieuDe,tomTat,noiDung,ngayDang,tacGia,linkanh);
        response.sendRedirect("news");
    }

}
