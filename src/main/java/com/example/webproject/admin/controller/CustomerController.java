package com.example.webproject.admin.controller;

import com.example.webproject.BEAN.User;
import com.example.webproject.admin.dao.impl.AdminDAOImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "CustomerController", value = "/admin/CustomerController")
public class CustomerController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<User> listCustomer = new AdminDAOImpl().getListCustomer();
        request.setAttribute("listCustomer", listCustomer);
        request.getRequestDispatcher("/admin/quanlykhachhang.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
