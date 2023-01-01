package com.example.webproject.controller;

import javax.activation.MimetypesFileTypeMap;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;

@WebServlet(name = "DownLoadFile", value = "/DownLoadFile")
public class DownLoadFile extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filePath = "D:\\LapTrinhWeb\\JSPDemo\\WebProject\\src\\main\\webapp\\common\\privatekey.txt";
        String fileName = "privatekey.txt";
        String privateKeyE = request.getParameter("key1");
        try
        {
            FileWriter fw = new FileWriter(filePath); //the true will append the new data
            fw.write(privateKeyE);//appends the string to the file
            fw.close();
        }
        catch(IOException ioe)
        {
            System.err.println("IOException: " + ioe.getMessage());
        }
        response.setContentType("APPLICATION/OCTET-STREAM");
        response.setHeader("Content-Disposition", "attachment; fileName=\"" + fileName + "\"");

        OutputStream out = response.getOutputStream();
        FileInputStream in = new FileInputStream(filePath);

        byte[] buffer = new byte[4096];
        int length;
        while ((length = in.read(buffer)) > 0) {
            out.write(buffer, 0, length);
        }
        in.close();
        out.flush();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
