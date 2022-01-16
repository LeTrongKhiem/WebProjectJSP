package com.example.webproject.controller;

import com.example.webproject.BEAN.Category;
import com.example.webproject.BEAN.Product;
import com.example.webproject.BEAN.ProductList;
import com.example.webproject.DAO.daoimpl.CategoryDAOImpl;
import com.example.webproject.DAO.daoimpl.ProductListDAOImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductListController", value = "/ProductListController")
public class ProductListController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String madanhmuc = request.getParameter("madanhmuc");
//        String loaiSp = request.getParameter("loaisanpham");
//        ArrayList<ProductList> list = ProductListDAOImpl.getInstance().getListProductByCategory(madanhmuc);
//        request.setAttribute("productList", list);
        if(madanhmuc.equals("100001")){
            String txt = request.getParameter("index");
            int index = 0;
            if(txt == null){
                index = 1;
            }else{
                index = Integer.parseInt(txt);
            }
            ProductListDAOImpl productListDAO = new ProductListDAOImpl();
            List<Product> productList = productListDAO.getTop(index);
            request.setAttribute("listZ", productList);
//            request.getRequestDispatcher("productlist.jsp").forward(request,response);;
        }else {
        request.getRequestDispatcher("productlist.jsp").forward(request, response);}
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

}
