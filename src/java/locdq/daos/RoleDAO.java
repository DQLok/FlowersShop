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
import locdq.utils.DBUtils;

/**
 *
 * @author test
 */
public class RoleDAO {
    public static List<Integer> getlistRoleID() throws SQLException{
        List<Integer> list=new ArrayList<>(); 
        Connection con=null;
        PreparedStatement stm=null;
        ResultSet rs=null;
        try{
            con=DBUtils.getConnect();
            if(con!=null){
                String sql="SELECT roleID "
                        + "FROM tblRoles ";
                stm=con.prepareStatement(sql);
                rs=stm.executeQuery();
                while(rs.next()){
                    list.add((Integer)rs.getInt("roleID"));
                }
            }
        }catch(Exception e){
            
        }finally{
            if (con!=null) con.close();
            if(stm!=null) stm.close();
            if(rs!=null) rs.close();
        }
        return list;
    }
    
}
