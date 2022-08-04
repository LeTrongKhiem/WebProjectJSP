package com.example.webproject.admin.controller;

import com.example.webproject.BEAN.WareHouse;
import com.example.webproject.admin.dao.impl.WareHouseDAOImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "WareHouseController", value = "/admin/WareHouseController")
public class WareHouseController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("productId");
        WareHouseDAOImpl wareHouseDAO = new WareHouseDAOImpl();
        WareHouse wareHouse = wareHouseDAO.getQuantity(productId);
        if (wareHouse.getProductId() == null) {
            wareHouse.setProductId(productId);
            wareHouse.setQuantity(0);
        }
        request.setAttribute("warehouse", wareHouse);
        request.getRequestDispatcher("quanlykhohang.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("productId");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        WareHouseDAOImpl wareHouseDAO = new WareHouseDAOImpl();
        ArrayList<WareHouse> listWarehouse = wareHouseDAO.getWareHouse();
        for (WareHouse wh : listWarehouse) {
            if (wh.getProductId().equals(productId)) {
                wareHouseDAO.changeQuantity(productId, quantity);
            } else {
                wareHouseDAO.addQuantity(productId, quantity);
            }
        }
        request.setAttribute("success", "Thay đổi thành công");
        request.getRequestDispatcher("quanlysanpham.jsp").forward(request, response);
    }
}
