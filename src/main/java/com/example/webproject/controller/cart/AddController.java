package com.example.webproject.controller.cart;

import com.example.webproject.BEAN.Cart;
import com.example.webproject.BEAN.Product;
import com.example.webproject.BEAN.User;
import com.example.webproject.DAO.daoimpl.OrderDAO;
import com.example.webproject.DAO.daoimpl.ProductListDAOImpl;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddController", value = "/cart-add")
public class AddController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
//       Product product = ProductService.getInstance().getById(id);
        ProductListDAOImpl dao = new ProductListDAOImpl();
        HttpSession session = request.getSession();
        HttpSession sessionUser = request.getSession();
        Product product = dao.getProductByID(id);
        Cart cart = (Cart) session.getAttribute("cart");
        User user = (User) sessionUser.getAttribute("user");
        OrderDAO dao1 = new OrderDAO();
        if (product != null) {
            if (cart == null) {
                cart = Cart.getInstance();
            }
            cart.put(product);
            ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
            String json = ow.writeValueAsString(cart);
            session.setAttribute("cart", json);
        }

        response.sendRedirect(request.getContextPath() + "/cart");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
