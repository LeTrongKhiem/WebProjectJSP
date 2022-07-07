package com.example.webproject.admin.controller.order;

import com.example.webproject.DAO.daoimpl.BannerDAOImpl;
import com.example.webproject.admin.dao.impl.OrderDAOImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteOrder", value = "/deleteOrder")
public class DeleteOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        int orderId = Integer.parseInt(id);
        OrderDAOImpl dao = new OrderDAOImpl();
        dao.deleteOrder(orderId);
        response.sendRedirect(request.getContextPath()+"/admin/order");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
