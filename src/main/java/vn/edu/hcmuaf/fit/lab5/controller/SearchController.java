package vn.edu.hcmuaf.fit.lab5.controller;

import vn.edu.hcmuaf.fit.lab5.beans.Product;
import vn.edu.hcmuaf.fit.lab5.dao.ProductDAO;
import vn.edu.hcmuaf.fit.lab5.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchController", value = "/search")
public class SearchController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String txtSearch =  request.getParameter("txt");
        int index = Integer.parseInt(request.getParameter("index"));
        ProductDAO dao =  new ProductDAO();
        int count = dao.count(txtSearch);
        int size = 10;
        int endPage = count/size;
        int size2 = count%size;
        if(count%size!=0 && size2!=0){
            endPage++;
        }
        List<Product> list = dao.search(txtSearch,index);
        request.setAttribute("endP",endPage);
        request.setAttribute("product",list);
        request.setAttribute("txts",txtSearch);
        request.getRequestDispatcher("tranglaptop.jsp").forward(request,response);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request,response);
    }
    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
        
        System.out.println(dao.count("mac"));
    }
}
