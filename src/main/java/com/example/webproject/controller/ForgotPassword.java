package com.example.webproject.controller;

import com.example.webproject.BEAN.RandomPassword;
import com.example.webproject.BEAN.User;
import com.example.webproject.DAO.UserDAO;

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
        if (sendMail(email, "Reset Password TGMobile", password)) {
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

    public static boolean sendMail(String to, String subject, String text) {
        String mailFrom = "tgmobile.cskh@gmail.com";
        String passEmailFrom = "letrongkhiem19130102";
        Properties properties = new Properties();
//        properties.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
//        properties.put("mail.smtp.port", "587"); //TLS Port
//        properties.put("mail.smtp.auth", "true"); //enable authentication
//        properties.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
        properties.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
        properties.put("mail.smtp.socketFactory.port", "465"); //SSL Port
        properties.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory"); //SSL Factory Class
        properties.put("mail.smtp.auth", "true"); //Enabling SMTP Authentication
        properties.put("mail.smtp.port", "465"); //SMTP Port

        Session session = Session.getDefaultInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(mailFrom, passEmailFrom);
            }
        });
        try {
            MimeMessage message = new MimeMessage(session);
            message.addHeader("Content-type", "text/plan; charset=UTF-8");
//            message.addHeader("format", "flowed");
//            message.addHeader("Content-Transfer-Encoding", "8bit");
            message.setFrom(new InternetAddress(mailFrom));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setText("New Password is: " + text);
            Transport.send(message);
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    public static void main(String[] args) {
        sendMail("lekhiem2001@gmail.com", "test", "test");
    }
}
