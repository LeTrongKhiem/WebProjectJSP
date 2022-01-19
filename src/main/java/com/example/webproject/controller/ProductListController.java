package com.example.webproject.controller;

import com.example.webproject.BEAN.Category;
import com.example.webproject.BEAN.Product;
import com.example.webproject.BEAN.ProductList;
import com.example.webproject.DAO.daoimpl.CategoryDAOImpl;
import com.example.webproject.DAO.daoimpl.ProductDAOImpl;
import com.example.webproject.DAO.daoimpl.ProductListDAOImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductListController", value = "/ProductListController")
public class ProductListController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String madanhmuc = request.getParameter("madanhmuc");
        String loaiSp = request.getParameter("loaisanpham");
        ArrayList<ProductList> list;
        if (madanhmuc.equals("100001")) {
            list = new ProductDAOImpl().getListProductByCategoryParent("DT");
        } else if (madanhmuc.equals("200001")) {
            list = new ProductDAOImpl().getListProductByCategoryParent("LT");
        } else if (madanhmuc.equals("300001")) {
            list = new ProductDAOImpl().getListProductByCategoryParent("phukien");
        } else {
            list = ProductListDAOImpl.getInstance().getListProductByCategory(madanhmuc);
        }
//        request.setAttribute("productList", list);
        request.setAttribute("listParent", list);
        request.getRequestDispatcher("tonghopsanpham.jsp").forward(request, response);
//        request.getRequestDispatcher("productlist.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

}
