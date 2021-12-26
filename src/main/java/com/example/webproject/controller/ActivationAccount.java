package com.example.webproject.controller;

import com.example.webproject.DB.DBConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "ActivationAccount", value = "/ActivationAccount")
public class ActivationAccount extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("key1");
        String code = request.getParameter("key2");

        Connection connection = DBConnection.getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement("select Email, `Code`, Active from dangky where Email = ? and `Code` = ? and Active = '0'");
            statement.setString(1, email);
            statement.setString(2, code);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                PreparedStatement statement1 = connection.prepareStatement("update dangky set Active = '1' where Email = ? and `Code` = ?");
                statement1.setString(1, email);
                statement1.setString(2, code);
                int i = statement1.executeUpdate();
                if (i == 1) {
                    response.sendRedirect("dangnhap.jsp");
                } else {
                    response.sendRedirect("index.jsp");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
