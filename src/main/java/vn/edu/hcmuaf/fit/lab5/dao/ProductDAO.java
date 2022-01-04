package vn.edu.hcmuaf.fit.lab5.dao;

import vn.edu.hcmuaf.fit.lab5.beans.Product;
import vn.edu.hcmuaf.fit.lab5.db.DBConnect;
import vn.edu.hcmuaf.fit.lab5.db.JDBIConnector;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class ProductDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public ProductDAO() {

    }

    public List<Product> getAll() {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select * from thongtinlaptop")
                    .mapToBean(Product.class).stream().collect(Collectors.toList());
        });
    }

    public Product getById(String id) {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select * from thongtinlaptop where MaSP = ?")
                    .bind(0, id)
                    .mapToBean(Product.class).first();
        });
    }

    public List<Product> getAllByLaptop() {
        ArrayList<Product> products = new ArrayList<>();
        Statement stmt = DBConnect.getInstance().get();

        try {
            ResultSet rs = stmt.executeQuery("select * from thongtinlaptop");
            while (rs.next()) {
                Product product = new Product();
                product.setMaSP(rs.getString("MaSP"));
                product.setTenSP(rs.getString("TenSP"));
                product.setGiaSP(rs.getInt("GiaSP"));
                product.setLink_hinhanh(rs.getString("Link_hinhanh"));
                products.add(product);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return products;
    }

    public List<Product> getTop3ByLaptop() {
        ArrayList<Product> products = new ArrayList<>();
        String query = "SELECT * FROM thongtinlaptop LIMIT 3";
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setMaSP(rs.getString("MaSP"));
                product.setTenSP(rs.getString("TenSP"));
                product.setGiaSP(rs.getInt("GiaSP"));
                product.setLink_hinhanh(rs.getString("Link_hinhanh"));
                products.add(product);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return products;
    }

    public List<Product> paging(int index) {
        ArrayList<Product> products = new ArrayList<>();
        String query = "SELECT * FROM\n" +
                "(SELECT t.*, \n" +
                "       @rownum := @rownum + 1 AS rank\n" +
                "  FROM  thongtinlaptop t, \n" +
                "       (SELECT @rownum := 0) r\n" +
                " WHERE rank BETWEEN ? and ?";
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query);

            ps.setInt(1, 10 * (index - 1) + 1);
            ps.setInt(2, 10 * index);
            rs = ps.executeQuery();

            while (rs.next()) {
                Product product = new Product();
                product.setMaSP(rs.getString("MaSP"));
                product.setTenSP(rs.getString("TenSP"));
                product.setGiaSP(rs.getInt("GiaSP"));
                product.setLink_hinhanh(rs.getString("Link_hinhanh"));

                products.add(product);
            }

        } catch (Exception ex) {

        }
        return products;
    }

    public Product getLaptopByID(String id) {

        Product product = null;
        ;
        String query = "select * from thongtinlaptop\n"
                + "where MaSP = ?";

        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {

                String maSP = rs.getString("MaSP");
                String tenSP = rs.getString("TenSP");
                int giaSP = rs.getInt("GiaSP");
                String link_hinhanh = rs.getString("Link_hinhanh");
                product = new Product(maSP, tenSP, giaSP, 1, link_hinhanh);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return product;
    }

    public List<Product> searchByName(String txtSearch) {
        ArrayList<Product> products = new ArrayList<>();
        String query = "SELECT * FROM thongtinlaptop where TenSP LIKE ?";
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setMaSP(rs.getString("MaSP"));
                product.setTenSP(rs.getString("TenSP"));
                product.setGiaSP(rs.getInt("GiaSP"));
                product.setLink_hinhanh(rs.getString("Link_hinhanh"));
                products.add(product);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return products;
    }

    public int getNumberPage() {
        String query = "SELECT count(*) FROM thongtinlaptop";
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                    int countPage = 0;
                    countPage = total / 10;
                    if (total % 10 != 0) {
                        countPage++;
                }
                return countPage;
            }


        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    public int getNumberOfProduct() {
        String query = "SELECT count(*) FROM thongtinlaptop";
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    public List<Product> getTop(int index) {
        ArrayList<Product> products = new ArrayList<>();
        String query = "SELECT * FROM thongtinlaptop WHERE MaSP BETWEEN ? AND ?";
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, 10 * (index - 1) + 1);
            ps.setInt(2, 10 * index);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setMaSP(rs.getString("MaSP"));
                product.setTenSP(rs.getString("TenSP"));
                product.setGiaSP(rs.getInt("GiaSP"));
                product.setLink_hinhanh(rs.getString("Link_hinhanh"));
                products.add(product);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return products;
    }

    public int count(String txtSearch) {
        ArrayList<Product> products = new ArrayList<>();
        String query = "SELECT count(*) FROM thongtinlaptop where TenSP LIKE ?";
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return 0;


    }

    public int countPage() {
        String query = "SELECT count(*) FROM thongtinlaptop";
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    public List<Product> search(String txtSearch, int index) {
        ArrayList<Product> products = new ArrayList<>();
        String query = "SELECT * FROM\n" +
                "(SELECT t.*, \n" +
                "       @rownum := @rownum + 1 AS rank\n" +
                "  FROM  thongtinlaptop t, \n" +
                "       (SELECT @rownum := 0) r\n" +
                " WHERE TenSP like ?) as x\n" +
                " WHERE rank BETWEEN ? and ?";
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            ps.setInt(2, 10 * (index - 1) + 1);
            ps.setInt(3, 10 * index);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setMaSP(rs.getString("MaSP"));
                product.setTenSP(rs.getString("TenSP"));
                product.setGiaSP(rs.getInt("GiaSP"));
                product.setLink_hinhanh(rs.getString("Link_hinhanh"));
                products.add(product);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return products;
    }

    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
        int count = dao.getNumberOfProduct();
        System.out.println(count);
    }

}
