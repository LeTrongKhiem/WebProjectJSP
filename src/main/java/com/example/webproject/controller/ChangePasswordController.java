package com.example.webproject.controller;

import com.example.webproject.BEAN.User;
import com.example.webproject.DAO.daoimpl.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@WebServlet(name = "ChangePasswordController", value = "/ChangePasswordController")
public class ChangePasswordController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String newPass = request.getParameter("newPass");
        String confirmPass = request.getParameter("confirmPass");
        String confirmPassHash = hashPassword(confirmPass);
        String address = request.getParameter("address");
        User updateUser = new User(user.getName(), address, user.getEmail(), user.getPhone(), user.getGender(), user.getDate(), user.getMonth(), user.getYear(), confirmPassHash);
        if (UserDAO.getInstance().editPassword(updateUser)) {
            session.setAttribute("user", updateUser);
            request.setAttribute("changePass", "Cập nhật thông tin thành công. Vui lòng đăng xuất và đăng nhập lại bằng mật khẩu quý khách vừa thay đổi!");

        }
//        response.sendRedirect("thongtincanhan.jsp?action=doimk");
        request.getRequestDispatcher("thongtincanhan.jsp").forward(request, response);
    }

    public String hashPassword(String password) {//method hash password
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
