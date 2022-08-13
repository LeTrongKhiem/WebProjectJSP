package com.example.webproject.admin.controller.admin;

import com.example.webproject.DAO.daoimpl.AdminDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteAdminController", value = "/admin/deleteAdmin")
public class DeleteAdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        AdminDAOImpl dao = new AdminDAOImpl();
        dao.deleteAdmin(id);
        response.sendRedirect(request.getContextPath()+"/admin/admin");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
