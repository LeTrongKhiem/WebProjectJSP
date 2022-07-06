package com.example.webproject.DAO;

import com.example.webproject.BEAN.User;

import java.util.List;
import java.util.Map;

public interface UserDAO {
    //method edit password
    public boolean editPassword(User user);

    //    public boolean checkExistsUser();
    public String registerUser(User user);
    //get info user
    public User getInfoUser(String emailUser);
    //get list user
    public Map<String, User> listUser();
    //get list email regiter user
    public List<String> getListEmail();
}
