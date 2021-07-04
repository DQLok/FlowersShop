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
import locdq.dtos.UserDTO;
import locdq.utils.DBUtils;

/**
 *
 * @author test
 */
public class UserDAO {

    public UserDTO checklogin(String userID, String password) throws SQLException {
        UserDTO user = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnect();
            if (con != null) {
                String sql = "SELECT fullName,roleID,phone,address,userID , password "
                        + "FROM tblUsers "
                        + "WHERE userID= ? AND password= ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, userID);
                stm.setString(2, password);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("fullName");
                    int roleID = rs.getInt("roleID");
                    String address = rs.getString("address");
                    int phone = rs.getInt("phone");
                    String userIDD = rs.getString("userID");
                    String passwordd = rs.getString("password");
                    user = new UserDTO(userIDD, fullName, phone, address, passwordd, roleID);
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
        return user;
    }

    public List<UserDTO> getlistuser(String searchuser) throws SQLException {
        List<UserDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnect();
            if (con != null) {
                String sql = "SELECT * "
                        + "FROM tblUsers "
                        + "WHERE fullName LIKE ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + searchuser + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("userID");
                    String fullName = rs.getString("fullName");
                    int phone = rs.getInt("phone");
                    String address = rs.getString("address");
                    String password = rs.getString("password");
                    int roleID = rs.getInt("roleID");
                    UserDTO user = new UserDTO(userID, fullName, phone, address, password, roleID);
                    list.add(user);
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
        return list;
    }

    public boolean deleteUser(String userID) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.getConnect();
            if (con != null) {
                String sql = "DELETE FROM tblUsers WHERE userID= ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, userID);
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

    public boolean updateUser(String userID, String fullName, String password, String phone, String address, int roleID) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.getConnect();
            if (con != null) {
                String sql = "UPDATE tblUsers "
                        + "SET fullName= ? , phone= ? , address= ? , password= ? ,roleID= ? "
                        + "WHERE userID= ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, fullName);
                stm.setString(2, phone);
                stm.setString(3, address);
                stm.setString(4, password);
                stm.setInt(5, roleID);
                stm.setString(6, userID);
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

    public boolean checkDuplicate(String userID) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnect();
            if (con != null) {
                String sql = "SELECT userID "
                        + "FROM tblUsers "
                        + "WHERE userID = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, userID);
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

    public boolean insert(UserDTO user) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.getConnect();
            if (con != null) {
                String sql = "INSERT INTO tblUsers(userID,fullName,phone,address,password,roleID) "
                        + "VALUES ( ? , ? , ? , ? , ? , ? )";
                stm = con.prepareStatement(sql);
                stm.setString(1, user.getUserID());
                stm.setString(2, user.getFullName());
                stm.setInt(3, user.getPhone());
                stm.setString(4, user.getAddress());
                stm.setString(5, user.getPassword());
                stm.setInt(6, user.getRoleID());
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
    
    public List<Integer> getroleID() throws SQLException{
        List<Integer> list=new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs=null;
        try{
            con=DBUtils.getConnect();
            if(con!=null){
                String sql="SELECT roleID "
                        + "FROM tblRoles ";
                stm=con.prepareStatement(sql);
                rs=stm.executeQuery();
                if (rs.next()){
                    list.add(rs.getInt("roleID"));
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
    
    
}
