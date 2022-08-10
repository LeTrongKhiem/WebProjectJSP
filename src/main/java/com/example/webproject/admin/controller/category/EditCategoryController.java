package com.example.webproject.admin.controller.category;

import com.example.webproject.DAO.daoimpl.CategoryDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

        CategoryDAOImpl dao = new CategoryDAOImpl();
        dao.editCatelogy(madanhmuc,tenDanhMuc,danhMuCha);

        response.sendRedirect("category");
    }
}
