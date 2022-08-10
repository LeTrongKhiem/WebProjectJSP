package com.example.webproject.admin.controller.category;


import com.example.webproject.DAO.daoimpl.CategoryDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AddCategoryController", value = "/admin/addcategory")
public class AddCategoryController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("quanlydanhmuc.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String madanhmuc  = request.getParameter("pMaDanhMuc");
        String danhMuCha = request.getParameter("pdanhMucCha");
        String tenDanhMuc = request.getParameter("pTenDanhMuc");


        CategoryDAOImpl dao = new CategoryDAOImpl();
        dao.createCategory(tenDanhMuc,madanhmuc,danhMuCha);
        response.sendRedirect("category");
    }

}
