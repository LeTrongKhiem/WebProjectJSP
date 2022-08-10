package com.example.webproject.admin.controller.category;


import com.example.webproject.BEAN.Category;
import com.example.webproject.DAO.daoimpl.CategoryDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ShowCategoryController", value = "/admin/category")
public class ShowCategoryController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CategoryDAOImpl categoryDAO = new CategoryDAOImpl();
        List<Category> listC = categoryDAO.getAllCategories();
        request.setAttribute("listC", listC);
        request.getRequestDispatcher("/admin/quanlydanhmuc.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
