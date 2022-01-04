package vn.edu.hcmuaf.fit.lab5.controller;

import vn.edu.hcmuaf.fit.lab5.beans.Product;
import vn.edu.hcmuaf.fit.lab5.dao.ProductDAO;
import vn.edu.hcmuaf.fit.lab5.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductListController", value = "/ProductList")
public class ProductListController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    request.setAttribute("product", ProductService.getInstance().getAll());
        String txt = request.getParameter("index");
        int index = 0;
        if(txt == null){
            index = 1;
        }else{
            index = Integer.parseInt(txt);
        }
        ProductDAO dao = new ProductDAO();
        List<Product> list = dao.getTop(index);
        request.setAttribute("product", list);
        request.getRequestDispatcher("tranglaptop.jsp").forward(request,response);;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request,response);
    }
}
