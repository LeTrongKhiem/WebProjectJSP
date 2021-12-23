package com.example.webproject.BEAN;

public class User {
    private String name;
    private String email;
    private String phone;
    private String gender;
    private String date;
    private String month;
    private String year;
    private String password;
    private String re_password;
    private int role;


    public User() {
    }

    public User(String name, String email, String phone, String gender, String date, String month, String year, String password, String re_password) {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.gender = gender;
        this.date = date;
        this.month = month;
        this.year = year;
        this.password = password;
        this.re_password = re_password;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRe_password() {
        return re_password;
    }

    public void setRe_password(String re_password) {
        this.re_password = re_password;
    }
}
