package bookpackage;

import dbpackage.DbConfig;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpSession;
import validationspackage.BookNotFoundException;
import java.time.format.DateTimeFormatter;  
import java.time.LocalDateTime;    
   
   

public class BookIssue {
    private int receipt;
    private int memberno;
    private int bookid;
    private String dateIssue;
    private String dateExpected;
    private String dateActual;
    private String rmks;
    private int fine;

    public BookIssue( int memberno, int bookid, String dateIssue, String dateExpected, String dateActual, String rmks, int fine) {
        this.memberno = memberno;
        this.bookid = bookid;
        this.dateIssue = dateIssue;
        this.dateExpected = dateExpected;
        this.dateActual = dateActual;
        this.rmks = rmks;
        this.fine = fine;
    }


    public void setMemberno(int memberno) {
        this.memberno = memberno;
    }

    public void setBookid(int bookid) {
        this.bookid = bookid;
    }

    public void setDateIssue(String dateIssue) {
        this.dateIssue = dateIssue;
    }

    public void setDateExpected(String dateExpected) {
        this.dateExpected = dateExpected;
    }

    public void setDateActual(String dateActual) {
        this.dateActual = dateActual;
    }

    public void setRmks(String rmks) {
        this.rmks = rmks;
    }

    public void setFine(int fine) {
        this.fine = fine;
    }
    

    public int getReceipt() {
        return receipt;
    }

    public int getMemberno() {
        return memberno;
    }

    public int getBookid() {
        return bookid;
    }

    public String getDateIssue() {
        return dateIssue;
    }

    public String getDateExpected() {
        return dateExpected;
    }

    public String getDateActual() {
        return dateActual;
    }

    public String getRmks() {
        return rmks;
    }

    public int getFine() {
        return fine;
    }
    private static boolean isIdExisting(HttpSession session,   int id) throws SQLException
    {
        PreparedStatement statement=DbConfig.getPreparedStatement("select * from bookissue where receipt=?",session);
        statement.setString(1, "" + id);
        return statement.executeQuery().next();
    }
    public void save(HttpSession session) throws SQLException
    {
        if(isIdExisting(session, receipt))
            update(session);
        else
        insert(session);
    }
    private void insert(HttpSession session) throws SQLException
{
    PreparedStatement statement=DbConfig.getPreparedStatement("insert into BookIssue values(bookissuesequence.nextval,?,?,to_date(?,'yyyy-mm-dd'),to_date(?,'yyyy-mm-dd'),to_date(?,'yyyy-mm-dd'),?,?)",session );
    statement.setString(1, ""+memberno);
    statement.setString(2, ""+bookid);
    statement.setString(3, dateIssue);
    statement.setString(4,"" + dateExpected);
    statement.setString(5, dateActual);
    statement.setString(6, rmks);
    statement.setString(7, fine+"");
    statement.executeUpdate();
    this.bookid=  getNewId(session);   
}
    private static int getNewId(HttpSession session) throws SQLException
{
    PreparedStatement  statement=DbConfig.getPreparedStatement("select max(receipt) from bookissue",session);
    ResultSet rs=statement.executeQuery();
    rs.next();
    return Integer.parseInt("" + rs.getString(1));
}
   private void update(HttpSession session) throws SQLException
    {
    PreparedStatement statement=DbConfig.getPreparedStatement("update bookissue set userid = ?,bookid=?, dateofissue=(?,'yyyy-mm-dd'), expectedreturndate=(?,'yyyy-mm-dd'), actualreturndate=(?,'yyyy-mm-dd'), remarks=?, fine=?  ",session);
    statement.setString(1, this.memberno+"");
    statement.setString(2, this.bookid+"");
    statement.setString(3, this.dateIssue+"");
    statement.setString(4, this.dateExpected);
    statement.setString(5, this.dateActual);
    statement.setString(6, this.rmks);
    statement.setString(7, this.fine + "");
    //statement.setString(8,""+(this.SiteUserNo));
    statement.executeUpdate();
    }
   public static void main(String[] args) {    
   DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd ");  
   LocalDateTime now = LocalDateTime.now();  
   System.out.println(dtf.format(now));  
} 
   
}
