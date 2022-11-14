package com.example.webproject.admin.controller.product;

import com.example.webproject.DAO.daoimpl.ProductListDAOImpl;
import com.example.webproject.admin.dao.impl.WareHouseDAOImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DelectProduct", value = "/admin/delete")
public class DelectProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        ProductListDAOImpl dao = new ProductListDAOImpl();
        WareHouseDAOImpl wareDAO = new WareHouseDAOImpl();
        dao.deleteProductAdmin(id);
        wareDAO.deleteWareHouse(id);
        dao.deleteProductDetail(id);
        response.sendRedirect(request.getContextPath()+"/admin/product");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
