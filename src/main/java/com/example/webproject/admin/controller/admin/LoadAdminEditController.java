package com.example.webproject.admin.controller.admin;

import com.example.webproject.BEAN.Admin;
import com.example.webproject.DAO.daoimpl.AdminDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "LoadAdminEdit", value = "/admin/edit-admin")
public class LoadAdminEditController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        AdminDAOImpl adminDAO = new AdminDAOImpl();
        String adminId = request.getParameter("adminId");
        Admin admin = adminDAO.getAdminByAdminId(Integer.parseInt(adminId));
        request.setAttribute("detailAdmin",admin);
        System.out.println(admin);
        request.getRequestDispatcher("/admin/editAdmin.jsp").forward(request,response);
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
