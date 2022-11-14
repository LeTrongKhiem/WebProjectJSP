package com.example.webproject.admin.controller.category;

import com.example.webproject.BEAN.Category;
import com.example.webproject.DAO.daoimpl.CategoryDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "LoadCategoryEdit", value = "/admin/edit-category")
public class LoadCategoryEditController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        CategoryDAOImpl categoryDAO = new CategoryDAOImpl();
        String maDanhMuc = request.getParameter("maDanhMuc");
        Category category = categoryDAO.getCategotyByMaDanhMuc(maDanhMuc);
        request.setAttribute("detailCatelogy",category);
        System.out.println(category);
        request.getRequestDispatcher("/admin/editCategory.jsp").forward(request,response);
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
