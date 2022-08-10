package com.example.webproject.BEAN;

import java.io.Serializable;
import java.util.Date;

public class Statistic implements Serializable {
    private Date Date;
    private double Revenues;
    private double Benefit;

    public Statistic() {
    }

    public Statistic(java.util.Date date, double revenues, double benefit) {
        Date = date;
        Revenues = revenues;
        Benefit = benefit;
    }

    public java.util.Date getDate() {
        return Date;
    }

    public void setDate(java.util.Date date) {
        Date = date;
    }

    public double getRevenues() {
        return Revenues;
    }

    public void setRevenues(double revenues) {
        Revenues = revenues;
    }

    public double getBenefit() {
        return Benefit;
    }

    public void setBenefit(double benefit) {
        Benefit = benefit;
    }

    @Override
    public String toString() {
        return "Statistic{" +
                "Date=" + Date +
                ", Revenues=" + Revenues +
                ", Benefit=" + Benefit +
                '}';
    }
}
