package com.example.webproject.controller;

import com.example.webproject.BEAN.User;
import com.example.webproject.DAO.daoimpl.UserDAO;
import com.example.webproject.service.SendEmail;
import com.example.webproject.service.Signature.AlgorithmRSA;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpdatePrivateKey", value = "/UpdatePrivateKey")
public class UpdatePrivateKey extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User userSession = (User) session.getAttribute("user");
        String userEmail = userSession.getEmail();
        AlgorithmRSA algorithmRSA = new AlgorithmRSA();
        algorithmRSA.KeyRSA(1028);
        String privateKey = algorithmRSA.getDecrypt().toString();
        String publicKey = algorithmRSA.getEncrypt().toString();
        String publicKeyN = algorithmRSA.getN().toString();
        UserDAO userDAO = new UserDAO();
        User user = userDAO.getInfoUser(userEmail);
        SendEmail sendEmail = new SendEmail(user.getEmail(), privateKey, true);

        boolean check = userDAO.updatePublicKey(userEmail, publicKeyN, publicKey);
        if (check) {
            sendEmail.sendEmailPrivateKey("Update Private Key Your private key is: ");
            response.sendRedirect("successupdatekey.jsp");
        } else {
            response.sendRedirect("errorupdatekey.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
