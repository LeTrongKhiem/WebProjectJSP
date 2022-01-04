package vn.edu.hcmuaf.fit.lab5.controller;

import vn.edu.hcmuaf.fit.lab5.beans.Product;
import vn.edu.hcmuaf.fit.lab5.dao.ProductDAO;
import vn.edu.hcmuaf.fit.lab5.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "DetailController", value = "/detail")
public class DetailController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("id");
        ProductDAO dao = new ProductDAO();
//        Product p = ProductService.getInstance().getById(id);
        Product p =  dao.getById(id);
        request.setAttribute("detail",p);
        request.getRequestDispatcher("trangitem.jsp").forward(request,response);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request,response);
    }
}
