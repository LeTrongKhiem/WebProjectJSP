package com.example.webproject.DAO;

import com.example.webproject.BEAN.Category;

import java.util.ArrayList;

public interface CategoryDAO {
    public ArrayList<Category> getListCategoryParent();
    public ArrayList<Category> getListCategoryChild(String categoryId);
}
