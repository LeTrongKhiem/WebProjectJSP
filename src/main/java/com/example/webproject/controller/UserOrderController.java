package com.example.webproject.controller;

import com.example.webproject.BEAN.User;
import com.example.webproject.BEAN.UserOrder;
import com.example.webproject.DAO.daoimpl.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserOrderController", value = "/UserOrderController")
public class UserOrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        UserDAO dao = new UserDAO();
        List<UserOrder> list = dao.getOrder(user.getEmail());
        request.setAttribute("listUserOrder", list);
        request.getRequestDispatcher("UserOrder.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
