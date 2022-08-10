package com.example.webproject.controller;

import com.example.webproject.BEAN.Product;
import com.example.webproject.BEAN.ProductList;
import com.example.webproject.DAO.daoimpl.ProductDAOImpl;
import com.example.webproject.DAO.daoimpl.ProductListDAOImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "DetailController", value = "/DetailController")
public class DetailController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("id");
        ProductListDAOImpl dao = new ProductListDAOImpl();
        ProductDAOImpl dao1 = new ProductDAOImpl();
//        Product p = ProductService.getInstance().getById(id);
        Product p = dao.getProductByID(id);
        List<ProductList> productRelated = dao1.getProductRelated(p.getCategoryId(), id);
//        PhoneProduct p = dao.getPhoneByID(id);
        request.setAttribute("detail", p);
        request.setAttribute("related", productRelated);
        request.getRequestDispatcher("trangitem.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
