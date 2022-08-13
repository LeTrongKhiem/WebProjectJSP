package com.example.webproject.admin.controller.admin;


import com.example.webproject.DAO.daoimpl.AdminDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

@WebServlet(name = "AddAdminController", value = "/admin/addadmin")
public class AddAdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("quanlyadmin.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String matKhau  = request.getParameter("pMatKhau");
        int adminId = Integer.parseInt(request.getParameter("pAdminId"));
        String hoTen = request.getParameter("pHoTen");
        String email = request.getParameter("pEmail");
        String sDT = request.getParameter("pSDT");
        Date ngayBatDau = Date.valueOf(request.getParameter("pNgayBD"));
        String quyen = request.getParameter("pQuyen");
        String role = request.getParameter("pRole");
        String active = request.getParameter("pActive");
        String code = request.getParameter("pCode");
        String address = request.getParameter("PAddress");

        AdminDAOImpl dao = new AdminDAOImpl();
        dao.createAdmin( adminId, matKhau, hoTen, email, sDT, ngayBatDau, quyen, role, active, code, address);
        response.sendRedirect("admin");
    }

}
