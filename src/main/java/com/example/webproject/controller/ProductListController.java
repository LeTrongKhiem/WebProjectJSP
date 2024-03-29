package com.example.webproject.controller;

import com.example.webproject.BEAN.Category;
import com.example.webproject.BEAN.Product;
import com.example.webproject.BEAN.ProductList;
import com.example.webproject.DAO.daoimpl.CategoryDAOImpl;
import com.example.webproject.DAO.daoimpl.FilterProductIpml;
import com.example.webproject.DAO.daoimpl.ProductDAOImpl;
import com.example.webproject.DAO.daoimpl.ProductListDAOImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductListController", value = "/ProductListController")
public class ProductListController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String madanhmuc = request.getParameter("madanhmuc");
        String loaiSp = request.getParameter("loaisanpham");
        String locgia = request.getParameter("locgia");
        FilterProductIpml filterProduct = new FilterProductIpml();
        List<ProductList> list;
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
//        String amount = request.getParameter("exits");
//        int amountI = Integer.parseInt(amount);
        if (madanhmuc.equals("100001") && (locgia == null) ) {
            list = new ProductDAOImpl().getNextProduct(0, "DT");
        } else if (madanhmuc.equals("200001")) {
            list = new ProductDAOImpl().getNextProduct(0, "LT");
        } else if (madanhmuc.equals("300001")) {
            list = new ProductDAOImpl().getNextProduct(0, "phukien");
        } else if (madanhmuc.equals("100001") && (locgia.equals("caodenthap"))) {
            list = filterProduct.sortByPrice(0, "desc", madanhmuc);
            request.getSession().setAttribute("list", list);
            request.setAttribute("list", list);
//            response.sendRedirect("filterproduct.jsp");
            request.getRequestDispatcher("filterproduct.jsp").forward(request, response);
        }
        else {
            list = new ProductDAOImpl().getNextProductChild(0, madanhmuc);
        }

        request.setAttribute("listParent", list);
        request.setAttribute("madanhmucRequest", madanhmuc);
        request.getRequestDispatcher("tonghopsanpham.jsp").forward(request, response);
//

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
