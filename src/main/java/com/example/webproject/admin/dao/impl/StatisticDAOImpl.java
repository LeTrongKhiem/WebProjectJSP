package com.example.webproject.admin.dao.impl;

import com.example.webproject.BEAN.Statistic;
import com.example.webproject.DB.DBConnection;
import com.example.webproject.admin.dao.StatisticDAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StatisticDAOImpl implements StatisticDAO {
    Connection connection = null;
    PreparedStatement statement;
    ResultSet resultSet;
    CallableStatement procstate = null;
    private static StatisticDAOImpl instance;

    public static StatisticDAOImpl getInstance() {
        if (instance == null) {
            instance = new StatisticDAOImpl();
        }
        return instance;
    }

    @Override
    public List<Statistic> GetByDay(Date fromDate, Date toDate) {
        connection = DBConnection.getConnection();
        List<Statistic> statisticList = new ArrayList<Statistic>();
        try {
            String query = "{call BenefitStatistic(?, ?)}";
            procstate = connection.prepareCall(query);
            procstate.setDate(1, fromDate);
            procstate.setDate(2, toDate);
            resultSet = procstate.executeQuery();
            while (resultSet.next()) {
                Statistic statistic = new Statistic();
                statistic.setDate(resultSet.getDate("Date"));
                statistic.setRevenues(resultSet.getDouble("Revenues"));
                statistic.setBenefit(resultSet.getDouble("Benefit"));
                statisticList.add(statistic);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return statisticList;
    }

    public static void main(String[] args) {
        List<Statistic> list = new StatisticDAOImpl().GetByDay(Date.valueOf("2022-02-01"), Date.valueOf("2022-04-01"));
        for (Statistic s : list) {
            System.out.println(s.toString());
        }
    }
}
