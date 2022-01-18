package com.example.webproject.BEAN;

import com.example.webproject.DAO.daoimpl.ProductListDAOImpl;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class Cart implements Serializable {
    private static final long serialVersionUID = 1L;

    private Map<String, Product> productsList;

    public Cart() {
        productsList = new HashMap<>();
    }

    public static Cart getInstance() {
        return new Cart();
    }

    public String dinhDang(long a) {
        DecimalFormat decimalFormat = new DecimalFormat("000,000 đ");
        return decimalFormat.format(a);
    }

    public void put(Product product) {
        ProductListDAOImpl dao = new ProductListDAOImpl();
        Product product1 = productsList.get(product.getMaSP());
        if (productsList.containsKey(product.getMaSP())) {
            if (product1.getQuantitySold() < dao.getSoLuong(product.getMaSP())) {
                upQuantity(product.getMaSP());
            } else {
                updateQuantitySold(product.getMaSP(), dao.getSoLuong(product.getMaSP()));
            }
        } else {
            product.setQuantitySold(1);
            productsList.put(product.getMaSP(), product);
        }

    }

    public void put(String id, Product product) {
        productsList.put(id, product);
    }

    private void upQuantity(String id) {
        Product product = productsList.get(id);
        ProductListDAOImpl dao = new ProductListDAOImpl();

        product.setQuantitySold(product.getQuantitySold() + 1);

    }

    public void updateQuantity(String id, int quantity) {
        Product product = productsList.get(id);
        product.setQuantitySold(quantity);
    }

    public Product get(String id) {
        return productsList.get(id);
    }

    public Product remove(String id) {
        return productsList.remove(id);
    }

    public long getTotal() {
        long totalPrice = 0;
        for (Product product : productsList.values()) {
            totalPrice += product.getTotalMoney();
        }
        return totalPrice;
    }

    public int getTotalQuantity() {
        int totalQuantity = 0;
        for (Product product : productsList.values()) {
            totalQuantity += product.getQuantitySold();
        }
        return totalQuantity;
    }

    public Collection<Product> getProductList() {
        return productsList.values();
    }

    public int updateQuantitySold(String id, int quantity) {
        ProductListDAOImpl dao = new ProductListDAOImpl();
        Product product = productsList.get(id);
        if (quantity < 0 || quantity > dao.getSoLuong(id)) {
            return dao.getSoLuong(id);
        } else {
            product.setQuantitySold(quantity);
        }
        return product.getQuantitySold();
    }


}
