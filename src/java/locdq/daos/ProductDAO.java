/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package locdq.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import locdq.dtos.ProductDTO;
import locdq.utils.DBUtils;

/**
 *
 * @author test
 */
public class ProductDAO {

    public List<ProductDTO> getlistproduct(String productname) throws SQLException {
        List<ProductDTO> listpr = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnect();
            if (con != null) {
                String sql = "SELECT * "
                        + "FROM tblProducts "
                        + "WHERE productName LIKE ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + productname + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String ID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    int quantity = rs.getInt("quantity");
                    float price = rs.getFloat("price");
                    String img = rs.getString("img");
                    String categoryID = rs.getString("categoryID");
                    ProductDTO product = new ProductDTO(ID, productName, quantity, price, img, categoryID, 0);
                    listpr.add(product);
                }
            }
        } catch (Exception e) {

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return listpr;
    }

    public boolean delete(String productID) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.getConnect();
            if (con != null) {
                String sql = "DELETE FROM tblProducts WHERE productID= ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, productID);
                check = stm.executeUpdate() == 0 ? false : true;
            }
        } catch (Exception e) {

        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return check;
    }

    public boolean edit(String productID, String quantity, String price, String img) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.getConnect();
            if (con != null) {
                String sql = "UPDATE tblProducts "
                        + "SET quantity = ?, price= ?, img= ? "
                        + "WHERE productID= ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, quantity);
                stm.setString(2, price);
                stm.setString(3, img);
                stm.setString(4, productID);
                check = stm.executeUpdate() == 0 ? false : true;
            }
        } catch (Exception e) {

        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return check;
    }
    
    public void updatequantity(int quantity,String productID) throws SQLException{
         Connection con = null;
        PreparedStatement stm = null;
        try{
            con=DBUtils.getConnect();
            if (con!=null){
                String sql="UPDATE tblProducts "
                        + "SET quantity = ? "
                        + "WHERE productID = ? ";
                stm=con.prepareStatement(sql);
                stm.setInt(1, quantity);
                stm.setString(2, productID);
                stm.executeUpdate();
            }
        }catch(Exception e){
            
        }finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
    
    public int getquantity(String productID) throws SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs=null;
        try{
            con=DBUtils.getConnect();
            if(con!=null){
                String sql="SELECT quantity "
                        + "FROM tblProducts "
                        + "WHERE productID= ? ";
                stm=con.prepareStatement(sql);
                stm.setString(1, productID);
                rs=stm.executeQuery();
                if(rs.next()){
                    return rs.getInt("quantity");
                }
            }
        }catch(Exception e){
            
        }finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return 0;
    }
    
    public boolean checkDuplicatePro(String productID) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnect();
            if (con != null) {
                String sql = "SELECT productID "
                        + "FROM tblProducts "
                        + "WHERE productID = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, productID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {

        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return check;
    }
    
    public List<String> getCategoryID() throws SQLException{
        List<String> list=new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs=null;
        try{
            con=DBUtils.getConnect();
            if(con!=null){
                String sql="SELECT categoryID "
                        + "FROM tblCategories ";
                stm=con.prepareStatement(sql);
                rs=stm.executeQuery();
                if (rs.next()){
                    list.add(rs.getString("categoryID"));
                }
            }
        }catch(Exception e){
            
        }finally{
             if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }
    
     public boolean insertPro(ProductDTO pro) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.getConnect();
            if (con != null) {
                String sql = "INSERT INTO tblProducts(productID,productName,quantity,price,img,categoryID) "
                        + "VALUES ( ? , ? , ? , ? , ? , ? )";
                stm = con.prepareStatement(sql);
                stm.setString(1, pro.getProductID());
                stm.setString(2, pro.getProductName());
                stm.setInt(3, pro.getQuantity());
                stm.setFloat(4, pro.getPrice());
                stm.setString(5, pro.getImg());
                stm.setString(6, pro.getCategoryID());
                check = stm.executeUpdate() == 0 ? false : true;
            }
        } catch (Exception e) {

        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return check;
    }
}
