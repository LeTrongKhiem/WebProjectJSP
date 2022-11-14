package com.example.webproject.admin.controller.news;

import com.example.webproject.admin.dao.impl.NewsDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

@WebServlet(name = "EditNewsController", value = "/admin/editNews")
public class EditNewsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String maTinTuc=request.getParameter("eMaTinTuc");
        String tieuDe = request.getParameter("eTieuDe");
        String tomTat = request.getParameter("eTomTat");
        String noiDung = request.getParameter("eNoiDung");
        Date ngayDang= Date.valueOf(request.getParameter("eNgayDang"));
        String tacGia = request.getParameter("eTacGia");
        String linkanh = request.getParameter("epLinkanh");

        NewsDAOImpl dao = new NewsDAOImpl();
        dao.editNews(maTinTuc,tieuDe,tomTat,noiDung,ngayDang,tacGia,linkanh);

        response.sendRedirect("news");
    }
}
