package com.example.webproject.admin.controller.banner;

import com.example.webproject.DAO.daoimpl.BannerDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10 * 2, // 10MB
        maxRequestSize = 1024 * 1024 * 50 * 2)
@WebServlet(name = "AddBannerController", value = "/admin/addbanner")
public class AddBannerController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("quanlybanner.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part image = request.getPart("imageBanner");
        String fileName = extractFileName(image);
        String savePath = "c:\\Users\\tangm\\IdeaProjects\\WebProjectJSP2\\src\\main\\webapp\\assets\\banner\\" + File.separator + fileName;
        File fileSaveDir = new File(savePath);
        image.write(savePath);
        String insertPath = "./assets/banner/" + fileName;
        String link_video1=request.getParameter("lvd");
        String link_banner_content=request.getParameter("ldc");
        String bannerID=request.getParameter("bid");
        BannerDAOImpl dao = new BannerDAOImpl();
        dao.createBanner(bannerID,insertPath,link_video1,link_banner_content);
        response.sendRedirect("banner");
    }
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
