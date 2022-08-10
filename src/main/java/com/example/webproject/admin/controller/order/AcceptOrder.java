package com.example.webproject.admin.controller.order;

import com.example.webproject.BEAN.OrderDetail;
import com.example.webproject.BEAN.WareHouse;
import com.example.webproject.DAO.daoimpl.ProductListDAOImpl;
import com.example.webproject.admin.dao.impl.OrderDAOImpl;
import com.example.webproject.admin.dao.impl.WareHouseDAOImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AcceptOrder", value = "/admin/accept")
public class AcceptOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        int orderId = Integer.parseInt(id);
        OrderDAOImpl dao = new OrderDAOImpl();
        WareHouseDAOImpl wDao = new WareHouseDAOImpl();
        List<OrderDetail> od = wDao.getWarehouseByOrderId(id);
        boolean i;
        i = dao.acceptOrder(orderId);
        if (i) {
            for (OrderDetail o : od) {
                int quantityOrder = o.getQuantity();
                WareHouse wareHouse = wDao.getQuantity(o.getProductId());
                int quantityWarehouse = wareHouse.getQuantity();
                wDao.updateWarehouse(o.getProductId(), quantityOrder, quantityWarehouse);
            }
        }
        response.sendRedirect(request.getContextPath() + "/admin/order");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
