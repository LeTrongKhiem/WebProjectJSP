package com.example.webproject.admin.controller.category;

import com.example.webproject.DAO.daoimpl.CategoryDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteCategoryController", value = "/admin/deleteCategory")
public class DeleteCategoryController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String maDanhMuc = request.getParameter("maDanhMuc");
        CategoryDAOImpl dao = new CategoryDAOImpl();
        dao.deleteCategory(maDanhMuc);
        response.sendRedirect(request.getContextPath()+"/admin/category");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
