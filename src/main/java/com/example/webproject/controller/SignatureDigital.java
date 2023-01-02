package com.example.webproject.controller;

import com.example.webproject.Authentication.SHA1Algorithm;
import com.example.webproject.BEAN.Order;
import com.example.webproject.BEAN.User;
import com.example.webproject.DAO.daoimpl.OrderDAO;
import com.example.webproject.DAO.daoimpl.UserDAO;
import com.example.webproject.service.Signature.AlgorithmRSA;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.math.BigInteger;
import java.security.NoSuchAlgorithmException;

@WebServlet(name = "SignatureDigital", value = "/SignatureDigital")
public class SignatureDigital extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String privateKey = request.getParameter("privateKey");
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        OrderDAO orderDAO = new OrderDAO();
        AlgorithmRSA algorithmRSA = new AlgorithmRSA();
        Order order = orderDAO.getOrderDetail(orderId);
        String hasingSHA1String = null;
        try {
            BigInteger hashingSHA1 = SHA1Algorithm.encrypt(order.toString());
            hasingSHA1String = new String(hashingSHA1.toByteArray());
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
        UserDAO userDAO = new UserDAO();
        User userInfo = userDAO.getInfoUser(user.getEmail());
        String cipherText = algorithmRSA.encrypt(hasingSHA1String, new BigInteger(privateKey), new BigInteger(userInfo.getPublicKeyN()));
        request.setAttribute("cipherText", cipherText);

        String planText = algorithmRSA.decrypt(cipherText, new BigInteger(userInfo.getPublicKeyE()), new BigInteger(userInfo.getPublicKeyN()));
    }
}
