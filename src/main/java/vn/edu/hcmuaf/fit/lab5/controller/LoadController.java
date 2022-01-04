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

@WebServlet(name = "LoadController", value = "/load")
public class LoadController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String amount = request.getParameter("exists");
        int iamount = Integer.parseInt(amount);
        ProductDAO dao = new ProductDAO();
        List<Product> list = null;
//        list = dao.getNext3(iamount);
        PrintWriter out = response.getWriter();
        for (Product i : list) {
            out.println("<div class=\"product-laptop col l-2-4 l-3-m m-4 c-6\">\n" +
                    "                                    <div class=\"container-product__item\">\n" +
                    "                                        <div class=\"container-product__item-heading\">\n" +
                    "                                            <div class=\"container-product__item-img\" style=\"background-image: url(" + i.getLink_hinhanh() + ")\"></div>\n" +
                    "\n" +
                    "                                            <div class=\"container-product-guarantee\">\n" +
                    "                                                <a href=\"\" class=\"container-product__item-link\">\n" +
                    "                                                    <div class=\"container-product-guarantee__heading\">\n" +
                    "                                                        <img src=\"https://mobilecity.vn/public/assets/img/icon-mobilecity-care.png\" alt=\"Guarantee\" class=\"container-product-guarantee__heading-img\">\n" +
                    "                                                        <h3 class=\"container-product-guarantee__heading-text\">MobileCity Care</h3>\n" +
                    "                                                    </div>\n" +
                    "\n" +
                    "                                                    <ul class=\"container-product-guarantee__list\">\n" +
                    "                                                        <li class=\"container-product-guarantee__item\">BH 12 tháng nguồn, màn hình</li>\n" +
                    "                                                        <li class=\"container-product-guarantee__item\">Đổi mới 30 ngày đầu tiên</li>\n" +
                    "                                                        <li class=\"container-product-guarantee__item\">Tặng ốp lưng, dán cường lực</li>\n" +
                    "                                                        <li class=\"container-product-guarantee__item\">Hỗ trợ phần mềm trọn đời máy</li>\n" +
                    "                                                    </ul>\n" +
                    "                                                </a>\n" +
                    "                                                <a href=\"\" class=\"container-product-guarantee__btn\">Bảo hành vàng</a>\n" +
                    "                                            </div>\n" +
                    "                                        </div>\n" +
                    "                                        <div class=\"container-product__item-wrap\">\n" +
                    "                                            <div class=\"container-product__item-info\">\n" +
                    "                                                <a href=\"#\" class=\"container-product__item-name\">\n" +
                    "                                                        "+i.getTenSP()+"\n" +
                    "                                                </a>\n" +
                    "                                                <i class=\"container-product__item-sale-icon fas fa-gift\"></i>\n" +
                    "                                            </div>\n" +
                    "                                            <div class=\"container-product__item-buy\">\n" +
                    "                                <span class=\"container-product__item-price\">\n" +
                    "                                        "+i.getGiaSP()+"\n" +
                    "                                </span>\n" +
                    "                                                <a href=\"cart-add?id="+i.getMaSP()+"\" class=\"container-product__item-btn\">MUA</a>\n" +
                    "                                            </div>\n" +
                    "                                        </div>\n" +
                    "                                        <ul class=\"container-product__item-gifts-list\">\n" +
                    "                                            <li class=\"container-product__item-gift\">\n" +
                    "                                                <span class=\"container-product__item-span\">KM</span>\n" +
                    "                                                Tặng Phiếu mua hàng 1.500.000đ\n" +
                    "                                            </li>\n" +
                    "\n" +
                    "                                        </ul>\n" +
                    "                                        <ul class=\"container-product-marker__list\">\n" +
                    "                                            <li class=\"container-product-marker__item container-product-marker__item--new\">Mới</li>\n" +
                    "                                            <li class=\"container-product-marker__item container-product-marker__item--hot\">Hot</li>\n" +
                    "                                        </ul>\n" +
                    "                                    </div>\n" +
                    "                                </div>");
        }
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
