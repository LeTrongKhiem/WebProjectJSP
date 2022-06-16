package com.example.webproject.DAO.daoimpl;

import com.example.webproject.BEAN.Category;
import com.example.webproject.BEAN.Product;
import com.example.webproject.BEAN.ProductList;
import com.example.webproject.DAO.FilterProduct;
import com.example.webproject.DB.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class FilterProductIpml implements FilterProduct {
    Connection connection = null;
    PreparedStatement statement;
    ResultSet resultSet;
    public static ArrayList<Product> listFilter = new ArrayList<>();
    public static ArrayList<ProductList> listProduct = new ArrayList<>();
//    Connection connection = null;
//    PreparedStatement statement;
//    ResultSet resultSet;

    @Override
    public void selectByPrice(int priceF) {
        ArrayList<Product> list = new ArrayList<>();
        int price;
        for (int i = 0; i < listFilter.size(); i++) {
            price = (int) listFilter.get(i).getGiaSP();
            if (price < priceF) {
                list.add(listFilter.get(i));
            }
        }
        listFilter = list;
    }

    @Override
    public void selectByHDH(String hdhF) {
        ArrayList<Product> list = new ArrayList<>();
        String hdh;
        for (int i = 0; i < listFilter.size(); i++) {
            hdh = listFilter.get(i).getHdh();
            if (hdh.equalsIgnoreCase(hdhF)) {
                list.add(listFilter.get(i));
            }
        }
        listFilter = list;
    }

    @Override
    public void selectByCategory(String categoryF) {
        ArrayList<Product> list = new ArrayList<>();
        Category category;
        for (int i = 0; i < listFilter.size(); i++) {
            category = listFilter.get(i).getMaDanhMuc();
            if (category.getMaDanhMuc().equalsIgnoreCase(categoryF)) {
                list.add(listFilter.get(i));
            }
        }
        listFilter = list;
    }


    @Override
    public ArrayList<ProductList> sortByPrice(String locGia, String madanhmuc, String loaisp) {
//        listProduct = new ArrayList<ProductList>();
//        int count = ProductListDAOImpl.getInstance().getProductType().size();
//        for (int i = 0; i < count; i++) {
//            listProduct.add(ProductListDAOImpl.getInstance().getProductType().get(i));
//        }
//        if (price.equalsIgnoreCase("caodenthap")) {
//            Collections.sort(listProduct, new Comparator<ProductList>() {
//                @Override
//                public int compare(ProductList o1, ProductList o2) {
//                    return (int) (o2.getGia() - o1.getGia());
//                }
//            });
//        } else if (price.equalsIgnoreCase("thapdencao")) {
//            Collections.sort(listProduct, new Comparator<ProductList>() {
//                @Override
//                public int compare(ProductList o1, ProductList o2) {
//                    return (int) (o1.getGia() - o2.getGia());
//                }
//            });
//        }
        ArrayList<ProductList> listProductList = new ArrayList<ProductList>();
        String sql = null;
        if (loaisp == null || loaisp.equals("")) {
            sql = "select * from danhsachsp where MaDanhMuc='" + madanhmuc + "' order by Gia " + locGia;
        } else if (loaisp != null || !loaisp.equals("")) {
            sql = "select * from danhsachsp where LoaiSP='" + loaisp + "' order by Gia " + locGia;
        }
        try {
            connection = DBConnection.getConnection();
            statement = connection.prepareStatement(sql);
//            if (loaisp == null) {
//                statement.setString(1, madanhmuc);
//            } else {
//                statement.setString(1, loaisp);
//            }
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                ProductList productList = new ProductList();
                productList.setId(resultSet.getString("id"));
                Category category = new Category(resultSet.getString("MaDanhMuc"), "", "DanhMucCha", "");
                productList.setCategory(category);
                productList.setLink_hinhanh(resultSet.getString("Link_hinhanh"));
                productList.setTen(resultSet.getString("Ten"));
                long gia = resultSet.getLong("Gia");
                productList.setGia(gia);
                productList.setMaDanhMuc(resultSet.getString("MaDanhMuc"));
                productList.setTenDanhMuc(resultSet.getString("TenDanhMuc"));
                productList.setLoaiSP(resultSet.getString("LoaiSP"));
                productList.setRank(resultSet.getInt("rank"));
                listProductList.add(productList);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listProductList;
    }

    public List<ProductList> sortByPrice(int amount, String locGia, String madanhmuc) {
        String sql = "SELECT DISTINCT * FROM danhsachsp where MaDanhMuc = ?\n" +
                "                              ORDER BY Gia " + locGia + "\n" +
                "                             LIMIT 10 \n" +
                "                               OFFSET ?";
        ArrayList<ProductList> list = new ArrayList<>();
        try {
            connection = DBConnection.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1, madanhmuc);
            statement.setInt(2, amount);
            resultSet = statement.executeQuery();
//            statement.setString(1, type);
            while (resultSet.next()) {
                ProductList productList = new ProductList();
                productList.setId(resultSet.getString("id"));
                Category category = new Category(resultSet.getString("MaDanhMuc"), "", "DanhMucCha", "");
                productList.setCategory(category);
                productList.setLink_hinhanh(resultSet.getString("Link_hinhanh"));
                productList.setTen(resultSet.getString("Ten"));
                long gia = resultSet.getLong("Gia");
                productList.setGia(gia);
                productList.setMaDanhMuc(resultSet.getString("MaDanhMuc"));
                productList.setTenDanhMuc(resultSet.getString("TenDanhMuc"));
                productList.setLoaiSP(resultSet.getString("LoaiSP"));
                productList.setRank(resultSet.getInt("rank"));
                list.add(productList);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    public static void main(String[] args) {
        List<ProductList> list = new FilterProductIpml().sortByPrice("desc", "", "DT");
        for (ProductList l : list) {
            System.out.println(l.getTen());
        }
    }

}
