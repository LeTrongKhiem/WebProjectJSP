package com.example.webproject.controller.cart;

import com.example.webproject.BEAN.Cart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import com.google.api.client.json.Json;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@WebServlet(name = "ShowController", value = "/cart")
public class ShowController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
//        Cart cart = (Cart) session.getAttribute("cart");
        String sessionCart = (String) session.getAttribute("cart");
//        List<Cart> cart = session.getAttribute("cart");
//        if (cart == null) {
//            cart = Cart.getInstance();
//
//        }
//        session.setAttribute("cart", cart);

//        ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
//        String json = ow.writeValueAsString(cart);
        Gson gson = new Gson();
        JsonParser parser = new JsonParser();
        JsonObject object = (JsonObject) parser.parse(sessionCart);// response will be the json String
        Cart emp = gson.fromJson(object, Cart.class);
//        gson.toJson(sessionCart);
        request.setAttribute("cart", emp);
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
