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
import java.io.PrintWriter;
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
        request.setCharacterEncoding("UTF-8");
        String txtSearch = request.getParameter("txt");
        int index = Integer.parseInt(request.getParameter("index"));
//        String amount = request.getParameter("exits");
//        int amountI = Integer.parseInt(amount);
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
//        List<Product> list = dao.searchProduct(txtSearch, 11);
//        List<Product> list1 = dao.searchProduct(txtSearch, amountI);
        request.setAttribute("endP", endPage);
        request.setAttribute("product", list);
        request.setAttribute("txts", txtSearch);
        request.setAttribute("listCategory", listCategory);
        request.getRequestDispatcher("trangdienthoai.jsp").forward(request, response);
//        PrintWriter out = response.getWriter();
//
//        for (Product p : list1) {
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
//                    "                                            <a href=\"DetailController?id=" + p.getMaSP() + "\"\n" +
//                    "                                               class=\"container-product__item-name\">\n" +
//                    "                                                    " + p.getTenSP() + "\n" +
//                    "                                            </a>\n" +
//                    "                                            <i class=\"container-product__item-sale-icon fas fa-gift\"></i>\n" +
//                    "                                        </div>\n" +
//                    "                                        <div class=\"container-product__item-buy\">\n" +
//                    "                                <span class=\"container-product__item-price\">\n" +
//                    "                                      " + p.dinhDang(p.getGiaSP()) + "\n" +
//                    "                                </span>\n" +
//                    "                                            <a href=\"cart-add?id=" + p.getMaSP() + "\"\n" +
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
}
