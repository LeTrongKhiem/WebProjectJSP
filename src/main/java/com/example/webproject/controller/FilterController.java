package com.example.webproject.controller;

import com.example.webproject.BEAN.Category;
import com.example.webproject.BEAN.ProductList;
import com.example.webproject.DAO.FilterProduct;
import com.example.webproject.DAO.daoimpl.FilterProductIpml;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "FilterController", value = "/FilterController")
public class FilterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String amount = request.getParameter("exits");
//        int amountI = Integer.parseInt(amount);
        String locgia = request.getParameter("locgia");
        String chongia = request.getParameter("chongia");
        FilterProductIpml filterProduct = new FilterProductIpml();
        List<ProductList> list = null;
        String madanhmuc = request.getParameter("madanhmuc");
//        String amount = request.getParameter("exits");
//        int amountI = Integer.parseInt(amount);
//        filterProduct.sortByPrice(locgia);
//        if (filterProduct.listProduct.size() > 0) {
//            request.getSession().setAttribute("list", filterProduct.listProduct);
////            request.setAttribute("list", filterProduct.listProduct);
//            response.sendRedirect("filterproduct.jsp");
//        }
        if (locgia.equals("caodenthap")) {
            list = filterProduct.sortByPrice("desc", madanhmuc, "");
            request.getSession().setAttribute("list", list);
            request.setAttribute("list", list);
//            response.sendRedirect("filterproduct.jsp");
            request.getRequestDispatcher("filterproduct.jsp").forward(request, response);
        }
        if (locgia.equals("thapdencao")) {
            list = filterProduct.sortByPrice("asc", madanhmuc, "");
            request.setAttribute("list", list);
            request.getSession().setAttribute("list", list);
            request.getRequestDispatcher("filterproduct.jsp").forward(request, response);
//            response.sendRedirect("filterproduct.jsp");
        }
        if (chongia != null) {
            filterProduct.selectByPrice(Integer.parseInt(chongia));
            request.getSession().setAttribute("list1", filterProduct.listFilter);
            request.getRequestDispatcher("filterproduct.jsp").forward(request, response);
        }
        PrintWriter out = response.getWriter();

//        for (ProductList p : list) {
//            out.println("<div class=\"productCount col l-2-4 l-3-m m-4 c-6\">\n" +
//                    "                                <div class=\"container-product__item\">\n" +
//                    "                                    <div class=\"container-product__item-heading\">\n" +
//                    "                                        <div class=\"container-product__item-img\"\n" +
//                    "                                             style=\"background-image: url('" + p.getLink_hinhanh() + "');\"></div>\n" +
//                    "                                        <div class=\"container-product-guarantee\">\n" +
//                    "                                            <a href=\"trangitem.jsp\" class=\"container-product__item-link\">\n" +
//                    "                                                <div class=\"container-product-guarantee__heading\">\n" +
//                    "                                                    <img src=\"https://mobilecity.vn/public/assets/img/icon-mobilecity-care.png\"\n" +
//                    "                                                         alt=\"Guarantee\"\n" +
//                    "                                                         class=\"container-product-guarantee__heading-img\">\n" +
//                    "                                                    <h3 class=\"container-product-guarantee__heading-text\">TGMobile\n" +
//                    "                                                        Care</h3>\n" +
//                    "                                                </div>\n" +
//                    "\n" +
//                    "                                                <ul class=\"container-product-guarantee__list\">\n" +
//                    "                                                    <li class=\"container-product-guarantee__item\">BH 12 tháng nguồn,\n" +
//                    "                                                        màn hình\n" +
//                    "                                                    </li>\n" +
//                    "                                                    <li class=\"container-product-guarantee__item\">Đổi mới 30 ngày\n" +
//                    "                                                        đầu tiên\n" +
//                    "                                                    </li>\n" +
//                    "                                                    <li class=\"container-product-guarantee__item\">Tặng ốp lưng, dán\n" +
//                    "                                                        cường lực\n" +
//                    "                                                    </li>\n" +
//                    "                                                    <li class=\"container-product-guarantee__item\">Hỗ trợ phần mềm\n" +
//                    "                                                        trọn đời máy\n" +
//                    "                                                    </li>\n" +
//                    "                                                </ul>\n" +
//                    "                                            </a>\n" +
//                    "                                            <a href=\"\" class=\"container-product-guarantee__btn\">Bảo hành vàng</a>\n" +
//                    "                                        </div>\n" +
//                    "                                    </div>\n" +
//                    "                                    <div class=\"container-product__item-wrap\">\n" +
//                    "                                        <div class=\"container-product__item-info\">\n" +
//                    "                                            <a href=\"DetailController?id=" + p.getId() + "\"\n" +
//                    "                                               class=\"container-product__item-name\">\n" +
//                    "                                                    " + p.getTen() + "\n" +
//                    "                                            </a>\n" +
//                    "                                            <i class=\"container-product__item-sale-icon fas fa-gift\"></i>\n" +
//                    "                                        </div>\n" +
//                    "                                        <div class=\"container-product__item-buy\">\n" +
//                    "                                <span class=\"container-product__item-price\">\n" +
//                    "                                      " + p.dinhDang(p.getGia()) + "\n" +
//                    "                                </span>\n" +
//                    "                                            <a href=\"cart-add?id=" + p.getId() + "\"\n" +
//                    "                                               class=\"container-product__item-btn\">MUA</a>\n" +
//                    "                                        </div>\n" +
//                    "                                    </div>\n" +
//                    "                                    <ul class=\"container-product__item-gifts-list\">\n" +
//                    "                                        <li class=\"container-product__item-gift\">\n" +
//                    "                                            1. Tặng:\n" +
//                    "                                            <span class=\"container-product__item-gift--highlight\">\n" +
//                    "                                    Cường lực - Ốp lưng - Tai nghe\n" +
//                    "                                </span>\n" +
//                    "                                            khi mua BHV\n" +
//                    "                                        </li>\n" +
//                    "                                        <li class=\"container-product__item-gift\">\n" +
//                    "                                            2. Giảm:\n" +
//                    "                                            <span class=\"container-product__item-gift--highlight\">\n" +
//                    "                                    100K\n" +
//                    "                                </span>\n" +
//                    "                                            áp dụng HSSV mua BHV tại\n" +
//                    "                                            <span class=\"container-product__item-gift--highlight\">\n" +
//                    "                                    Thủ Đức\n" +
//                    "                                </span>\n" +
//                    "                                        </li>\n" +
//                    "                                    </ul>\n" +
//                    "                                    <ul class=\"container-product-marker__list\">\n" +
//                    "                                        <li class=\"container-product-marker__item container-product-marker__item--new\">\n" +
//                    "                                            Mới\n" +
//                    "                                        </li>\n" +
//                    "                                        <li class=\"container-product-marker__item container-product-marker__item--hot\">\n" +
//                    "                                            Hot\n" +
//                    "                                        </li>\n" +
//                    "                                    </ul>\n" +
//                    "                                </div>\n" +
//                    "                            </div>");
//        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
