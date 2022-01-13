package com.example.webproject.controller;

import com.example.webproject.DAO.FilterProduct;
import com.example.webproject.DAO.daoimpl.FilterProductIpml;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "FilterController", value = "/FilterController")
public class FilterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String locgia = request.getParameter("locgia");
        String chongia = request.getParameter("chongia");
        FilterProductIpml filterProduct = new FilterProductIpml();
        filterProduct.sortByPrice(locgia);
        if (filterProduct.listProduct.size() > 0) {
            request.getSession().setAttribute("list", filterProduct.listProduct);
            response.sendRedirect("filterproduct.jsp");
        }
        if (chongia != null) {
            filterProduct.selectByPrice(Integer.parseInt(chongia));
            request.getSession().setAttribute("list1", filterProduct.listFilter);
            response.sendRedirect("filterproduct.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
