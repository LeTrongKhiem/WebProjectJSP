package com.example.webproject.controller.cart;


import com.example.webproject.BEAN.Cart;
import com.google.gson.Gson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "UpdateQuantityController", value = "/updateQuantity")
public class UpdateQuantityController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");


        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart.get(id) == null) {
            response.setStatus(404);
            return;
        }
        int quantity = cart.get(id).getQuantitySold();
        try {
            quantity = Integer.parseInt(request.getParameter("quantity"));
        } catch (Exception e) {
            response.getWriter().println(new Gson().toJson(Map.of("quantity", quantity)));
            return;
        }
//        if (quantity == 0) {
//            cart.remove(id);
//        } else {
           int quantitySold =  cart.updateQuantitySold(id, quantity);

//        cart.updateQuantity(id,quantity);
            response.getWriter().println(new Gson().toJson(Map.of("quantity", quantitySold)));
//        }
        session.setAttribute("cart", cart);
    }
}
