package com.example.webproject.admin.controller.category;

import com.example.webproject.DAO.daoimpl.CategoryDAOImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EditCategoryController", value = "/admin/editCategory")
public class EditCategoryController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String madanhmuc  = request.getParameter("categoryId");
        String danhMuCha = request.getParameter("EDanhMucCha");
        String tenDanhMuc = request.getParameter("ECategoryName");
        System.out.println(madanhmuc);
        System.out.println(danhMuCha);
        System.out.println(tenDanhMuc);
        CategoryDAOImpl dao = new CategoryDAOImpl();
        dao.editCatelogy(madanhmuc,tenDanhMuc,danhMuCha);

        response.sendRedirect("category");
    }
}
