package com.example.webproject.controller;



import com.example.webproject.BEAN.Order;
import com.example.webproject.BEAN.Product;
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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String name  = request.getParameter("name");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        HttpSession session = request.getSession();
//        Cart cart =(Cart) session.getAttribute("cart");
//        Collection<Product> list = (List<Product>) cart.getProductList();
        OrderDAO orderDAO = new OrderDAO();
        Map<String, Product> cart = (HashMap<String, Product>) session.getAttribute("cart");

        int total = 0;
        for(Map.Entry<String,Product> entry : cart.entrySet()){
            total += entry.getValue().getQuantitySold()*entry.getValue().getGiaSP();

        }
        Order order = new Order(name,address,email,phoneNumber,total);
        orderDAO.createOrder(order);
        response.sendRedirect(request.getContextPath()+"/cart");



    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request,response);

    }
}
