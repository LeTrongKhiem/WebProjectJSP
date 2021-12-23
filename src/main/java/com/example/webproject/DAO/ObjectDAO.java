package com.example.webproject.DAO;

import com.example.webproject.BEAN.User;

public interface ObjectDAO {
    public boolean checkLogin(String email, String password);

    public boolean addUser(Object obj);

    public boolean editPassword(User user);
//    public boolean checkExistsUser();
}
