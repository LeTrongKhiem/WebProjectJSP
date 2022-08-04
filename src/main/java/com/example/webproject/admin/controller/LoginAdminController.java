package com.example.webproject.admin.controller;

import com.example.webproject.BEAN.Admin;

import javax.faces.bean.SessionScoped;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Map;

@WebServlet(name = "LoginAdminController", value = "/LoginAdminController")
public class LoginAdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String hashPassword = hashPassword(password);
        ServletContext context = getServletContext();
        //check
        boolean valid = true;
        String error = null;
        Map<String, Admin> listAdmin = (Map<String, Admin>) session.getAttribute("listAdmin");
        if (!listAdmin.containsKey(email) || !listAdmin.get(email).getMatKhau().equals(hashPassword)) {
            valid = false;
            error = "Tài khoản hoặc mật khẩu không chính xác!!";
        }
        if (valid) { //check
            Admin admin = listAdmin.get(email);
            session.setAttribute("admin", admin);
            session.setMaxInactiveInterval(30 * 60);

            Cookie userCookie = new Cookie("admin", URLEncoder.encode(admin.getHoTen(), "UTF-8"));
            request.setAttribute("email", email);
            response.addCookie(userCookie);
//            String encodedURL = response.encodeRedirectURL(urlRQ);
//            response.sendRedirect(encodedURL);
            response.sendRedirect(request.getContextPath()+ "/admin/quan-ly-nhan-vien");
        } else if (!valid) {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            if (error != null) {
                request.setAttribute("errorAccount", error);
                request.setAttribute("email", email);
                request.setAttribute("pass", hashPassword);
                RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/AdminLogin.jsp");
                requestDispatcher.forward(request, response);
            }
        }
        valid = true;
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
}
