package com.example.webproject.admin.controller.news;

import com.example.webproject.BEAN.News;
import com.example.webproject.admin.dao.impl.NewsDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "LoadNewsEdit", value = "/admin/edit-News")
public class LoadNewsEditController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        NewsDAOImpl newsDAO = new NewsDAOImpl();
        String maTinTuc=request.getParameter("maTinTuc");
        News news=newsDAO.getNewsByID(maTinTuc);
        request.getRequestDispatcher("/admin/editNews.jsp").forward(request,response);
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
