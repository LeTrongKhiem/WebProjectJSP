package com.example.webproject.controller;

import com.example.webproject.BEAN.Category;
import com.example.webproject.BEAN.ProductList;
import com.example.webproject.DAO.daoimpl.FilterProduct;
import com.example.webproject.DAO.daoimpl.FilterProductIpml;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "FilterController", value = "/FilterController")
public class FilterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FilterProduct loc = new FilterProduct();
        ServletContext context = getServletContext();
        FilterProduct.listLoc = new ArrayList<>();
        String chon = request.getParameter("chon");
        String chongia = request.getParameter("chongia");
        String chongia1 = request.getParameter("chongia1");
        String locgia = request.getParameter("locgia");
        String hdh = request.getParameter("hdh");
        if (chon != null) {
            loc.selectBrand(chon);
            chon = null;
        } else if (chongia != null && chongia1 != null) {
            loc.selectPrice(chongia, chongia1);
            chongia = null;
            chongia1 = null;
        }
        if (hdh != null) {
            loc.selectOperating(hdh);
        } else if (locgia != null) {
            loc.sortByPrice(locgia);
            locgia = null;
        }
        if (loc.listLoc.size() > 0) {
            request.getSession().setAttribute("list", loc.listLoc);
            response.sendRedirect("filterproduct.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FilterProduct sp = new FilterProduct();
        String xuLyLoc = request.getParameter("xuly");
        if (xuLyLoc.equals("xulyloc1")) {
            String tendt = request.getParameter("tendt");
            String giadt = request.getParameter("giadt");
            String camera = request.getParameter("camera");
            String selfie = request.getParameter("selfie");
            String bonhotrong = request.getParameter("bonhotrong");
            String loaisp = request.getParameter("loaisp");
            int gia1 = 0;
            int gia2 = 0;
            sp.selectBrand(tendt);
            if (giadt != null) {
                if (giadt.equals("1den3")) {
                    gia1 = 1000000;
                    gia2 = 3000000;
                } else if (giadt.equals("3den8")) {
                    gia1 = 3000000;
                    gia2 = 8000000;
                } else if (giadt.equals("8den10")) {
                    gia1 = 8000000;
                    gia2 = 10000000;
                } else if (giadt.equals("10den20")) {
                    gia1 = 10000000;
                    gia2 = 20000000;
                } else if (giadt.equals("20den40")) {
                    gia1 = 20000000;
                    gia2 = 40000000;
                }
                sp.selectPrice(gia1, gia2);
            }
            if (camera != null) {
                sp.selectCamera(Integer.parseInt(camera));
            }
            if (selfie != null) {
                sp.selectSelfie(Integer.parseInt(selfie));
            }
            if (bonhotrong != null) {
                sp.selectROM(Integer.parseInt(bonhotrong));
            }
            if (loaisp != null) {
                sp.selectTypeProduct(loaisp);
            }
            response.setContentType("text/html");
            if (sp.listLoc.size() > 0) {
                request.getSession().setAttribute("list", sp.listLoc);
                response.sendRedirect("filterproduct.jsp");
            } else {
                response.sendRedirect("page404.jsp");
            }
        } else if (xuLyLoc.equals("xulyloc2")) {
            request.setCharacterEncoding("utf-8");
            response.setCharacterEncoding("utf-8");
            sp.listLoc = new ArrayList<>();
            String camerasau = request.getParameter("cmrs");
            String cameratruoc = request.getParameter("cmrt");
            String dungLuongPin = request.getParameter("dungluongpin");
            String boNhoTrong = request.getParameter("bnt");
            if (camerasau == null || camerasau.equals("")) {
                camerasau = "";
            }
            if (cameratruoc == null || cameratruoc.equals("")) {
                cameratruoc = "";
            }
            if (dungLuongPin == null || dungLuongPin.equals("")) {
                dungLuongPin = "";
            }
            if (boNhoTrong == null || boNhoTrong.equals("")) {
                boNhoTrong = "";
            }
            String str = "camerasau" + camerasau + " and  cameratruoc" + cameratruoc + " and Dungluongpin" + dungLuongPin
                    + " and Bonhotrong" + boNhoTrong;
            if (sp.listLoc.size() == 0) {
                response.sendRedirect("sanphamloi.jsp");
            } else {
                request.getSession().setAttribute("list", sp.listLoc);
                response.sendRedirect("filterproduct.jsp");
            }
        }
    }
}
