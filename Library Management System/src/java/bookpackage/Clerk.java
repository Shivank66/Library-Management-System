
package bookpackage;
import dbpackage.DbConfig;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpSession;
import loginpackage.LoginManager;
import validationspackage.MemberNotFoundException;

public class Clerk {
    //Class that manages entry in Clerk table and retrieving data from clerk table
    private int clerkno=-1;
    private int SiteUserno=-1;
    private String firstName="";
    private String lastName="";
    private String address="";
    private String mobile="";
    private String registrationdate="";
    private int usertypeno=-1;
    

    public Clerk(int SiteUserno,String firstname,String lastname,String address,String mobile,String registrationdate,int usertypeno) {
    this.SiteUserno=SiteUserno;
    this.firstName=firstname;
    this.lastName=lastname;
    this.address=address;
    this.mobile=mobile;
    this.registrationdate=registrationdate;
    this.usertypeno=usertypeno;
    }

    public Clerk(HttpSession session, int clerkno) throws SQLException, MemberNotFoundException {
        PreparedStatement statement=DbConfig.getPreparedStatement("select * from clerk where clerkno = ?",session);
        statement.setInt(1, clerkno );
        ResultSet rs= statement.executeQuery();
       if(!rs.next())
           throw new MemberNotFoundException(clerkno);
       this.SiteUserno=Integer.parseInt(""+rs.getObject(2));
        this.firstName=""+rs.getObject(3);
        this.lastName=""+rs.getObject(4);
        this.address=""+rs.getObject(5);
        this.mobile=""+rs.getObject(6);
        this.registrationdate=""+rs.getObject(7);
        this.usertypeno=Integer.parseInt(""+ rs.getObject(8));
        this.clerkno=clerkno;
        
    }

    public int getClerkno() {
        return clerkno;
    }

   

    public int getSiteUserno() {
        return SiteUserno;
    }

    public void setSiteUserno(int SiteUserno) {
        this.SiteUserno = SiteUserno;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getRegistrationdate() {
        return registrationdate;
    }

    public void setRegistrationdate(String registrationdate) {
        this.registrationdate = registrationdate;
    }

    
    

    
   private void insert(HttpSession session) throws SQLException
{
    PreparedStatement statement=DbConfig.getPreparedStatement("insert into clerk values(clerksequence.nextVal,?,?,?,?,?,to_date(?,'yyyy-mm-dd'),?)", session);
    statement.setString(1, this.SiteUserno+"");
    statement.setString(2, this.firstName);
    statement.setString(3, this.lastName);
    
    statement.setString(4, this.address);

    statement.setString(5, this.mobile);
    statement.setString(6, this.registrationdate);
    statement.setString(7,this.usertypeno+"");
    

   
    
    statement.executeUpdate();
    this.clerkno=getNewId(session);   
}
private void update(HttpSession session) throws SQLException
    {
    PreparedStatement statement=DbConfig.getPreparedStatement("update clerk set siteuserno = ? firstname=? , lastname= ?, address= ?,  mobile= ? ,registrationdate = to_date(?,'yyyy-mm-dd'),usertypeno = ? where clerkno=?",session);
        statement.setString(1, this.SiteUserno+"");
    statement.setString(2, this.firstName);
    statement.setString(3, this.lastName);
    
    statement.setString(4, this.address);

    statement.setString(5, this.mobile);
    statement.setString(6, this.registrationdate);
    statement.setString(7,this.usertypeno+"");
    statement.setString(8,""+(this.clerkno));
    statement.executeUpdate();
   
    }   
public static int getNewId(HttpSession session) throws SQLException
{
    PreparedStatement  statement=DbConfig.getPreparedStatement("select max(clerkno) from clerk",session);
    ResultSet rs=statement.executeQuery();
    rs.next();
    return Integer.parseInt("" + rs.getString(1));
}
    public void save(HttpSession session) throws SQLException, MemberNotFoundException
    {
        if(isIdExisting( session,  clerkno))
        {
            int a=Integer.parseInt(LoginManager.getCurrentSiteUserno(session));
            ActivityLog ob=new ActivityLog(a,"Clerk no "+ clerkno +" Updated",session);
            ob.save(session);
            update(session);
        }
        else
        {
        insert(session);
        int a=Integer.parseInt(LoginManager.getCurrentSiteUserno(session));
            ActivityLog ob=new ActivityLog(a,"New Clerk adde with clerkno "+ clerkno,session);
            ob.save(session);
        }
    }
    private static boolean isIdExisting(HttpSession session,  int id) throws SQLException
    {
        PreparedStatement statement=DbConfig.getPreparedStatement("select * from clerk where clerkno=?",session);
        statement.setString(1, "" + id);
        return statement.executeQuery().next();
    }
   public static int getClerknoBySiteUserno(int situserno,HttpSession session) throws SQLException
   {
       PreparedStatement  statement=DbConfig.getPreparedStatement("select clerkno from clerk where siteuserno=?",session);
       statement.setString(1, ""+situserno);
    ResultSet rs=statement.executeQuery();
    rs.next();
    return Integer.parseInt("" + rs.getString(1))   ;
       
   }

     
}
