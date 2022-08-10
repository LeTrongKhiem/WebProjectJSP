package com.example.webproject.admin.dao;

import com.example.webproject.BEAN.Statistic;

import java.sql.Date;
import java.util.List;

public interface StatisticDAO {
    public List<Statistic> GetByDay(Date fromDate, Date toDate);
}
