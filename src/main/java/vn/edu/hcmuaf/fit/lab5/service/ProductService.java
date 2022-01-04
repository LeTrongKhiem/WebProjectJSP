package vn.edu.hcmuaf.fit.lab5.service;

import vn.edu.hcmuaf.fit.lab5.beans.Product;
import vn.edu.hcmuaf.fit.lab5.dao.ProductDAO;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class ProductService {
    public static ProductService instance;
//    Map<String, Product> products = new HashMap<>();
//    {
//        products.put("sp1",new Product("https://cdn.mobilecity.vn/mobilecity-vn/images/2021/04/w150/xiaomi-redmi-k40-pro-2-1.jpg","Xiaomi Redmi K40 Pro (K40 Pro+)",8750000,"hot","#","#"));
//        products.put("sp2",new Product("https://cdn.mobilecity.vn/mobilecity-vn/images/2021/03/w150/redmi-k40-full.jpg","Xiaomi Redmi K40",7350000,"hot","#","#"));
//        products.put("sp3",new Product("https://cdn.mobilecity.vn/mobilecity-vn/images/2021/02/w150/asus-rog-phone-5-render-1-1200x675-800-resize.jpg","Xiaomi Redmi K40",14650000,"hot","#","#"));
//        products.put("sp4",new Product("https://cdn.mobilecity.vn/mobilecity-vn/images/2021/04/w150/asus-rog-phone-3.jpg","Asus ROG Phone 3 Tencent",12540000,"hot","#","#"));
//        products.put("sp5",new Product("https://cdn.mobilecity.vn/mobilecity-vn/images/2019/09/w150/iphone-11-pro.jpg","iPhone 11 Pro (64GB, 256GB)",2000000,"hot","#","#"));
//        products.put("sp6",new Product("https://cdn.mobilecity.vn/mobilecity-vn/images/2021/10/w300/mi-11t-den.jpeg","Xiaomi 11T Pro 5G (Chính hãng)",9995000,"hot","#","#"));
//        products.put("sp7",new Product("https://cdn.tgdd.vn/Products/Images/42/248284/samsung-galaxy-z-fold-3-green-1-600x600.jpg","Samsung Galaxy Z Fold3 5G 512GB",44990000,"hot","#","#"));
//        products.put("sp8",new Product("https://cdn.tgdd.vn/Products/Images/42/213031/iphone-12-den-new-2-600x600.jpg","iPhone 12",20990000,"hot","#","#"));
//        products.put("sp9",new Product("https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-sierra-blue-600x600.jpg","iPhone 13 Pro Max",34990000,"hot","#","#"));
//        products.put("sp10",new Product("https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-sierra-blue-600x600.jpg","iPhone 13 Pro",31990000,"hot","#","#"));
//        products.put("sp11",new Product("https://cdn.tgdd.vn/Products/Images/42/241049/samsung-galaxy-a03s-black-600x600.jpg","Samsung Galaxy A03s",3490000,"hot","#","#"));
//        products.put("sp12",new Product("https://cdn.tgdd.vn/Products/Images/42/247507/samsung-galaxy-a52s-5g-mint-600x600.jpg","Samsung Galaxy A52s 5G",10290000,"hot","#","#"));
//        products.put("sp13",new Product("https://cdn.tgdd.vn/Products/Images/42/226099/samsung-galaxy-z-fold-2-den-600x600.jpg","Samsung Galaxy Z Fold2 5G",44000000,"hot","#","#"));
//        products.put("sp14",new Product("https://cdn.tgdd.vn/Products/Images/42/248283/samsung-galaxy-z-flip-3-violet-1-600x600.jpg","Samsung Galaxy Z Flip3 5G 256GB",26990000,"hot","#","#"));
//        products.put("sp15",new Product("https://cdn.tgdd.vn/Products/Images/42/226316/samsung-galaxy-s21-ultra-bac-600x600-1-600x600.jpg","Samsung Galaxy S21 Ultra 5G 128GB",25990000,"hot","#","#"));
//        products.put("sp16",new Product("https://cdn.tgdd.vn/Products/Images/42/229949/samsung-galaxy-z-flip-3-cream-1-600x600.jpg","Samsung Galaxy Z Flip3 5G 128GB",24990000,"hot","#","#"));
//        products.put("sp17",new Product("https://cdn.tgdd.vn/Products/Images/42/226385/samsung-galaxy-s21-plus-den-600x600-600x600.jpg","Samsung Galaxy S21+ 5G 128GB",20990000,"hot","#","#"));
//        products.put("sp18",new Product("https://cdn.tgdd.vn/Products/Images/42/218355/samsung-galaxy-note-20-062220-122200-fix-600x600.jpg","Samsung Galaxy Note 20",15990000,"hot","#","#"));
//        products.put("sp19",new Product("https://cdn.tgdd.vn/Products/Images/42/224859/samsung-galaxy-s20-fan-edition-090320-040338-600x600.jpg","Samsung Galaxy S20 FE (8GB/256GB)",13490000,"hot","#","#"));
//        products.put("sp20",new Product("https://cdn.tgdd.vn/Products/Images/42/226101/samsung-galaxy-a72-thumb-balck-600x600-600x600.jpg","Samsung Galaxy A72",11490000,"hot","#","#"));
//
//
//
//    }
//    public static ProductService getInstance() {
//        if(instance==null){
//            instance = new ProductService();
//
//        }
//        return instance;
//    }
//    private ProductService(){
//
//    }
//    public List<Product> getAll(){
////    return  new LinkedList<>(products.values());
////        return ProductDAO.getInstance().getAll();
//        return  ProductDAO.getInstance().getAllByLaptop();
//    }
//    public List<Product> getTop3(){
////    return  new LinkedList<>(products.values());
////        return ProductDAO.getInstance().getAll();
//        return  ProductDAO.getInstance().getTop3ByLaptop();
//    }
//    public List<Product> getNext3(int amount){
////    return  new LinkedList<>(products.values());
////        return ProductDAO.getInstance().getAll();
//      return  ProductDAO.getInstance().getNext3(amount);
//    }
//
//    public Product getById(String id) {
//       return ProductDAO.getInstance().getLaptopByID(id);
//    }
//    public int getPage(){
//        final int numberOfProduct = ProductDAO.getInstance().getNumberOfProduct();
//        return numberOfProduct;
//    }
}
