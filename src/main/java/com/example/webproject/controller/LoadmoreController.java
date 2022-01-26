package com.example.webproject.controller;

import com.example.webproject.BEAN.ProductList;
import com.example.webproject.DAO.daoimpl.ProductDAOImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "LoadmoreController", value = "/LoadmoreController")

public class LoadmoreController extends HttpServlet {
    public boolean checkMadanhmuc(String[] arr, String madanhmuc) {
        for (String i : arr) {
            if (i.equals(madanhmuc)) {
                return true;
            }
        }
        return false;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String amount = request.getParameter("exits");
        int amountI = Integer.parseInt(amount);
        String madanhmuc = request.getParameter("madanhmuc");
        String[] madanhmucTrue = new String[]{"100002", "100003", "100004", "100005", "100006", "100007", "100008", "100009", "1000010", "100011", "100012", "100013", "100014", "100015", "100016", "100017", "100018", "100019", "100020", "100021"};
        List<ProductList> list = null;
        if (madanhmuc.equals("100001")) {
            list = new ProductDAOImpl().getNextProduct(amountI, "DT");
        } else if (madanhmuc.equals("200001")) {
            list = new ProductDAOImpl().getNextProduct(amountI, "LT");
        } else if (madanhmuc.equals("300001")) {
            list = new ProductDAOImpl().getNextProduct(amountI, "phukien");
        } else {
            list = new ProductDAOImpl().getNextProductChild(amountI, madanhmuc);
        }
        PrintWriter out = response.getWriter();

        for (ProductList p : list) {
            out.println("<div class=\"productCount col l-2-4 l-3-m m-4 c-6\">\n" +
                    "                                <div class=\"container-product__item\">\n" +
                    "                                    <div class=\"container-product__item-heading\">\n" +
                    "                                        <div class=\"container-product__item-img\"\n" +
                    "                                             style=\"background-image: url('" + p.getLink_hinhanh() + "');\"></div>\n" +
                    "                                        <div class=\"container-product-guarantee\">\n" +
                    "                                            <a href=\"trangitem.jsp\" class=\"container-product__item-link\">\n" +
                    "                                                <div class=\"container-product-guarantee__heading\">\n" +
                    "                                                    <img src=\"https://mobilecity.vn/public/assets/img/icon-mobilecity-care.png\"\n" +
                    "                                                         alt=\"Guarantee\"\n" +
                    "                                                         class=\"container-product-guarantee__heading-img\">\n" +
                    "                                                    <h3 class=\"container-product-guarantee__heading-text\">TGMobile\n" +
                    "                                                        Care</h3>\n" +
                    "                                                </div>\n" +
                    "\n" +
                    "                                                <ul class=\"container-product-guarantee__list\">\n" +
                    "                                                    <li class=\"container-product-guarantee__item\">BH 12 tháng nguồn,\n" +
                    "                                                        màn hình\n" +
                    "                                                    </li>\n" +
                    "                                                    <li class=\"container-product-guarantee__item\">Đổi mới 30 ngày\n" +
                    "                                                        đầu tiên\n" +
                    "                                                    </li>\n" +
                    "                                                    <li class=\"container-product-guarantee__item\">Tặng ốp lưng, dán\n" +
                    "                                                        cường lực\n" +
                    "                                                    </li>\n" +
                    "                                                    <li class=\"container-product-guarantee__item\">Hỗ trợ phần mềm\n" +
                    "                                                        trọn đời máy\n" +
                    "                                                    </li>\n" +
                    "                                                </ul>\n" +
                    "                                            </a>\n" +
                    "                                            <a href=\"\" class=\"container-product-guarantee__btn\">Bảo hành vàng</a>\n" +
                    "                                        </div>\n" +
                    "                                    </div>\n" +
                    "                                    <div class=\"container-product__item-wrap\">\n" +
                    "                                        <div class=\"container-product__item-info\">\n" +
                    "                                            <a href=\"DetailController?id=" + p.getId() + "\"\n" +
                    "                                               class=\"container-product__item-name\">\n" +
                    "                                                    " + p.getTen() + "\n" +
                    "                                            </a>\n" +
                    "                                            <i class=\"container-product__item-sale-icon fas fa-gift\"></i>\n" +
                    "                                        </div>\n" +
                    "                                        <div class=\"container-product__item-buy\">\n" +
                    "                                <span class=\"container-product__item-price\">\n" +
                    "                                      " + p.dinhDang(p.getGia()) + "\n" +
                    "                                </span>\n" +
                    "                                            <a href=\"cart-add?id=" + p.getId() + "\"\n" +
                    "                                               class=\"container-product__item-btn\">MUA</a>\n" +
                    "                                        </div>\n" +
                    "                                    </div>\n" +
                    "                                    <ul class=\"container-product__item-gifts-list\">\n" +
                    "                                        <li class=\"container-product__item-gift\">\n" +
                    "                                            1. Tặng:\n" +
                    "                                            <span class=\"container-product__item-gift--highlight\">\n" +
                    "                                    Cường lực - Ốp lưng - Tai nghe\n" +
                    "                                </span>\n" +
                    "                                            khi mua BHV\n" +
                    "                                        </li>\n" +
                    "                                        <li class=\"container-product__item-gift\">\n" +
                    "                                            2. Giảm:\n" +
                    "                                            <span class=\"container-product__item-gift--highlight\">\n" +
                    "                                    100K\n" +
                    "                                </span>\n" +
                    "                                            áp dụng HSSV mua BHV tại\n" +
                    "                                            <span class=\"container-product__item-gift--highlight\">\n" +
                    "                                    Thủ Đức\n" +
                    "                                </span>\n" +
                    "                                        </li>\n" +
                    "                                    </ul>\n" +
                    "                                    <ul class=\"container-product-marker__list\">\n" +
                    "                                        <li class=\"container-product-marker__item container-product-marker__item--new\">\n" +
                    "                                            Mới\n" +
                    "                                        </li>\n" +
                    "                                        <li class=\"container-product-marker__item container-product-marker__item--hot\">\n" +
                    "                                            Hot\n" +
                    "                                        </li>\n" +
                    "                                    </ul>\n" +
                    "                                </div>\n" +
                    "                            </div>");
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
