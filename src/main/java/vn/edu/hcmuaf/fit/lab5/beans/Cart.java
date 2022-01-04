package vn.edu.hcmuaf.fit.lab5.beans;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Cart implements Serializable {
    private static final long serialVersionUID= 1L;

    private Map<String, Product> productsList;
    public Cart(){
        productsList = new HashMap<>();
    }
    public static Cart getInstance() {
       return new Cart();
    }
    public void put(Product product){
        if(productsList.containsKey(product.getMaSP())){
                upQuantity(product.getMaSP());

        }else {
            product.setQuantitySold(1);
            productsList.put(product.getMaSP(), product);
        }
    }
    private void upQuantity(String id){
        Product product = productsList.get(id);
        product.setQuantitySold(product.getQuantitySold()+1);
    }
    public void updateQuantity(String id , int quantity){
        Product product = productsList.get(id);
        product.setQuantitySold(quantity);
    }
    public Product get(String id){
        return  productsList.get(id);
    }
    public Product remove(String id){
        return productsList.remove(id);
    }

    public double getTotal(){
        double totalPrice =0;
        for(Product product : productsList.values()){
            totalPrice +=product.getTotalMoney();
        }
        return totalPrice;
    }
    public int getTotalQuantity(){
        int totalQuantity = 0;
        for(Product product : productsList.values()){
            totalQuantity+=product.getQuantitySold();
        }
        return  totalQuantity;
    }
    public Collection<Product> getProductList(){
        return  productsList.values();
    }
}
