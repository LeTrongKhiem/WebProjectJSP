package com.example.webproject.admin.controller.product;

import com.example.webproject.BEAN.Category;
import com.example.webproject.BEAN.Product;
import com.example.webproject.DAO.daoimpl.CategoryDAOImpl;
import com.example.webproject.DAO.daoimpl.ProductListDAOImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoadProductEdit", value = "/admin/edit-product")
public class LoadProductEdit extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        ProductListDAOImpl dao = new ProductListDAOImpl();
        CategoryDAOImpl categoryDAO = new CategoryDAOImpl();
        String id = request.getParameter("id");
        Product product = dao.getProductByID(id);
        List<Category> listC = categoryDAO.getAllCategories();
        request.setAttribute("detail",product);
        request.setAttribute("listC",listC);
        request.getRequestDispatcher("/admin/editProduct.jsp").forward(request,response);
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
