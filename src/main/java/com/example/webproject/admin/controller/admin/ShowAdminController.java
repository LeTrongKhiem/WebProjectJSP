package com.example.webproject.admin.controller.admin;


import com.example.webproject.BEAN.Admin;

import com.example.webproject.DAO.daoimpl.AdminDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ShowAdminController", value = "/admin/admin")
public class ShowAdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminDAOImpl adminDAO = new AdminDAOImpl();
        List<Admin> listA = adminDAO.getListAdmin();
        request.setAttribute("listA", listA);
        request.getRequestDispatcher("/admin/quanlyadmin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
