package vn.edu.hcmuaf.fit.lab5.dao;

import vn.edu.hcmuaf.fit.lab5.beans.PhoneProduct;
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
            return handle.createQuery("select * from danhsachsp")
                    .mapToBean(Product.class).stream().collect(Collectors.toList());
        });
    }

    public Product getById(String id) {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select * from danhsachsp where Id = ?")
                    .bind(0, id)
                    .mapToBean(Product.class).first();
        });
    }

    public List<Product> getAllByLaptop() {
        ArrayList<Product> products = new ArrayList<>();
        String query ="select * from danhsachsp";
        try {

            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setMaSP(rs.getString("MaSp"));
                product.setTenSP(rs.getString("Ten"));
                product.setGiaSP(rs.getInt("Gia"));
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
                product.setTenSP(rs.getString("Ten"));
                product.setGiaSP(rs.getInt("Gia"));
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
        String query = "select * from danhsachsp inner join  thongtindienthoai on danhsachsp.MaSp =thongtindienthoai.MaSP \n"
                + "where thongtindienthoai.MaSP = ?";

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
                String manHinh  = rs.getString("ManHinh");
                String hdh = rs.getString("HeDH");
                String camSau = rs.getString("CamSau");
                String camTr = rs.getString("CamTruoc");
                String CPU = rs.getString("CPU");
                String RAM = rs.getString("RAM");
                String boNhoTrong = rs.getString("BoNhoTrong");
                String theSim = rs.getString("TheSim");
                String pin = rs.getString("DungLuongPin");
                String thietKe = rs.getString("ThietKe");
                String imei = rs.getString("Imei");
                String baiViet = rs.getString("BaiViet");
                String noiDung = rs.getString("NoiDung");
                String linkAnh2 = rs.getString("link_hinhanh");
                String linkAnh3 = rs.getString("link_hinhanh");
                product = new Product(maSP, tenSP, giaSP,manHinh,hdh,camSau,camTr,CPU,RAM,boNhoTrong,theSim,pin,thietKe,
                        imei,baiViet,noiDung,link_hinhanh,linkAnh2,linkAnh3,1 );

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return product;
    }
    public PhoneProduct getPhoneByID(String id) {

        PhoneProduct product = null;
        ;
        String query = "SELECT *\n" +
                "FROM danhsachsp INNER JOIN thongtindienthoai on danhsachsp.MaSp = thongtindienthoai.MaSP\n" +
                "WHERE danhsachsp.MaSp = ?";

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
                String manHinh  = rs.getString("ManHinh");
                product = new PhoneProduct(maSP,tenSP,giaSP,"","",manHinh, "","",
                        "","","","","","","","","",""
                        ,link_hinhanh,"","");

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return product;
    }

    public List<Product> searchByName(String txtSearch) {
        ArrayList<Product> products = new ArrayList<>();
        String query = "SELECT * FROM danhsachsp where Ten LIKE ?";
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setMaSP(rs.getString("Id"));
                product.setTenSP(rs.getString("Ten"));
                product.setGiaSP(rs.getInt("Gia"));
                product.setLink_hinhanh(rs.getString("Link_hinhanh"));
                products.add(product);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return products;
    }

    public int getNumberPage() {
        String query = "SELECT count(*) FROM danhsachsp";
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
        String query = "SELECT count(*) FROM danhsachsp";
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
        String query = "SELECT * FROM\n" +
                "(SELECT t.*, \n" +
                "       @rownum := @rownum + 1 AS rank\n" +
                "  FROM  danhsachsp t, \n" +
                "       (SELECT @rownum := 0)  r) where LoaiSP='DT' as x\n" +
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
                product.setTenSP(rs.getString("Ten"));
                product.setGiaSP(rs.getInt("Gia"));
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
        String query = "SELECT count(*) FROM danhsachsp where Ten LIKE ?";
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
        String query = "SELECT count(*) FROM danhsachsp";
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
                "  FROM  danhsachsp t, \n" +
                "       (SELECT @rownum := 0) r\n" +
                " WHERE Ten like ?) as x\n" +
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
                product.setTenSP(rs.getString("Ten"));
                product.setGiaSP(rs.getInt("Gia"));
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

        System.out.println(dao.getAllByLaptop());

    }

}
