package com.example.webproject.DAO;

import com.example.webproject.BEAN.Admin;


import java.sql.Date;
import java.util.ArrayList;

public interface AdminDAO {

    ArrayList<Admin> getListAdmin();

    void editAdmin(int adminId, String matKhau, String hoTen, String email, String sDT, Date ngayBatDau, String quyen, String role, String active, String code, String adress);

    //lấy danh sách danh mục con
//   public ArrayList<Admin> getListCategoryChild(String categoryId);
    //lấy danh sách danh mục điện thoại
  public void deleteAdmin(String adminId);

}
