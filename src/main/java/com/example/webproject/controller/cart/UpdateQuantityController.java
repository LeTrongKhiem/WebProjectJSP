package com.example.webproject.controller.cart;


import com.example.webproject.BEAN.Cart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;

@WebServlet(name = "UpdateQuantityController", value = "/updateQuantity")
public class UpdateQuantityController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        int quantity = Integer.parseInt(request.getParameter("quantity"));
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart.get(id) == null) {
            response.setStatus(404);
            return;
        }
        if(quantity==0){
            cart.remove(id);
        }else {
        cart.updateQuantitySold(id,quantity);
//        cart.updateQuantity(id,quantity);
        }
        session.setAttribute("cart", cart);
        response.sendRedirect(request.getContextPath()+"/cart");
    }
}
