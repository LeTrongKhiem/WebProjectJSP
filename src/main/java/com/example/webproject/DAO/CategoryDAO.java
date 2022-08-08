package com.example.webproject.DAO;

import com.example.webproject.BEAN.Category;

import java.util.ArrayList;

public interface CategoryDAO {
    //lấy danh sách danh mục cha
    public ArrayList<Category> getListCategoryParent();
    //lấy danh sách danh mục con
    public ArrayList<Category> getListCategoryChild(String categoryId);
    //lấy danh sách danh mục điện thoại
    public ArrayList<Category> getListCategoryPhone();
    public void deleteCategory(String maDanhMuc);

}
