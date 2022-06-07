package com.example.webproject.admin.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "LogoutAdminController", value = "/LogoutAdminController")
public class LogoutAdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ServletContext context = getServletContext();
//        String user = (String) session.getAttribute("user");
//        List<String> listUserLogged = (List<String>) getServletContext().getAttribute("userLogged");
//        listUserLogged.remove(user);
        List<String> ds = new ArrayList<>();
//        getServletContext().setAttribute("userLogged", ds);
        if (session != null) session.removeAttribute("admin");
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("username".equals(cookie.getName())) {
                    cookie.setMaxAge(0); // <=> remove cookie
                    response.addCookie(cookie); // add again
                    break;
                }
            }
        }
//        response.sendRedirect("admin/AdminLogin.jsp");
        request.getRequestDispatcher("/admin/AdminLogin.jsp").forward(request, response);
    }
}
