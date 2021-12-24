package com.example.webproject.controller;

import com.example.webproject.BEAN.User;
import com.example.webproject.BEAN.VerifyUtils;
import com.example.webproject.DAO.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "LoginController", value = "/LoginController")
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<String> userLogged = (List<String>) getServletContext().getAttribute("userLogged");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        ServletContext context = getServletContext();
        String urlRQ = (String) context.getAttribute("url");
        Map<String, User> listUser = (Map<String, User>) session.getAttribute("listUser");
        //check login
        if (listUser.containsKey(email) && listUser.get(email).equals(password)) { //check login
            User user = listUser.get(email);//get 1 user
            session.setAttribute("user", user);//save user
            session.setMaxInactiveInterval(3000 * 60);
            userLogged.add(email);
            context.setAttribute("userLogged", userLogged);
            session.setAttribute("email", email);
            String encodedURL = response.encodeRedirectURL(urlRQ);
            response.sendRedirect(encodedURL);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<String> userLogged = (List<String>) getServletContext().getAttribute("userLogged");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordHash = hashPassword(password);
        ServletContext context = getServletContext();
        String urlRQ = (String) context.getAttribute("url");
        //check valid
        boolean valid = true;
        String error = null;
        String errorCC = null;
        Map<String, User> listUser = (Map<String, User>) session.getAttribute("listUser");
        //check login
        if (!listUser.containsKey(email) || !listUser.get(email).getPassword().equals(passwordHash)) {
            valid = false;
            error = "Tài khoản hoặc mật khẩu không chính xác!!";
        }
        //check capcha google
        if (valid) {
            String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
            valid = VerifyUtils.verify(gRecaptchaResponse);
            if (!valid) {
                errorCC = "Capcha không chính xác !";
            }
        }
        if (valid) {//add cookie user
            User user = listUser.get(email);
            session.setAttribute("user", user);
            session.setMaxInactiveInterval(3000 * 60);
            Cookie userCookie = new Cookie("user", URLEncoder.encode(user.getName(), "UTF-8"));
            userLogged.add(email);
            context.setAttribute("userLogged", userLogged);//them vao tai khoan da dang nhap
            session.setAttribute("email", email);
            response.addCookie(userCookie);
            String encodedURL = response.encodeRedirectURL(urlRQ);
            response.sendRedirect(encodedURL);
        } else if (!valid) {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            if (error != null) {//check error login
                request.setAttribute("errorAccount", error);
                request.setAttribute("email", email);
                request.setAttribute("pass", passwordHash);
                RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/dangnhap.jsp");
                requestDispatcher.forward(request, response);
            } else if (errorCC != null) {//check error capcha
                request.setAttribute("errorCC", errorCC);
                request.setAttribute("email", email);
                request.setAttribute("pass", passwordHash);
                RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/dangnhap.jsp");
                requestDispatcher.forward(request, response);
            }
            valid = true;
        }


//        User user = UserDAO.getInstance().getInfoUser(email);
//        if (UserDAO.getInstance().checkLogin(email, password)) {
//            HttpSession session = request.getSession();
//            session.setAttribute("user", user);
//            response.sendRedirect("index.jsp");
//        } else {
//            request.setAttribute("error", "Username or Password is incorrect");
//            request.getRequestDispatcher("dangnhap.jsp").forward(request, response);
//        }
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
