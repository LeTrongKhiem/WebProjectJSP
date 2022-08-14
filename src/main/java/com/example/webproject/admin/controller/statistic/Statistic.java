package com.example.webproject.admin.controller.statistic;

import com.example.webproject.admin.dao.impl.StatisticDAOImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "Statistic", value = "/admin/Statistic")
public class Statistic extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String selectdayfrom = request.getParameter("fromDates");
        String selectdayto = request.getParameter("toDates");
//        String selectdayfrom = "2022/02/01";
//        String selectdayto = "2022/04/01";
        HttpSession session = request.getSession();
        Date fromDate, toDate;
        java.sql.Date sqlFromDate, sqlToDate;
        try {
            fromDate = new SimpleDateFormat("yyyy/MM/dd").parse(selectdayfrom);
            sqlFromDate = new java.sql.Date(fromDate.getTime());
            toDate = new SimpleDateFormat("yyyy/MM/dd").parse(selectdayto);
            sqlToDate = new java.sql.Date(toDate.getTime());
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        StatisticDAOImpl dao = new StatisticDAOImpl();
        List<com.example.webproject.BEAN.Statistic> list = dao.GetByDay(sqlFromDate, sqlToDate);
        request.setAttribute("st", list);
        request.getRequestDispatcher("/admin/ThongKe.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}