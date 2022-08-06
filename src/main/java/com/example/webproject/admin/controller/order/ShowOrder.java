package com.example.webproject.admin.controller.order;

import com.example.webproject.BEAN.Order;
import com.example.webproject.BEAN.OrderDetail;
import com.example.webproject.admin.dao.impl.OrderDAOImpl;
import com.example.webproject.admin.dao.impl.WareHouseDAOImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ShowOrder", value = "/admin/order")
public class ShowOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderDAOImpl orderDAO = new OrderDAOImpl();
        boolean status = Boolean.parseBoolean(request.getParameter("status"));
        ArrayList<Order> listOrder = orderDAO.getListOrder(status);

        request.setAttribute("listOrder", listOrder);
        request.getRequestDispatcher("/admin/OrderManager.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
