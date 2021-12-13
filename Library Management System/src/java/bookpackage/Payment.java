
package bookpackage;

import dbpackage.DbConfig;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpSession;
import loginpackage.LoginManager;


public class Payment {
    //Class that manages entry in payment table and retrieving data from payment table
public static void pay(int memberno,int amount,HttpSession session) throws SQLException
{   String date= BookIssue.getCurrentDate()+"";
    PreparedStatement  statement=DbConfig.getPreparedStatement("insert into payments values(paymentsequence.nextval,?,?,to_date(?,'YYYY-MM-DD'))",session);
    statement.setString(1,""+memberno);
    statement.setString(2,amount+"");
    statement.setString(3, date);
    statement.executeUpdate();
    int a=Integer.parseInt(LoginManager.getCurrentSiteUserno(session));
     ActivityLog ob=new ActivityLog(a,"Member no "+ memberno+" payed "+amount+ " Rs.",session);
     ob.save(session);
}
    
public static int totalFineByMemberno(int memberno,HttpSession session) throws SQLException
{
    PreparedStatement  statement=DbConfig.getPreparedStatement("select sum(fine+extrafine) from (select b.userid as Memberno, m.firstname ||' '|| m.lastname as name,b.fine,b.extrafine from bookissue b join members m on b.userid = m.memberno ) group by memberno having memberno="+memberno,session);
          ResultSet rs=statement.executeQuery();
    if (rs.next())
    {
        return Integer.parseInt("" + rs.getString(1));
    }
    return 0;
}
public static int totalPaymentByMemberno(int memberno,HttpSession session) throws SQLException
{
    PreparedStatement  statement=DbConfig.getPreparedStatement("select sum(amount) from payments where memberno="+memberno+" group by memberno",session);
          ResultSet rs=statement.executeQuery();
          if (rs.next())
    {
        return Integer.parseInt("" + rs.getString(1));
    }
    return 0;
}
public static int totalPayments(HttpSession session) throws SQLException// fine collected
{
    PreparedStatement  statement=DbConfig.getPreparedStatement("select sum(amount) from payments ",session);
          ResultSet rs=statement.executeQuery();
          if (rs.next())
    {
        return Integer.parseInt("" + rs.getString(1));
    }
    return 0;
}
public static int totalFine(HttpSession session) throws SQLException// total fine
{
    PreparedStatement  statement=DbConfig.getPreparedStatement("select sum(fine+extrafine) from (select b.userid as Memberno, m.firstname ||' '|| m.lastname as name,b.fine,b.extrafine from bookissue b join members m on b.userid = m.memberno )",session);
          ResultSet rs=statement.executeQuery();
    if (rs.next())
    {
        return Integer.parseInt("" + rs.getString(1));
    }
    return 0;
}
public static int remainingFineBySiteUserno(int siteuserno,HttpSession session) throws SQLException
{
    int memberno= Member.getMembernoBySiteUserno(siteuserno,session);
    //siteuserno=Integer.parseInt(LoginManager.getCurrentSiteUserno(session));
    //PreparedStatement  statement=DbConfig.getPreparedStatement("select sum(fine+extrafine) from (select b.userid as Memberno, m.firstname ||' '|| m.lastname as name,b.fine,b.extrafine from bookissue b join members m on b.userid = m.memberno )",session);
      //    ResultSet rs=statement.executeQuery();
    int tfine=Payment.totalFineByMemberno(memberno, session) - Payment.totalPaymentByMemberno(memberno, session);
    return tfine;
}
    
}
