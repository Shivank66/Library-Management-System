
package dbpackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import oracle.jdbc.OracleDriver;
/*
1.Make a constructor with one input. Primary Key
2. Make a constructor with alll fields and no primary key
3. Make get and set for all fields except primary key
4. Save method to save if no key found else update



*/
public class Account {
int accountno;
String name;
int amount;

// for seraching 
    public Account(int accountno) throws SQLException
    {   
    Connection connection = Dbconfig.getconnection();
    PreparedStatement statement=connection.prepareStatement("Select * from bank where bankaccountno=?");
    statement.setInt(1,accountno);
    
    
    ResultSet rs=statement.executeQuery();
    //System.out.println(rs.next());
    if(rs.next()){
        //this.name="shivank";
        //this.accountno=23;
        //this.amount=345;
          System.out.println("hi ");
        this.name=rs.getObject("name")+"";
        this.accountno=Integer.parseInt(""+rs.getObject("bankaccountno"));
        this.amount=Integer.parseInt(""+rs.getObject("amount"));
       
    } 

    }

    public int getAccountno() {
        return accountno;
    }

  
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
//for creating
    public Account(String name, int amount) throws SQLException
    { 
    this.name=name;
    this.amount=amount;
    
    Connection connection = Dbconfig.getconnection();
    PreparedStatement statement=connection.prepareStatement("insert into bank values(next.nextval,?,?)");
    statement.setString(1,name);
    statement.setInt(2,amount);
    
    int n = statement.executeUpdate();
    PreparedStatement statement1 = connection.prepareStatement("select * from bank where bankaccountno in (select max(bankaccountno) from bank)");
    ResultSet rs=statement1.executeQuery();
    if (rs.next())
    {
        this.accountno=Integer.parseInt(""+rs.getObject("bankaccountno"));
    }
    
    
    }
//for deposit
    

    @Override
    public String toString()
    {
    return "BankAccount{ Accountno :"+" "+accountno+"&emsp;" +  " AccountHolder's Name:"+name+"&emsp;"+" Balance:"+amount +"}";
    }
    
    
    public static void main(String args[]) throws Exception{
    
    Account a=new Account(2);
    System.out.println(a);
    }
    
    
    
}