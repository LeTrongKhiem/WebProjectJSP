package com.example.webproject.BEAN;

import java.util.Date;

public class Admin {
    private int id;
    private String matKhau;
    private String hoTen;
    private String email;
    private String sdt;
    private Date ngayBD;
    private String quyen;
    private int role;
    private int active;
    private String code;
    private String address;

    public Admin() {
    }

    public Admin(int id, String matKhau, String hoTen, String email, String sdt, Date ngayBD, String quyen, int role, String address) {
        this.id = id;
        this.matKhau = matKhau;
        this.hoTen = hoTen;
        this.email = email;
        this.sdt = sdt;
        this.ngayBD = ngayBD;
        this.quyen = quyen;
        this.role = role;
        this.address = address;
    }

    public Admin(String matKhau, String hoTen, String email, String sdt, String address) {
        this.matKhau = matKhau;
        this.hoTen = hoTen;
        this.email = email;
        this.sdt = sdt;
        this.ngayBD = ngayBD;
        this.address = address;
    }

    public Admin(String matKhau, String hoTen, String email, String sdt, String address, String code) {

        this.matKhau = matKhau;
        this.hoTen = hoTen;
        this.email = email;
        this.sdt = sdt;
        this.address = address;
        this.code = code;
    }

    public Admin(int id, String matKhau, String hoTen, String email, String sdt, Date ngaySinh, String quyen, int role, int active, String code, String address) {
        this.id = id;
        this.matKhau = matKhau;
        this.hoTen = hoTen;
        this.email = email;
        this.sdt = sdt;
        this.ngayBD = ngayBD;
        this.quyen = quyen;
        this.role = role;
        this.active = active;
        this.code = code;
        this.address = address;
    }

    public Admin(int id, String matKhau, String hoTen, String email, String sdt, Date ngaySinh, String code, String address) {
        this.id = id;
        this.matKhau = matKhau;
        this.hoTen = hoTen;
        this.email = email;
        this.sdt = sdt;
        this.ngayBD = ngayBD;
        this.code = code;
        this.address = address;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public Date getNgayBD() {
        return ngayBD;
    }

    public void setNgayBD(Date ngaySinh) {
        this.ngayBD = ngayBD;
    }

    public String getQuyen() {
        return quyen;
    }

    public void setQuyen(String quyen) {
        this.quyen = quyen;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
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

    @Override
    public String toString() {
        return "Admin{" +
                "id=" + id +
                ", matKhau='" + matKhau + '\'' +
                ", hoTen='" + hoTen + '\'' +
                ", email='" + email + '\'' +
                ", sdt='" + sdt + '\'' +
                ", ngayBD=" + ngayBD +
                ", quyen='" + quyen + '\'' +
                ", role=" + role +
                ", active=" + active +
                ", code='" + code + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
}

