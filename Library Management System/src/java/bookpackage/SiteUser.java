package bookpackage;

import dbpackage.DbConfig;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpSession;
import loginpackage.LoginManager;
import validationspackage.MemberNotFoundException;
import validationspackage.Siteuserexception;


public class SiteUser {
    //Class that manages entry in siteusers table and retrieving data from siteusers table

    
    private int userno=-1;
    private String UserName;
    private String password;
    private int userTypeno;
    private String status;

    public SiteUser( String UserName, String password, int userTypeno, String status) {
        this.UserName = UserName;
        this.password = password;
        this.userTypeno = userTypeno;
        this.status = status;
    }
    public SiteUser(int userno,HttpSession session) throws SQLException
    {
        PreparedStatement statement=DbConfig.getPreparedStatement("select * from siteusers where siteuserno = ?",session);
        statement.setInt(1, userno );
        ResultSet rs= statement.executeQuery();
       if(rs.next())
       {  //throw new MemberNotFoundException(clerkno);
        this.userno=userno;
        this.UserName=""+rs.getObject(2);
        this.password=""+rs.getObject(3);
        this.userTypeno = Integer.parseInt(rs.getObject(4)+"");
        this.status=""+rs.getObject(5);
        
       }
    }

    public int getUserno() {
        return userno;
    }

    public String getUserName() {
        return UserName;
    }

    public String getPassword() {
        return password;
    }

    public int getUserTypeno() {
        return userTypeno;
    }

    public String getStatus() {
        return status;
    }

    

    public void setUserName(String UserName) {
        this.UserName = UserName;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setUserTypeno(int userTypeno) {
        this.userTypeno = userTypeno;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    private void insert(HttpSession session) throws SQLException
{
    PreparedStatement statement=DbConfig.getPreparedStatement("insert into siteusers values(siteusersequence.nextVal,?,?,?,'Active')", session);
    statement.setString(1, this.UserName);
    statement.setString(2, this.password);
    statement.setString(3, (this.userTypeno)+"");
    //statement.setString(4, this.status);
    
   
    
    statement.executeUpdate();
    this.userno=getNewId(session);   
}
private void update(HttpSession session) throws SQLException
    {
    PreparedStatement statement=DbConfig.getPreparedStatement("update siteusers set usertypeno=?, status=?,password=? where siteuserno=?",session);
    statement.setString(1,""+this.userTypeno);
    statement.setString(2, this.status);
    
    statement.setString(3, this.password);
    statement.setString(4,""+this.userno);
   
    
    statement.executeUpdate();
   
    }   
public static int getNewId(HttpSession session) throws SQLException
{
    PreparedStatement  statement=DbConfig.getPreparedStatement("select max(siteuserno) from siteusers",session);
    ResultSet rs=statement.executeQuery();
    rs.next();
    return Integer.parseInt("" + rs.getString(1));
}
    public void save(HttpSession session) throws SQLException, Siteuserexception
    {
        if(isIdExisting( session,  userno))
        {update(session);
        
        
        }
        else
        insert(session);
    }
     public static void ChangePassword(HttpSession session,String password) throws SQLException
     {
       String siteuserno= LoginManager.getCurrentSiteUserno(session);
     PreparedStatement statement=DbConfig.getPreparedStatement("update siteusers set password=\'"+password+"\'where siteuserno=?",session);
     statement.setString(1, "" + siteuserno);
     ResultSet rs=statement.executeQuery();
     // "" + rs.getString(1);
     }
    
    private static boolean isIdExisting(HttpSession session,  int userno) throws SQLException
    {
        PreparedStatement statement=DbConfig.getPreparedStatement("select * from siteusers where siteuserno=?",session);
        statement.setString(1, "" + userno);
        return statement.executeQuery().next();
    }
@Override
    public String toString() {
        return "SiteUser{" + "userno=" + userno + ", UserName=" + UserName + ", password=" + password + ", userTypeno=" + userTypeno + ", status=" + status + '}';
    }
   
}
