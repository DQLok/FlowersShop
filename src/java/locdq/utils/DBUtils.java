/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package locdq.utils;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author test
 */
public class DBUtils {
    public static Connection getConnect() throws NamingException, SQLException{
        Connection con=null;
        Context context=new InitialContext();
        Context end=(Context) context.lookup("java:comp/env");
        DataSource ds=(DataSource) end.lookup("DataSource");
        con=ds.getConnection();        
        return con;
    }
}
