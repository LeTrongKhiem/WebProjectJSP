package com.example.webproject.admin.controller.admin;

import com.example.webproject.DAO.daoimpl.AdminDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

@WebServlet(name = "EditAdminController", value = "/admin/editAdmin")
public class EditAdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String matKhau  = request.getParameter("eMatKhau");
        int id = Integer.parseInt(request.getParameter("eId"));
        String hoTen = request.getParameter("eHoTen");
        String email = request.getParameter("eEmail");
        String sDT = request.getParameter("eSDT");
        Date ngayBatDau = Date.valueOf(request.getParameter("eNgayBD"));
        String quyen = request.getParameter("eQuyen");
        String role = request.getParameter("eRole");
        String active = request.getParameter("eActive");
        String code = request.getParameter("eCode");
        String address = request.getParameter("eAddress");

        AdminDAOImpl dao = new AdminDAOImpl();
        dao.editAdmin(id, matKhau, hoTen, email, sDT, ngayBatDau, quyen, role, active, code, address);

        response.sendRedirect("admin");
    }
}
