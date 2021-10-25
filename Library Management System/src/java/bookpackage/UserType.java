/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookpackage;

import dbpackage.DbConfig;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpSession;
import validationspackage.BookNotFoundException;

/**
 *
 * 
 */
public class UserType {
    


    
private int Usertypeno;
private String UserTYPE;

    public UserType(String UserTYPE) {
        
        
        this.UserTYPE=UserTYPE;
    }

    public void setUserTYPE(String UserTYPE) {
        this.UserTYPE = UserTYPE;
    }

    public int getUsertypeno() {
        return Usertypeno;
    }

    public String getUserTYPE() {
        return UserTYPE;
    }

    public UserType(HttpSession session,  int Usertypeno) throws BookNotFoundException, SQLException {
        PreparedStatement statement=DbConfig.getPreparedStatement("select * from usertypes where usertypeno = ?",session);
        statement.setInt(1,Usertypeno);
        ResultSet rs= statement.executeQuery();
       if(!rs.next())
           throw new BookNotFoundException(Usertypeno);
       this.Usertypeno=Usertypeno; 
       this.UserTYPE=""+rs.getObject(2);
           
    }

    public void save(HttpSession session) throws SQLException, BookNotFoundException
    {
        if(isIdExisting( session,  Usertypeno))
            update(session);
        else
        insert(session);
    }
    private static boolean isIdExisting(HttpSession session,  int id) throws SQLException
    {
        PreparedStatement statement=DbConfig.getPreparedStatement("select * from usertypes where usertypeno=?",session);
        statement.setString(1, "" + id);
        return statement.executeQuery().next();
    }
private void insert(HttpSession session) throws SQLException
{
    PreparedStatement statement=DbConfig.getPreparedStatement("insert into usertypes values(type.nextVal,?)", session);
    statement.setString(1, UserTYPE);
   
    
    statement.executeUpdate();
    this.Usertypeno=getNewId(session);   
}

public static int getNewId(HttpSession session) throws SQLException
{
    PreparedStatement  statement=DbConfig.getPreparedStatement("select max(usertypeno) from usertypes",session);
    ResultSet rs=statement.executeQuery();
    rs.next();
    return Integer.parseInt("" + rs.getString(1));
}
private void update(HttpSession session) throws SQLException,BookNotFoundException
    {
    PreparedStatement statement=DbConfig.getPreparedStatement("update usertypes set usertype=? where usertypeno=?",session);
    statement.setString(1, UserTYPE);
    statement.setString(2,""+Usertypeno);
    
    statement.executeUpdate();
   
    }






    @Override
    public String toString() {
        return "Usertypes{" + "Usertypeno=" + Usertypeno + ", UserType=" + UserTYPE  + '}';
    }
    
    
    
    
}

    

