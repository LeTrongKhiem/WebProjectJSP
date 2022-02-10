package com.example.webproject.controller;

import com.example.webproject.BEAN.Category;
import com.example.webproject.BEAN.Product;
import com.example.webproject.BEAN.ProductList;
import com.example.webproject.DAO.daoimpl.CategoryDAOImpl;
import com.example.webproject.DAO.daoimpl.ProductListDAOImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SearchController", value = "/search")
public class SearchController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setCharacterEncoding("UTF-8");
        String txtSearch = request.getParameter("txt");
        int index = Integer.parseInt(request.getParameter("index"));
        ProductListDAOImpl dao = new ProductListDAOImpl();
        ArrayList<Category> listCategory = CategoryDAOImpl.getInstance().getListCategoryPhone();
        int count = dao.count(txtSearch);
        int size = 10;
        int endPage = count / size;
        int size2 = count % size;
        if (count % size != 0 && size2 != 0) {
            endPage++;
        }
        List<Product> list = dao.search(txtSearch, index);
        request.setAttribute("endP", endPage);
        request.setAttribute("product", list);
        request.setAttribute("txts", txtSearch);
        request.setAttribute("listCategory", listCategory);
        request.getRequestDispatcher("trangdienthoai.jsp").forward(request, response);

    }
}
