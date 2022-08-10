package com.example.webproject.admin.controller.product;

import com.example.webproject.DAO.daoimpl.ProductListDAOImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;

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
        request.getRequestDispatcher("EditProduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
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
        String savePath = "D:\\JavaServlet\\CK_LTW\\WebProjectJSP\\src\\main\\webapp\\assets\\img\\dssp\\" + File.separator + fileName;
        File fileSaveDir = new File(savePath);
        if(!fileSaveDir.exists()){
            fileSaveDir.mkdir();
        }
        if(filePart.getSize() > 0){
            filePart.write(savePath);
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
        byte[] bytes  = new byte[1024];
        OutputStream os = response.getOutputStream();

        os.write(bytes);
        os.flush();
        os.close();
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
