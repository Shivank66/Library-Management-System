/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookpackage;

import dbpackage.DbConfig;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import javax.servlet.http.HttpSession;
import loginpackage.LoginManager;
import validationspackage.BookNotFoundException;

/**
 *
 * 
 */
public class UserType {
    


    
private int Usertypeno=-1;
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
        { UserType ob1=new UserType(session,Usertypeno);
        String OldUserTypeName=ob1.getUserTYPE();
            update(session);
        int a=Integer.parseInt(LoginManager.getCurrentSiteUserno(session));
            ActivityLog ob=new ActivityLog(a,"Usertype Updated from "+OldUserTypeName+ " to "+UserTYPE+" references usertypeno "+Usertypeno,session);
            ob.save(session);
        
        }
        else
        {insert(session);
        int a=Integer.parseInt(LoginManager.getCurrentSiteUserno(session));
            ActivityLog ob=new ActivityLog(a,"Usertype added "+Usertypeno,session);
            ob.save(session);}
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
public static String dropdown(HttpSession session) throws SQLException{
   PreparedStatement statement=DbConfig.getPreparedStatement("Select * from usertypes",session); 
    String output="<div  >\n<Select class=\"form-control\" id=\"userTypeno\" name=\"userTypeno\" placeholder=\"UserType\">\n";
   
        ResultSet rs=statement.executeQuery();
        ResultSetMetaData rsmd=rs.getMetaData();
      //  int n= rsmd.getColumnCount();
      //  <option value="1">Member</option>
        
           
        while(rs.next())
        {
            
            //String nam="" + rs.getObject(2);
            String usertypeno="" + rs.getObject(1);
            String usertype=""+rs.getObject(2);
            if( usertype.equals("Clerk") || usertype.equals("clerk") ||usertype.equals("Admin") || usertype.equals("admin"))
            {
                continue;
            }
            output+="<option value=\""+usertypeno+"\">"+usertype+"</option>" +"\n";
            
           
                
        }
        output+="</Select>\n</div>";
        return output;
        
    }
public static String dropdownClerk(HttpSession session) throws SQLException{
   PreparedStatement statement=DbConfig.getPreparedStatement("Select * from usertypes",session); 
    String output="<div  >\n<Select class=\"form-control\" id=\"userTypeno\" name=\"userTypeno\" placeholder=\"UserType\">\n";
   
        ResultSet rs=statement.executeQuery();
        ResultSetMetaData rsmd=rs.getMetaData();
      //  int n= rsmd.getColumnCount();
      //  <option value="1">Member</option>
        
           
        while(rs.next())
        {
            
            //String nam="" + rs.getObject(2);
            String usertypeno="" + rs.getObject(1);
            String usertype=""+rs.getObject(2);
            if( usertype.equals("Clerk") || usertype.equals("clerk"))
            {
              output+="<option value=\""+usertypeno+"\">"+usertype+"</option>" +"\n";
            }
            
            
           
                
        }
        output+="</Select>\n</div>";
        return output;
        
    }
    






    @Override
    public String toString() {
        return "Usertypes{" + "Usertypeno=" + Usertypeno + ", UserType=" + UserTYPE  + '}';
    }
    
    
    
    
}

    

