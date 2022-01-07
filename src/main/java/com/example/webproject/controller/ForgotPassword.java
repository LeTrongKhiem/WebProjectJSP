package com.example.webproject.controller;

import com.example.webproject.BEAN.RandomPassword;
import com.example.webproject.BEAN.User;
import com.example.webproject.DAO.UserDAO;
import com.example.webproject.service.SendEmail;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Map;
import java.util.Properties;

@WebServlet(name = "ForgotPassword", value = "/ForgotPassword")
public class ForgotPassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        Map<String, User> listUser = (Map<String, User>) session.getAttribute("listUser");
        User user = listUser.values().stream().filter(p -> p.getEmail().equals(email)).findFirst().get();

        String password = RandomPassword.getInstance().randomAlphaNumeric();
        user.setPassword(hashPassword(password));
        user.setRe_password(hashPassword(password));
        UserDAO.getInstance().editPassword(user);
        SendEmail sendEmail = new SendEmail();
        if (sendEmail.sendMail(email, "Reset Password TGMobile", password)) {
            session.setAttribute("listUser", UserDAO.getInstance().listUser());
            response.sendRedirect("verify.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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


    public static void main(String[] args) {
    }
}
