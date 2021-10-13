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
import java.sql.SQLException;
import oracle.jdbc.OracleDriver;

public class Account {
int accountno;
String name;
int amount;
    public Account(int accountno) throws SQLException
    {   
    Connection connection = Dbconfig.getconnection();
    PreparedStatement statement=connection.prepareStatement("Select * from bank where bankaccountno=?");
    statement.setInt(1,accountno);
    
    
    ResultSet rs=statement.executeQuery();
    if(rs.next()){
        this.name=rs.getObject("name")+"";
        this.accountno=Integer.parseInt(""+rs.getObject("bankaccountno"));
        this.amount=Integer.parseInt(""+rs.getObject("amount"));
    }
   
    
    
        
        
        //this.name="shivank";
        //this.accountno=23;
        //this.amount=345;
        
        
    
        
    
    }
    @Override
    public String toString()
    {
    return " "+name+" "+accountno+" "+amount;
    }
    
    
    public static void main(String args[]) throws Exception{
    
    Account a=new Account(2);
    System.out.println(a);
    }
    
    
    
}