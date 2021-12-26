package com.example.webproject.controller;

import com.example.webproject.BEAN.User;
import com.example.webproject.DAO.UserDAO;
import com.example.webproject.service.SendEmail;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@WebServlet(name = "RegisterController", value = "/RegisterController")
public class RegisterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        String date = request.getParameter("date");
        String month = request.getParameter("month");
        String year = request.getParameter("year");
        String password = request.getParameter("password");
        String passwordHash = hashPassword(password);
        String re_password = request.getParameter("re_password");
        String re_passwordHash = hashPassword(re_password);

        //change code by hashPassword
        String code;
        Random random = new Random();
        random.nextInt(999999);
        code = hashPassword("" + random);

        User user = new User(name, email, phone, gender, date, month, year, passwordHash, re_passwordHash);
        user.setCode(code);
        //create DAO file


        Map<String, User> listUser = (Map<String, User>) session.getAttribute("listUser");
        if (listUser == null) {
            listUser = new HashMap<String, User>();
        }
        listUser.put(user.getEmail(), user);
//        UserDAO.getInstance().register(user);
        UserDAO userDAO = new UserDAO();
        String str = userDAO.registerUser(user);
        if (str.equals("Success")) {
            response.sendRedirect("verify.jsp");
            request.setAttribute("email", email);
            session.setAttribute("listUser", listUser);
        } else {
            response.sendRedirect("index.jsp");
        }
//        session.setAttribute("listUser", listUser);
//        response.sendRedirect("dangnhap.jsp");
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

    }
}
