package vn.edu.hcmuaf.fit.lab5.controller.cart;

import vn.edu.hcmuaf.fit.lab5.beans.Cart;
import vn.edu.hcmuaf.fit.lab5.beans.Product;
import vn.edu.hcmuaf.fit.lab5.dao.ProductDAO;
import vn.edu.hcmuaf.fit.lab5.service.ProductService;

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
        ProductDAO dao = new ProductDAO();
        Product product = dao.getLaptopByID(id);
       if(product!=null){
           HttpSession session = request.getSession();
           Cart cart = (Cart) session.getAttribute("cart");
           if(cart==null){
               cart = Cart.getInstance();
           }
           cart.put(product);
           session.setAttribute("cart",cart);
       }
       response.sendRedirect("/lab5_war_exploded/cart");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
