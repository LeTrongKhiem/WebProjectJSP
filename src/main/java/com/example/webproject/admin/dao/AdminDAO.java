package com.example.webproject.admin.dao;

import com.example.webproject.BEAN.Admin;
import com.example.webproject.BEAN.User;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface AdminDAO {
    public String register(Admin admin);
    public Map<String, Admin> listAdmin();
    public List<String> getListEmail();
    public Map<String, Admin> getListEmployee();
    public ArrayList<Admin> getListAdminUser();
    public ArrayList<User> getListCustomer();
}
