package com.example.webproject.BEAN;

import java.io.Serializable;

public class User implements Serializable {
    private static final long serialVersionUID= 1L;
    private String id;
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
    private String code;
    private String address;
    private int active;

    private String publicKeyN;
    private String publicKeyE;

    public User() {
    }

    public User(String name, String email, String phone, String gender, String date, String month, String year, String password, String re_password, int role, String code) {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.gender = gender;
        this.date = date;
        this.month = month;
        this.year = year;
        this.password = password;
        this.re_password = re_password;
        this.role = role;
        this.code = code;
    }


    public User(String name, String email, String phone, String gender, String date, String month, String year, String password, String re_password, int role) {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.gender = gender;
        this.date = date;
        this.month = month;
        this.year = year;
        this.password = password;
        this.re_password = re_password;
        this.role = role;
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

    public User(String name, String email, String phone, String gender, String date, String month, String year, String password, String re_password, String publicKeyN, String publicKeyE) {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.gender = gender;
        this.date = date;
        this.month = month;
        this.year = year;
        this.password = password;
        this.re_password = re_password;
        this.publicKeyN = publicKeyN;
        this.publicKeyE = publicKeyE;
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

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }


    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int isActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }

    public String getPublicKeyN() {
        return publicKeyN;
    }

    public void setPublicKeyN(String publicKeyN) {
        this.publicKeyN = publicKeyN;
    }

    public String getPublicKeyE() {
        return publicKeyE;
    }

    public void setPublicKeyE(String publicKeyE) {
        this.publicKeyE = publicKeyE;
    }

    @Override
    public String toString() {
        return "User{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", gender='" + gender + '\'' +
                ", date='" + date + '\'' +
                ", month='" + month + '\'' +
                ", year='" + year + '\'' +
                ", password='" + password + '\'' +
                ", re_password='" + re_password + '\'' +
                ", role=" + role +
                ", code='" + code + '\'' +
                ", address='" + address + '\'' +
                ", active=" + active +
                ", publicKeyN='" + publicKeyN + '\'' +
                ", publicKeyE='" + publicKeyE + '\'' +
                '}';
    }
}
