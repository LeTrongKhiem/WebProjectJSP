package com.example.webproject.controller.cart;

import com.example.webproject.BEAN.Cart;
import com.example.webproject.BEAN.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CheckoutController", value = "/checkout")
public class CheckoutController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        HttpSession sessionUser = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        User user = (User) sessionUser.getAttribute("user");
        session.setAttribute("cart", cart);
        if (user == null) {
            response.sendRedirect("dangnhap.jsp");
        } else {
            response.sendRedirect("thanhtoan.jsp");
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}