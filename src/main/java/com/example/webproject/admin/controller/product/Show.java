package com.example.webproject.admin.controller.product;

import com.example.webproject.BEAN.Category;
import com.example.webproject.BEAN.Product;
import com.example.webproject.DAO.daoimpl.CategoryDAOImpl;
import com.example.webproject.DAO.daoimpl.ProductListDAOImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Show", value = "/admin/product")
public class Show extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductListDAOImpl dao = new ProductListDAOImpl();
        CategoryDAOImpl categoryDAO = new CategoryDAOImpl();
        List<Product> list = dao.getAllProduct();
        List<Category> listC = categoryDAO.getAllCategories();
        request.setAttribute("listP",list);
        request.setAttribute("listC",listC);
        request.getRequestDispatcher("/admin/quanlisanpham.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
