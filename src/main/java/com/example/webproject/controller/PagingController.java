package com.example.webproject.controller;


import com.example.webproject.BEAN.Product;
import com.example.webproject.DAO.daoimpl.ProductListDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "PagingController", value = "/paging")
public class PagingController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
//        String txtSearch =  request.getParameter("txt");
        String txt = request.getParameter("index");
        int index = 0;
        if(txt == null){
            index = 1;
        }else{
            index = Integer.parseInt(txt);
        }
        ProductListDAOImpl dao = new ProductListDAOImpl();
        List<Product> list = dao.getTop(index);
        request.setAttribute("product", list);
        request.getRequestDispatcher("productlist.jsp").forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }


}
