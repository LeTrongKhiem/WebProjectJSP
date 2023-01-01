package com.example.webproject.DAO;

import com.example.webproject.BEAN.User;
import com.example.webproject.BEAN.UserOrder;

import java.util.List;
import java.util.Map;

public interface UserDAO {
    //method edit password
    public boolean editPassword(User user);

    //    public boolean checkExistsUser();
    public String registerUser(User user, String privateKey);
    //get info user
    public User getInfoUser(String emailUser);
    //get list user
    public Map<String, User> listUser();
    //get list email regiter user
    public List<String> getListEmail();
    public List<UserOrder> getOrder(String email);
    public User getUserById(String id);
}
