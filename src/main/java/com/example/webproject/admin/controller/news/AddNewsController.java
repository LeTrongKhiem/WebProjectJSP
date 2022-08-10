package com.example.webproject.admin.controller.news;

import com.example.webproject.DAO.daoimpl.ProductListDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10 * 2, // 10MB
        maxRequestSize = 1024 * 1024 * 50 * 2)
@WebServlet(name = "AddCategoryController", value = "/admin/addcategory")
public class AddNewsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("quanlydanhmuc.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String madanhmuc=request.getParameter("ma");
        String name = request.getParameter("pName");
        String hdh = request.getParameter("pHDH");
        String ram = request.getParameter("pRAM");
        String cpu= request.getParameter("pCPU");
        String thietKe = request.getParameter("pThietKe");
        String manHinh = request.getParameter("pManHinh");
        String maDanhMuc = request.getParameter("category");
        int price = Integer.parseInt(request.getParameter("pPrice"));
        String loaiSP = request.getParameter("loaiSP");
        ProductListDAOImpl dao = new ProductListDAOImpl();
        response.sendRedirect("product");
    }
    private String extractFileName(Part part) {
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
