package com.example.webproject.admin.controller.product;

import com.example.webproject.DAO.daoimpl.ProductListDAOImpl;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Base64;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10 * 2, // 10MB
        maxRequestSize = 1024 * 1024 * 50 * 2)
@WebServlet(name = "EditProduct", value = "/admin/edit")
public class EditProduct extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
        response.getWriter().append("Served at: ").append(request.getContextPath());

        request.getRequestDispatcher("/admin/editProduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(1024 * 1024 * 2);
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setSizeMax(1024 * 1024 * 10);
        String id =  request.getParameter("Eid");
        String name = request.getParameter("EName");
        String hdh = request.getParameter("EHeDieuHanh");
        String ram = request.getParameter("ERAM");
        String cpu= request.getParameter("ECPU");
        String thietKe = request.getParameter("EThietKe");
        String manHinh = request.getParameter("EManHinh");
//        String image = request.getParameter("Eimage");
        Part filePart = request.getPart("Eimage");
        String fileName = extractFileName(filePart);

        String appPath = request.getServletContext().getRealPath("\\assets\\img\\dssp\\");
        String savePath = appPath +File.separator+ fileName;
        File fileSaveDir = new File(savePath);
        if(filePart.getSize() > 0){
            filePart.write(savePath + File.separator);
        }else {
            fileName = request.getParameter("Eimage1").substring(request.getParameter("Eimage1").lastIndexOf("/") + 1);
        }


        String insertPath = "./assets/img/dssp/" + fileName;
        String maDanhMuc = request.getParameter("Ecategory");
        int price = Integer.parseInt(request.getParameter("EPrice"));
        String loaiSP = request.getParameter("EloaiSP");
        ProductListDAOImpl dao = new ProductListDAOImpl();
        dao.editProduct(id,name,insertPath,price,loaiSP,maDanhMuc);
        dao.editProductDetail(id,hdh,ram,manHinh,cpu,thietKe);
        response.sendRedirect("product");

    }
    private String extractFileName(Part part) {//This method will print the file name.
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    public static void main(String[] args) {

    }

}
