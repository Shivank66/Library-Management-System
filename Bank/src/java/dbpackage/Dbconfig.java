package dbpackage;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;
import oracle.jdbc.OracleDriver;

/**
 *
 * @author 2001s
 */
public class Dbconfig {
    


    public static Connection getconnection() throws SQLException    {
    DriverManager.registerDriver(new OracleDriver());
    String user="system";
    String password="Wrong";
    String url="jdbc:oracle:thin:@localhost:1521:xe";
    Connection connection=DriverManager.getConnection(url,user,password);
    return connection;
    
    
    }
}

