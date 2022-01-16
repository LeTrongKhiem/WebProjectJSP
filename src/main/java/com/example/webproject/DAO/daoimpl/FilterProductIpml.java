//package com.example.webproject.DAO.daoimpl;
//
//import com.example.webproject.BEAN.Category;
//import com.example.webproject.BEAN.Product;
//import com.example.webproject.BEAN.ProductList;
//import com.example.webproject.DAO.FilterProduct;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.util.ArrayList;
//import java.util.Collections;
//import java.util.Comparator;
//
//public class FilterProductIpml implements FilterProduct {
//    public static ArrayList<Product> listFilter = new ArrayList<>();
//    public static ArrayList<ProductList> listProduct = new ArrayList<>();
////    Connection connection = null;
////    PreparedStatement statement;
////    ResultSet resultSet;
//
//    @Override
//    public void selectByPrice(int priceF) {
//        ArrayList<Product> list = new ArrayList<>();
//        int price;
//        for (int i = 0; i < listFilter.size(); i++) {
//            price = (int) listFilter.get(i).getGiaSP();
//            if (price < priceF) {
//                list.add(listFilter.get(i));
//            }
//        }
//        listFilter = list;
//    }
//
//    @Override
//    public void selectByHDH(String hdhF) {
//        ArrayList<Product> list = new ArrayList<>();
//        String hdh;
//        for (int i = 0; i < listFilter.size(); i++) {
//            hdh = listFilter.get(i).getHdh();
//            if (hdh.equalsIgnoreCase(hdhF)) {
//                list.add(listFilter.get(i));
//            }
//        }
//        listFilter = list;
//    }
//
//    @Override
////    public void selectByCategory(String categoryF) {
////        ArrayList<Product> list = new ArrayList<>();
////        Category category;
////        for (int i = 0; i < listFilter.size(); i++) {
////            category = listFilter.get(i).getMaDanhMuc();
////            if (category.getMaDanhMuc().equalsIgnoreCase(categoryF)) {
////                list.add(listFilter.get(i));
////            }
////        }
////        listFilter = list;
////    }
//
//
//    @Override
//    public void sortByPrice(String price) {
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
//    }
//
//
//    public static void main(String[] args) {
//
//
//    }
//
//}
