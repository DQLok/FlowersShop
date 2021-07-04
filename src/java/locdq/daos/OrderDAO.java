/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package locdq.daos;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import locdq.dtos.OrderDTO;
import locdq.utils.DBUtils;

/**
 *
 * @author test
 */
public class OrderDAO {

    public boolean addorder(Date date, float total, boolean isPay, String userID) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.getConnect();
            if (con != null) {
                String sql = "INSERT INTO tblOders( date , total, isPay , userID ) "
                        + "VALUES ( ? , ? , ? , ? )";
                stm = con.prepareStatement(sql);
                stm.setDate(1, date);
                stm.setFloat(2, total);
                stm.setBoolean(3, isPay);
                stm.setString(4, userID);
                check = stm.executeUpdate() == 0 ? false : true;
            }
        } catch (Exception e) {

        } finally {
            if (con != null) {
                con.close();
            }
            if (stm != null) {
                stm.close();
            }
        }
        return check;
    }

    public int getorderid(Date date, float total, boolean isPay, String userID) throws SQLException {
        int orderID = 0;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnect();
            if (con != null) {
                String sql = "SELECT orderID "
                        + "FROM tblOders "
                        + "WHERE date = ? AND total= ? AND isPay = ? AND userID = ? ";
                stm = con.prepareStatement(sql);
                stm.setDate(1, date);
                stm.setFloat(2, total);
                stm.setBoolean(3, isPay);
                stm.setString(4, userID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    orderID = rs.getInt("orderID");
                }
            }
        } catch (Exception e) {

        } finally {
            if (con != null) {
                con.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return orderID;
    }

    public List<OrderDTO> getOrder(String userID) throws SQLException {
        List<OrderDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con=DBUtils.getConnect();
            if(con!=null){
            String sql="SELECT date , total , userID "
                    + "FROM tblOders "
                    + "WHERE userID= ? ";
            stm=con.prepareStatement(sql);
            stm.setString(1, userID);
            rs=stm.executeQuery();
            while(rs.next()){
                Date date=rs.getDate("date");
                float total=rs.getFloat("total");
                String userIDD=rs.getString("userID");
                OrderDTO dto=new OrderDTO(date, total, userIDD);
                list.add(dto);
            }
            }            
        } catch (Exception e) {

        } finally {
            if (con != null) {
                con.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return list;
    }

    public void addOD(int quantity, String productID, int orderID) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.getConnect();
            if (con != null) {
                String sql = "INSERT INTO tblOderDetails( quantityOD , productID , orderID )"
                        + "VALUES ( ? , ? , ? ) ";
                stm = con.prepareStatement(sql);
                stm.setInt(1, quantity);
                stm.setString(2, productID);
                stm.setInt(3, orderID);
                check = stm.executeUpdate() == 0 ? false : true;
            }
        } catch (Exception e) {

        } finally {
            if (con != null) {
                con.close();
            }
            if (stm != null) {
                stm.close();
            }
        }
    }

    public boolean getproidOD(String productID) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnect();
            if (con != null) {
                String sql = "SELECT productID FROM tblOderDetails WHERE productID= ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, productID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {

        } finally {
            if (con != null) {
                con.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return check;
    }

    public void updateOD(int quantity, String productID) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.getConnect();
            if (con != null) {
                String sql = "UPDATE tblOderDetails "
                        + "SET quantityOD = ? "
                        + "WHERE productID = ? ";
                stm = con.prepareStatement(sql);
                stm.setInt(1, quantity);
                stm.setString(2, productID);
                check = stm.executeUpdate() == 0 ? false : true;
            }
        } catch (Exception e) {

        } finally {
            if (con != null) {
                con.close();
            }
            if (stm != null) {
                stm.close();
            }
        }
    }

    public int getquantityOD(String productID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnect();
            if (con != null) {
                String sql = "SELECT quantityOD "
                        + "FROM tblOderDetails "
                        + "WHERE productID = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, productID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("quantityOD");
                }
            }
        } catch (Exception e) {

        } finally {
            if (con != null) {
                con.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return 0;
    }
}
