package com.example.webproject.admin.controller.product;

import com.example.webproject.BEAN.Product;
import com.example.webproject.DAO.daoimpl.ProductListDAOImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AddProductController", value = "/admin/add")
public class AddProductController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String id =  request.getParameter("pid");
        String name = request.getParameter("pName");
        String image = request.getParameter("image");
        String maDanhMuc = request.getParameter("category");
        int price = Integer.parseInt(request.getParameter("pPrice"));
        String loaiSP = request.getParameter("loaiSP");
        ProductListDAOImpl dao = new ProductListDAOImpl();
        dao.insertProduct(id,name,image,price,loaiSP,maDanhMuc);
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

    public static void main(String[] args) {

    }
}
