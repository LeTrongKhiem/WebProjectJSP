package com.example.webproject.controller;

import com.example.webproject.BEAN.Product;
import com.example.webproject.BEAN.ProductList;
import com.example.webproject.DAO.daoimpl.ProductListDAOImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "PagingController", value = "/PagingController")
public class PagingController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        //String txtSearch = request.getParameter("txt");
        String txt = request.getParameter("index");
        String madanhmuc = request.getParameter("madanhmuc");
        int index = 0;
        if (txt == null) {
            index = 1;
        } else {
            index = Integer.parseInt(txt);
        }
        ProductListDAOImpl dao = new ProductListDAOImpl();
        List<Product> list = dao.getTop(index, madanhmuc);
        request.setAttribute("product", list);
        request.setAttribute("madanhmuc", madanhmuc);
        request.getRequestDispatcher("productlist.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
