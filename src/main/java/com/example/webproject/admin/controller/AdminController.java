package com.example.webproject.admin.controller;

import com.example.webproject.BEAN.Admin;
import com.example.webproject.admin.dao.impl.AdminDAOImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "AdminController", value = "/AdminController")
public class AdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, Admin> list = AdminDAOImpl.getInstance().getListEmployee();
        request.setAttribute("list", list);
        request.getRequestDispatcher("/WebProject/admin/quanlinhanvien.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
