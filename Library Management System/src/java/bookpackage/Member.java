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
import loginpackage.LoginManager;
import validationspackage.MemberNotFoundException;
/**
 *
 * @author maury
 */
public class Member {
    private int memberno=-1;
    private int usertypeno;
    private String firstName="";
    private String lastName="";
    private String address="";
    private String mobile="";
    private String regDate="";
    private String validTillDate="";
    private int SiteUserNo;

    public Member(int usertypeno,String firstname,String lastname,String address,String mobile,String regDate, String validTillDate,int SiteUserNo) {
    this.usertypeno=usertypeno;
    this.firstName=firstname;
    this.lastName=lastname;
    this.address=address;
    this.mobile=mobile;
    this.regDate=regDate;
    this.validTillDate=validTillDate;
    this.SiteUserNo=SiteUserNo;
    }

    public Member(HttpSession session, int memberno) throws SQLException, MemberNotFoundException {
        PreparedStatement statement=DbConfig.getPreparedStatement("select * from members where memberno = ?",session);
        statement.setString(1, memberno+"" );
        ResultSet rs= statement.executeQuery();
       if(!rs.next())
           throw new MemberNotFoundException(memberno);
       this.memberno=memberno;
       this.usertypeno=Integer.parseInt(""+rs.getObject(4));
        this.firstName=""+rs.getObject(2);
        this.lastName=""+rs.getObject(3);
        this.address=""+rs.getObject(5);
        this.mobile=""+rs.getObject(8);
        this.regDate=""+rs.getObject(6);
        this.validTillDate=""+rs.getObject(7);
        this.SiteUserNo=Integer.parseInt(""+rs.getObject(9));
    }
    

    public void setUsertypeno(int usertypeno) {
        this.usertypeno = usertypeno;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public void setRegDate(String regDate) {
        this.regDate = regDate;
    }

    public void setValidTillDate(String validTillDate) {
        this.validTillDate = validTillDate;
    }
    

    public int getMemberno() {
        return memberno;
    }

    public int getUsertypeno() {
        return usertypeno;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getAddress() {
        return address;
    }

    public String getMobile() {
        return mobile;
    }

    public String getRegDate() {
        return regDate;
    }

    public String getValidTillDate() {
        return validTillDate;
    }
   private void insert(HttpSession session) throws SQLException
{
    PreparedStatement statement=DbConfig.getPreparedStatement("insert into members values(membersequence.nextVal,?,?,?,?,to_date(?,'yyyy-mm-dd'),to_date(?,'yyyy-mm-dd'),?,?)", session);
    statement.setString(1, this.firstName);
    statement.setString(2, this.lastName);
    statement.setString(3, (this.usertypeno)+"");
    statement.setString(4, this.address);
    statement.setString(5, this.regDate);
    statement.setString(6, this.validTillDate);
    statement.setString(7, this.mobile);
    statement.setString(8,""+(this.SiteUserNo));
   
    
    statement.executeUpdate();
    this.memberno=getNewId(session);   
}
private void update(HttpSession session) throws SQLException
    {
    PreparedStatement statement=DbConfig.getPreparedStatement("update members set firstname=? , lastname= ?, usertypeno= ?, address= ?, regdate= to_date(?,'yyyy-mm-dd'), validtilldate= to_date(?,'yyyy-mm-dd'), mobile= ? where memberno=?",session);
    statement.setString(1, this.firstName);
    statement.setString(2, this.lastName);
    statement.setString(3, (this.usertypeno)+"");
    statement.setString(4, this.address);
    statement.setString(5, this.regDate);
    statement.setString(6, this.validTillDate);
    statement.setString(7, this.mobile);
    //statement.setString(8,""+(this.SiteUserNo));
    statement.executeUpdate();
   
    }   
public static int getNewId(HttpSession session) throws SQLException
{
    PreparedStatement  statement=DbConfig.getPreparedStatement("select max(memberno) from members",session);
    ResultSet rs=statement.executeQuery();
    rs.next();
    return Integer.parseInt("" + rs.getString(1));
}
    public void save(HttpSession session) throws SQLException, MemberNotFoundException
    {
        if(isIdExisting( session,  memberno))
        {update(session);
        int a=Integer.parseInt(LoginManager.getCurrentSiteUserno(session));
            ActivityLog ob=new ActivityLog(a,"Member no. "+memberno+" Updated",session);
            ob.save(session);}
        else
        {insert(session);
        int a=Integer.parseInt(LoginManager.getCurrentSiteUserno(session));
            ActivityLog ob=new ActivityLog(a,"Member no. "+memberno+" added with Siteuserno "+SiteUserNo,session);
            ob.save(session);
        }
    }
    private static boolean isIdExisting(HttpSession session,  int id) throws SQLException
    {
        PreparedStatement statement=DbConfig.getPreparedStatement("select * from members where memberno=?",session);
        statement.setString(1, "" + id);
        return statement.executeQuery().next();
    }
   public static int getMembernoBySiteUserno(int situserno,HttpSession session) throws SQLException
   {
       PreparedStatement  statement=DbConfig.getPreparedStatement("select * from members where siteuserno=?",session);
       statement.setString(1, ""+situserno);
    ResultSet rs=statement.executeQuery();
    rs.next();
    return Integer.parseInt("" + rs.getString(1));
       
   }

     
}
