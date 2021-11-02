/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbpackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import javax.servlet.http.HttpSession;
import oracle.jdbc.OracleDriver;
/**
 *
 * @author maury
 */
public class DbConfig {
    public static PreparedStatement getPreparedStatement(String query,HttpSession session) throws SQLException
    {
        return getConnection(session).prepareStatement(query);
    }
    public static Connection getConnection(HttpSession session) throws SQLException
    {
        if(session.getAttribute("connection")==null)
        {
    DriverManager.registerDriver(new OracleDriver());
    String user="system",password="abhi",url="jdbc:oracle:thin:@localhost:1521:xe";
    Connection connection=DriverManager.getConnection(url, user, password);
    session.setAttribute("connection", connection);
        }
        
       return  (Connection)session.getAttribute("connection");
    }
    
}
