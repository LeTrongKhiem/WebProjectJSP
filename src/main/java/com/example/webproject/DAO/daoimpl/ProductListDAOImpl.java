package com.example.webproject.DAO.daoimpl;

import com.example.webproject.BEAN.Category;
import com.example.webproject.BEAN.PhoneProduct;
import com.example.webproject.BEAN.Product;
import com.example.webproject.BEAN.ProductList;
import com.example.webproject.DAO.ProductListDAO;
import com.example.webproject.DB.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

public class ProductListDAOImpl implements ProductListDAO {
    Connection connection = null;
    PreparedStatement statement;
    ResultSet resultSet;
    ArrayList<ProductList> listF;
    private static ProductListDAOImpl instance;

    public static ProductListDAOImpl getInstance() {
        if (instance == null) {
            instance = new ProductListDAOImpl();
        }
        return instance;
    }

    @Override
    public ArrayList<ProductList> getListProductByCategory(String categoryId) {
        Connection connection = DBConnection.getConnection();
        String sql = "select * from `danhmuc` inner join danhsachsp on danhmuc.MaDanhMuc = danhsachsp.MaDanhMuc where danhsachsp.MaDanhMuc = '" + categoryId + "'";
        ArrayList<ProductList> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
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
                list.add(productList);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public PhoneProduct getProductDetail(String maSP) {
        Connection connection = DBConnection.getConnection();
        String sql = "";
        PhoneProduct product = new PhoneProduct();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.first()) {
                Category category = new Category(resultSet.getString("MaDanhMuc"), "", "", "");
                product.setMaSP(resultSet.getString("MaSP"));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public int count(String txtSearch) {
        ArrayList<Product> products = new ArrayList<>();
        String query = "SELECT count(*) FROM danhsachsp where Ten LIKE ?";
        try {
            Connection connection = DBConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            ResultSet rs = ps.executeQuery();
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
                "       @rownum := @rownum + 1 AS line\n" +
                "  FROM  danhsachsp t, \n" +
                "       (SELECT @rownum := 0) r\n" +
                " WHERE Ten like ?) as x\n" +
                " WHERE line BETWEEN ? and ?";
        try {
            connection = new DBConnection().getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, "%" + txtSearch + "%");
            statement.setInt(2, 10 * (index - 1) + 1);
            statement.setInt(3, 10 * index);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setMaSP(resultSet.getString("Id"));
                product.setTenSP(resultSet.getString("Ten"));
                product.setGiaSP(resultSet.getInt("Gia"));
                product.setLink_hinhanh(resultSet.getString("Link_hinhanh"));
                products.add(product);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return products;
    }

    public List<Product> searchProduct(String txtSearch, int amount) {
        ArrayList<Product> products = new ArrayList<>();
        String query = "SELECT DISTINCT * FROM danhsachsp where Ten like ?\n" +
                "                               ORDER BY rank asc\n" +
                "                               LIMIT 10 \n" +
                "                              OFFSET ?";
        try {
            connection = new DBConnection().getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, "%" + txtSearch + "%");
            statement.setInt(2, amount);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setMaSP(resultSet.getString("Id"));
                product.setTenSP(resultSet.getString("Ten"));
                product.setGiaSP(resultSet.getInt("Gia"));
                product.setLink_hinhanh(resultSet.getString("Link_hinhanh"));
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
            connection = new DBConnection().getConnection();
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int total = resultSet.getInt(1);
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

    public int getNumberPageProduct(String category) {
        String query = "SELECT count(*) FROM danhsachsp where MaDanhMuc=?";
        try {
            connection = new DBConnection().getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, category);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int total = resultSet.getInt(1);
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
    public List<Product> getTop(int index, String category) {
        ArrayList<Product> products = new ArrayList<>();
        String query = "SELECT * FROM\n" +
                "(SELECT t.*, \n" +
                "       @rownum := @rownum + 1 AS rank\n" +
                "  FROM  danhsachsp t, \n" +
                "       (SELECT @rownum := 0)  r) where LoaiSP='DT' and MaDanhMuc=? as x\n" +
                " WHERE rank BETWEEN ? and ?";
        try {
            connection = new DBConnection().getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, category);
            statement.setInt(2, 10 * (index - 1) + 1);
            statement.setInt(3, 10 * index);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setMaSP(resultSet.getString("Id"));
                product.setTenSP(resultSet.getString("Ten"));
                product.setGiaSP(resultSet.getInt("Gia"));
                product.setLink_hinhanh(resultSet.getString("Link_hinhanh"));
                products.add(product);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return products;
    }

    public int getSoLuong(String id) {
        String query = "SELECT SoLuong FROM kho\n" +
                "WHERE Id =?";
        try {
            connection = new DBConnection().getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, id);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt(1);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public String dinhDang(long a) {
        DecimalFormat decimalFormat = new DecimalFormat("000,000 đ");
        return decimalFormat.format(a);
    }

    public Product getProductByID(String id) {

        Product product = null;
        ;
        String query = "select *  from danhsachsp LEFT JOIN  thongtindienthoai on danhsachsp.Id =thongtindienthoai.MaSP\n" +
                "                                LEFT JOIN  thongtinlaptop on danhsachsp.Id = thongtinlaptop.MaSP\n" +
                "                                LEFT JOIN  thongtinphukien on danhsachsp.Id = thongtinphukien.MaSP\n" +
                "                LEFT JOIN  motasp on danhsachsp.Id = motasp.Id\n" +
                "                                WHERE danhsachsp.Id = ?";

        try {
            connection = new DBConnection().getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, id);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {

                String maSP = resultSet.getString("Id");
                String tenSP = resultSet.getString("Ten");
                int giaSP = resultSet.getInt("Gia");
                String link_hinhanh = resultSet.getString("Link_hinhanh");
                String manHinh  = resultSet.getString("ManHinh");
                String hdh = resultSet.getString("HDH");
                String camSau = resultSet.getString("CamSau");
                String camTr = resultSet.getString("CamTruoc");
                String CPU = resultSet.getString("CPU");
                String RAM = resultSet.getString("RAM");
                String boNhoTrong = resultSet.getString("BoNhoTrong");
                String theSim = resultSet.getString("TheSim");
                String pin = resultSet.getString("DungLuongPin");
                String thietKe = resultSet.getString("ThietKe");
                String imei = resultSet.getString("Imei");
                String baiViet = resultSet.getString("BaiViet");
                String noiDung = resultSet.getString("NoiDung");
                String linkAnh2 = resultSet.getString("link_hinhanh");
                String linkAnh3 = resultSet.getString("link_hinhanh");
                String oCung = resultSet.getString("Ocung");
                String cardManHinh = resultSet.getString("CardManHinh");
                String congKetNoi = resultSet.getString("CongKetNoi");
                String dacBiet = resultSet.getString("DacBiet");
                String kichThuocVaTrongLuong = resultSet.getString("KichThuocVaTrongLuong");
                String thoiDiemRaMat = resultSet.getString("ThoiDiemRaMat");
                String loaiSP = resultSet.getString("LoaiSP");
                product = new Product(maSP, tenSP, giaSP,manHinh,hdh,camSau,camTr,CPU,RAM,boNhoTrong,theSim,pin,thietKe,
                        imei,baiViet,noiDung,linkAnh2,linkAnh3,oCung,cardManHinh,congKetNoi,dacBiet,kichThuocVaTrongLuong,thoiDiemRaMat,link_hinhanh,loaiSP );

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return product;
    }
    public List<Product> getAllProduct() {
        ArrayList<Product> products = new ArrayList<>();
        String query ="select * from danhsachsp";
        try {

            connection = new DBConnection().getConnection();
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setMaSP(resultSet.getString("Id"));
                product.setTenSP(resultSet.getString("Ten"));
                product.setGiaSP(resultSet.getInt("Gia"));
                product.setLink_hinhanh(resultSet.getString("Link_hinhanh"));
                product.setLoaiSP(resultSet.getString("LoaiSP"));
                products.add(product);
            }

        } catch ( SQLException ex) {
            ex.printStackTrace();
        }
        return products;
    }
    public void editProduct(String id, String name, String image,int price,String loaiSP,String maDanhMuc){
        String query = "UPDATE `danhsachsp` SET `Link_hinhanh`=?,`Ten`=?,`Gia`=?,`LoaiSP`=?,`MaDanhMuc`=? WHERE Id=?";
        try {
            connection = DBConnection.getConnection();
            statement = connection.prepareStatement(query);
//            statement.setString(1,id);
            statement.setString(1,image);
            statement.setString(2,name);
            statement.setInt(3,price);
            statement.setString(4,loaiSP);
            statement.setString(5,maDanhMuc);
            statement.setString(6,id);
            statement.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public void editProductDetail(String id, String hdh, String ram,String manHinh,String cpu, String thietKe){
        String query = "UPDATE  `motasp` SET `HDH`=?,`RAM`=?,`ManHinh`=?,`CPU`=?,`ThietKe`=? WHERE Id=?";
        try {
            connection = DBConnection.getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(6,id);
            statement.setString(1,hdh);
            statement.setString(2,ram);
            statement.setString(3,manHinh);
            statement.setString(4,cpu);
            statement.setString(5,thietKe);
            statement.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public void deleteProductAdmin(String id){
        String query = "DELETE FROM danhsachsp WHERE Id=?";
        try {
            connection = DBConnection.getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1,id);
            statement.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public void insertProduct(String id, String name, String image,int price,String loaiSP,String maDanhMuc){
        String query = "INSERT INTO `danhsachsp` (`Id`, `Link_hinhanh`, `Ten`, `Gia`,LoaiSP,MaDanhMuc) VALUES (?,?,?,?,?,?)";
        try {
            connection = DBConnection.getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1,id);
            statement.setString(2,image);
            statement.setString(3,name);
            statement.setInt(4,price);
            statement.setString(5,loaiSP);
            statement.setString(6,maDanhMuc);
            statement.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public void insertDetailProduct(String id, String hdh, String ram,String manHinh,String cpu, String thietKe){
        String query = "INSERT INTO `motasp`(`Id`,`HDH`,`RAM`,`ManHinh`,`CPU`,`ThietKe`) VALUES (?,?,?,?,?,?)";
        try {
            connection = DBConnection.getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1,id);
            statement.setString(2,hdh);
            statement.setString(3,ram);
            statement.setString(4,manHinh);
            statement.setString(5,cpu);
            statement.setString(6,thietKe);
            statement.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }


    public static void main(String[] args) {
//        new ProductListDAOImpl().insertProduct("123123", "Macbook 01", "dasdasdasd", 123123, "DT", "200001");
    }
}
