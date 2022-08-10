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
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10 * 2, // 10MB
        maxRequestSize = 1024 * 1024 * 50 * 2)
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
        String file =request.getServletContext().getRealPath(product.getLink_hinhanh());
        request.setAttribute("file", file);
        request.setAttribute("detail",product);
        request.setAttribute("listC",listC);
        request.getRequestDispatcher("/admin/EditProduct.jsp").forward(request,response);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request,response);
    }
    private String extractFileName(Part part) {//This method will print the file name.
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
