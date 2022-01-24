package com.example.webproject.admin.controller.product;

import com.example.webproject.DAO.daoimpl.ProductListDAOImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EditProduct", value = "/admin/edit")
public class EditProduct extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String id =  request.getParameter("Eid");
        String name = request.getParameter("EName");
        String image = request.getParameter("Eimage");
        String maDanhMuc = request.getParameter("Ecategory");
        int price = Integer.parseInt(request.getParameter("EPrice"));
        String loaiSP = request.getParameter("EloaiSP");
        ProductListDAOImpl dao = new ProductListDAOImpl();
        dao.editProduct(id,name,image,price,loaiSP,maDanhMuc);
        response.sendRedirect("product");
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request,response);
    }
}
