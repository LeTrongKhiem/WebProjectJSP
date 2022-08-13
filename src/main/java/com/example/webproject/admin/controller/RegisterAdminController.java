package com.example.webproject.admin.controller;

import com.example.webproject.BEAN.User;
import com.example.webproject.BEAN.Admin;
import com.example.webproject.admin.dao.impl.AdminDAOImpl;
import com.example.webproject.controller.RegisterController;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@WebServlet(name = "RegisterAdminController", value = "/admin/RegisterAdminController")
public class RegisterAdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("AdminRegister.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        String name = request.getParameter("fname");
//        String bd = request.getParameter("bd");
//        Date bd1 = null;
//        try {
//            bd1 = (Date) new SimpleDateFormat("yyyy/MM/dd").parse(bd);
//        } catch (ParseException e) {
//            e.printStackTrace();
//        }
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String pass = request.getParameter("password");
        String role = request.getParameter("role");
        String passHash = hashPassword(pass);
        int roleI = Integer.parseInt(role);
        String code;
        Random random = new Random();
        random.nextInt(999999);
        code = hashPassword("" + random);

        Admin admin = new Admin(passHash, name, email, phone, address);
        admin.setCode(code);
        admin.setRole(roleI);
        Map<String, Admin> listAdmin = (Map<String, Admin>) session.getAttribute("listAdmin");
        if (listAdmin == null) {
            listAdmin = new HashMap<String, Admin>();
        }
        AdminDAOImpl adminDAO = new AdminDAOImpl();
        String str = adminDAO.register(admin);
        if (str.equals("Success")) {
            listAdmin.put(admin.getEmail(), admin);
            response.sendRedirect(request.getContextPath() + "/admin/AdminLogin.jsp");
            request.setAttribute("email", email);
            session.setAttribute("email", email);
//            request.setAttribute("username", username);
//            session.setAttribute("username", username);
            session.setAttribute("listAdmin", listAdmin);
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/quanlynhanvien.jsp");
        }
    }

    public String hashPassword(String password) {
        try {
            MessageDigest sha256 = null;
            sha256 = MessageDigest.getInstance("SHA-256");
            byte[] hash = sha256.digest(password.getBytes());
            BigInteger number = new BigInteger(1, hash);
            return number.toString(16);
        } catch (NoSuchAlgorithmException e) {
            return null;
        }
    }

    public static void main(String[] args) {
        String bd = "12-jan-2022";
        Date bd1 = null;
        try {
            bd1 = (Date) new SimpleDateFormat("yyyy/MM/dd").parse(bd);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        System.out.println(bd1);
    }
}
