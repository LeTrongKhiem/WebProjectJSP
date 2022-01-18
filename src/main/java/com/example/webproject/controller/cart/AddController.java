package com.example.webproject.controller.cart;

import com.example.webproject.BEAN.Cart;
import com.example.webproject.BEAN.Product;
import com.example.webproject.DAO.daoimpl.ProductListDAOImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddController", value = "/cart-add")
public class AddController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id =  request.getParameter("id");
//       Product product = ProductService.getInstance().getById(id);
        ProductListDAOImpl dao = new ProductListDAOImpl();
        Product product = dao.getProductByID(id);
        if(product!=null){
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            if(cart==null){
                cart = Cart.getInstance();
            }
            cart.put(product);
            session.setAttribute("cart",cart);
        }
        response.sendRedirect(request.getContextPath()+"/cart");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
