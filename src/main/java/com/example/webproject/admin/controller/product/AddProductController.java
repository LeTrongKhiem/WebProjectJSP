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
import java.util.Iterator;
import java.util.List;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10 * 2, // 10MB
        maxRequestSize = 1024 * 1024 * 50 * 2)

@WebServlet(name = "AddProductController", value = "/admin/add")
public class AddProductController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("pid");
        String name = request.getParameter("pName");
        String hdh = request.getParameter("pHDH");
        String ram = request.getParameter("pRAM");
        String cpu= request.getParameter("pCPU");
        String thietKe = request.getParameter("pThietKe");
        String manHinh = request.getParameter("pManHinh");
        Part filePart = request.getPart("image");
        String fileName = extractFileName(filePart);
        String savePath = "D:\\LapTrinhWeb\\JSPDemo\\WebProject\\src\\main\\webapp\\assets\\img\\dssp\\" + File.separator + fileName;
        File fileSaveDir = new File(savePath);
        filePart.write(savePath);
        String insertPath = "./assets/img/dssp/" + fileName;
        String maDanhMuc = request.getParameter("category");
        int price = Integer.parseInt(request.getParameter("pPrice"));
        String loaiSP = request.getParameter("loaiSP");
        ProductListDAOImpl dao = new ProductListDAOImpl();
        dao.insertProduct(id, name, insertPath, price, loaiSP, maDanhMuc);
        dao.insertDetailProduct(id,hdh,ram,manHinh,cpu,thietKe);
        response.sendRedirect("product");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("quanlysanpham.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
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

    private static String getSubmittedFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1); // MSIE fix.
            }
        }
        return null;
    }
}
