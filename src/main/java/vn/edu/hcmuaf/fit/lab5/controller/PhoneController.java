package vn.edu.hcmuaf.fit.lab5.controller;

import vn.edu.hcmuaf.fit.lab5.beans.Product;
import vn.edu.hcmuaf.fit.lab5.dao.ProductDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "PhoneController", value = "/PhoneController")
public class PhoneController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String txt = request.getParameter("index");
//        int index = 0;
//        if(txt == null){
//            index = 1;
//        }else{
//            index = Integer.parseInt(txt);
//        }
        ProductDAO dao = new ProductDAO();
//        List<Product> list = dao.getTop(index);
//        List<Product> lists = dao.getAllByLaptop();
        request.setAttribute("product", dao.getAllByLaptop());
        request.getRequestDispatcher("tranglaptop.jsp").forward(request,response);;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
