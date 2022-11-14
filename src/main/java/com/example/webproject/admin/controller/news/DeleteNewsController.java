package com.example.webproject.admin.controller.news;

import com.example.webproject.admin.dao.impl.NewsDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteNewsController", value = "/admin/deleteNews")
public class DeleteNewsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String maTinTuc = request.getParameter("MaTinTuc");
        NewsDAOImpl dao = new NewsDAOImpl();
        dao.deleteNews(maTinTuc);
        response.sendRedirect(request.getContextPath()+"/admin/news");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
