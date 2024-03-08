/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

/**
 *
 * @author haqua
 */
import DBConnect.DBContext;
import Model.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class ProductDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public void addProduct(Product p) {
        String sql = "INSERT INTO [Product](product_id, product_name, product_picture, price, category_id) VALUES (?, ?, ?, ?, ?)";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, p.getProduct_id());
            ps.setString(2, p.getProduct_name());
            ps.setString(3, p.getProduct_picture());
            ps.setFloat(4, p.getPrice());
            ps.setString(5, p.getCategory_id());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public Product getProductById(String product_id) {
        String sql = "select * from product where product_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, product_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Product p = new Product(rs.getString("product_id"),
                        rs.getString("product_name"),
                        rs.getString("product_picture"),
                        rs.getFloat("price"),
                        rs.getString("category_id")
                );
                return p;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public void deleteProduct(String product_id) {
        String sql = "DELETE FROM [dbo].[Product] WHERE product_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, product_id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void updateProduct(Product p) {
        String sql = "UPDATE Product SET product_name=?, product_picture=?, price=?, category_id=? WHERE product_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, p.getProduct_name());
            ps.setString(2, p.getProduct_picture());
            ps.setFloat(3, p.getPrice());
            ps.setString(4, p.getCategory_id());
            ps.setString(5, p.getProduct_id());
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public List<Product> getProductByCid(String category_id) {
        List<Product> list = new ArrayList<>();
        String sql = "Select * from Product where category_id=?";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setNString(1, category_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getString("product_id"),
                        rs.getString("product_name"),
                        rs.getString("product_picture"),
                        rs.getFloat("price"),
                        rs.getString("category_id")
                );
                list.add(p);
            }

        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "Select * from Product";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getString("product_id"),
                        rs.getString("product_name"),
                        rs.getString("product_picture"),
                        rs.getFloat("price"),
                        rs.getString("category_id")
                );
                list.add(p);
            }

        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> searchByName(String txtSearch) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where [product_name] like ?";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getString("product_id"),
                        rs.getString("product_name"),
                        rs.getString("product_picture"),
                        rs.getFloat("price"),
                        rs.getString("category_id")
                );
                list.add(p);
            }

        } catch (Exception e) {
        }
        return list;
    }

    public ArrayList<Product> getProductsByPage(int start, int recordsPerPage) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            PreparedStatement preparedStatement;
            if (start == 0) { // Trang đầu tiên
                preparedStatement = conn.prepareStatement("SELECT TOP 7 * FROM Product ORDER BY product_id");
            } else {
                preparedStatement = conn.prepareStatement("SELECT * FROM Product ORDER BY product_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");
                preparedStatement.setInt(1, start);
                preparedStatement.setInt(2, recordsPerPage);
            }
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getString("product_id"),
                        rs.getString("product_name"),
                        rs.getString("product_picture"),
                        rs.getFloat("price"),
                        rs.getString("category_id")
                );
                products.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return products;
    }

    public int getNumberOfRecords() {
        int numOfRecords = 0;
        try {
            Connection connection = DBContext.getConnection();
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT COUNT(*) AS count FROM [Product]");
            if (rs.next()) {
                numOfRecords = rs.getInt("count");
            }
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return numOfRecords;
    }

}
