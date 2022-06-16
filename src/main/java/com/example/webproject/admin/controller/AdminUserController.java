package com.example.webproject.admin.controller;

import com.example.webproject.BEAN.Admin;
import com.example.webproject.admin.dao.impl.AdminDAOImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "AdminUserController", value = "/AdminUserController")
public class AdminUserController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Admin> listAdmin = new AdminDAOImpl().getListAdminUser();
        request.setAttribute("getListAdmin", listAdmin);
        request.getRequestDispatcher("admin/quanlynhanvien.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
