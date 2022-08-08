package com.example.webproject.controller;

import com.example.webproject.BEAN.ProductList;
import com.example.webproject.DAO.daoimpl.ProductDAOImpl;
import com.example.webproject.DAO.daoimpl.ProductListDAOImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletController", value = "/ServletController")
public class ServletController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<ProductList> listIndex = new ProductDAOImpl().getListProductByCategoryParent("DT");
        request.setAttribute("listIndex", listIndex);

        request.getRequestDispatcher("index.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
