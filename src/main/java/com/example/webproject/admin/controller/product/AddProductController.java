package com.example.webproject.admin.controller.product;

import com.example.webproject.DAO.daoimpl.ProductListDAOImpl;
import com.google.api.client.http.MultipartContent;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Base64;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10 * 2, // 10MB
        maxRequestSize = 1024 * 1024 * 50 * 2)

@WebServlet(name = "AddProductController", value = "/admin/add")
public class AddProductController extends HttpServlet {
    private ServletFileUpload uploader;


//    public void init() throws ServletException {
//        DiskFileItemFactory factory = new DiskFileItemFactory();
//        File fileDir = (File) getServletContext().getAttribute("FILES_DIR_FILE");
//        factory.setRepository(fileDir);
//        this.uploader = new ServletFileUpload(factory);
//    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
        response.getWriter().append("Served at: ").append(request.getContextPath());

        request.getRequestDispatcher("/admin/quanlysanpham.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        System.getProperty("java.io.tmpdir");
        String id = request.getParameter("pid");
        String name = request.getParameter("pName");
        String hdh = request.getParameter("pHDH");
        String ram = request.getParameter("pRAM");
        String cpu = request.getParameter("pCPU");
        String thietKe = request.getParameter("pThietKe");
        String manHinh = request.getParameter("pManHinh");
        Part filePart = request.getPart("image");
        String fileName = extractFileName(filePart);

        Random random = ThreadLocalRandom.current();
        byte[] r = new byte[8]; //Means 2048 bit
        random.nextBytes(r);
        String s = Base64.getEncoder().encodeToString(r);
        String fileNameWithoutExt = fileName.substring(0, fileName.lastIndexOf("."));
        String fileExt = fileName.substring(fileName.lastIndexOf("."));
        fileName = fileNameWithoutExt + s + fileExt;
        String appPath = request.getServletContext().getRealPath("\\assets\\img\\dssp\\");
        String savePath = appPath +File.separator+ fileName;
        System.out.println(savePath);
        File fileSaveDir = new File(savePath);
        filePart.write(savePath + File.separator);
        String insertPath = "./assets/img/dssp/" + fileName;
        String maDanhMuc = request.getParameter("category");
        int price = Integer.parseInt(request.getParameter("pPrice"));
        String loaiSP = request.getParameter("loaiSP");
        ProductListDAOImpl dao = new ProductListDAOImpl();
        dao.insertProduct(id, name, insertPath, price, loaiSP, maDanhMuc);
        dao.insertDetailProduct(id, hdh, ram, manHinh, cpu, thietKe);
        request.getRequestDispatcher("product").forward(request, response);

        ;
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
