package com.example.webproject.controller;


import com.example.webproject.BEAN.*;
import com.example.webproject.DAO.OrderDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "OrderController", value = "/order")
public class OrderController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        User user = (User) session.getAttribute("user");
        HashMap<String, Product> list = (HashMap<String, Product>) cart.getProductsList();
        OrderDAO orderDAO = new OrderDAO();
        int total = 0;
        for (Map.Entry<String, Product> entry : list.entrySet()) {
            total += entry.getValue().getQuantitySold() * entry.getValue().getGiaSP();
        }
        Order order = new Order(user.getEmail(), name, address, email, phoneNumber, total);
        order.setUser(user.getEmail());
        order.setTotalPrice(total);
        int orderID = orderDAO.createOrder(order);
        try {
            for (Map.Entry<String, Product> entry : list.entrySet()) {
                orderDAO.createOrderDetail(new OrderDetail(orderID, entry.getValue().getMaSP(), entry.getValue().getQuantitySold(), entry.getValue().getQuantitySold() * entry.getValue().getGiaSP()));
            }
        } catch (Exception e) {

        }


        response.sendRedirect(request.getContextPath() + "/checkout-success.jsp");
        session.removeAttribute("cart");

    }


}
