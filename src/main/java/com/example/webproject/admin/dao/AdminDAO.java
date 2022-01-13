package com.example.webproject.admin.dao;

import com.example.webproject.admin.BEAN.Admin;

import java.util.List;
import java.util.Map;

public interface AdminDAO {
    public String register(Admin admin);
    public Map<String, Admin> listAdmin();
    public List<String> getListEmail();
}
