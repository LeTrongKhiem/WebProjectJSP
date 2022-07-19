package com.example.webproject.controller.cart;

import com.example.webproject.BEAN.Cart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import com.example.webproject.BEAN.Product;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import com.google.api.client.json.Json;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@WebServlet(name = "ShowController", value = "/cart")
public class ShowController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
//        Cart cart = (Cart) session.getAttribute("cart");
        String sessionCart = (String) session.getAttribute("cart");
//        List<Cart> cart = session.getAttribute("cart");
//        if (cart == null) {
//            cart = Cart.getInstance();
//
//        }
//        session.setAttribute("cart", cart);
        Cart cart = null;
        if (sessionCart != null) {
            Gson gson = new Gson();
            cart = gson.fromJson(sessionCart, Cart.class);
        }
//        gson.toJson(sessionCart);
        request.setAttribute("cart", cart);
        PrintWriter out = response.getWriter();
        for (Product p : cart.getProductList()) {
            out.println(
                    "<tr class=\"table-body\">"
                            +"<td>"
                            +"<figure><img src=\""+p.getLink_hinhanh()+"\" style=\"width:160px\"/></figure>"
                            +"</td>"
                            +"<td>"
                            +"<div class=\"cart-wrappper text-left th_description\">"
                            +"<h6>"+p.getTenSP()+"</h6>"
                            +"<p><span>Availability</span>: Available in Stock</p>"
                            +"<p><span>Product Code</span>: CwT4a</p>"
                            +"</div>"
                            +"</td>"
                            +"<td>&nbs\"p;</td>"
                            +"<td>&nbs\"p;</td>"
                            +"<td>"
                            +"<form class=\"quantity-control\""
                            +"action=\"<%=request.getContextPath()+\"/updateQuantity\"%>\" method=\"post\">"
                            +"<span data-id=\"asc_${product.maSP}\" class=\"btn-cart btn-square btn-plus btn-qty btn-asc\"><i"
                            +"class=\"fa fa-plus\"></i></span>"
                            +"<input type=\"text\" disabled value=\"${product.quantitySold}\" data-min=\"0\""
                            +"data-minalert=\"Số lượng không được nhỏ hơn 0\""
                            +"data-invalid=\"Nhập số lượng hợp lệ\""
                            +"name=\"quantity\" id=\"txt_quantity_${product.maSP}\">"
                            + "<input value=\""+p.getMaSP()+"\" type=\"hidden\" name=\"id\" data-min=\"0\">"
                            + "<span data-id=\"desc_${product.maSP}\" class=\"btn-cart btn-square btn-minus btn-qty btn-desc\"><i"
                            + "class=\"fa fa-minus\"></i></span>"
                            + "</form>"
                            + "</td>"
                            + "<td><span class=\"cart-price\">"+p.dinhDang(p.getGiaSP())+"</span></td>"
                            + "<td>"
                            + "<ul class=\"cart-action\">"
                            + "<li><a href=\"remove?id=${product.maSP}\" class=\"btn-cart btn-delete btn-blue\"><i"
                            + "class=\"fa fa-trash\"></i></a></li>"
                            + "</ul>"
                            + "</td>"
                            + "</tr>"
            );
        }
//        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
