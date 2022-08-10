package com.example.webproject.admin.controller.order;

import com.example.webproject.BEAN.OrderDetail;
import com.example.webproject.admin.dao.impl.WareHouseDAOImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ShowOrderDetail", value = "/admin/orderdetail")
public class ShowOrderDetail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        WareHouseDAOImpl wDao = new WareHouseDAOImpl();
        List<OrderDetail> listOrderDetail = wDao.getWarehouseByOrderId(id);
        double result = 0;
        for (OrderDetail re : listOrderDetail) {
            result += re.getPrice();
        }
        OrderDetail odd = new OrderDetail();
        String re = odd.dinhDang(result);
        request.setAttribute("od", listOrderDetail);
        request.setAttribute("re", re);
        request.getRequestDispatcher("OrderDetail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
