package bookpackage;

import dbpackage.DbConfig;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import javax.servlet.http.HttpSession;
import validationspackage.BookNotFoundException;
import java.time.format.DateTimeFormatter;  
import java.time.LocalDateTime;    
import java.time.temporal.ChronoUnit;
import java.util.Locale;
import static oracle.sql.DATE.getCurrentDate;
   
   

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
    
    public BookIssue(int receipt,HttpSession session) throws BookNotFoundException, SQLException {
        PreparedStatement statement=DbConfig.getPreparedStatement("select * from bookissue where receipt=? and actualreturndate is null",session);
        statement.setInt(1,receipt);
        ResultSet rs= statement.executeQuery();
       if(!rs.next())
           throw new BookNotFoundException(bookid);
        this.receipt=receipt;
        this.memberno = Integer.parseInt("" + rs.getObject("userid"));
      //  this.location = Integer.parseInt("" + rs.getObject("location"));
        this.dateIssue =rs.getObject("dateofissue")+"";
        this.dateExpected = "" + rs.getObject("expectedreturndate");
        this.dateActual = getCurrentDate()+"";
        this.bookid =Integer.parseInt( ""+rs.getObject("bookid"));
        
      //  this.edition = "" + rs.getObject("edition");
       // this.memberno = memberno;
       // this.bookid = bookid;
       // this.dateIssue = dateIssue;
        //this.dateExpected = dateExpected;
       // this.dateActual = dateActual;
        this.rmks ="" + rs.getObject("Remarks");;
        this.fine =0 ;
           
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
    PreparedStatement statement=DbConfig.getPreparedStatement("update bookissue set userid=? , bookid=?, dateofissue=to_date(?,'yyyy-mm-dd'), expectedreturndate=to_date(?,'yyyy-mm-dd'), actualreturndate=to_date(?,'yyyy-mm-dd'), remarks=?, fine=? where receipt=?",session);
    statement.setString(1, this.memberno+"");
    statement.setString(2, this.bookid+"");
    statement.setString(3, this.dateIssue+"");
    statement.setString(4, this.dateExpected);
    statement.setString(5, this.dateActual);
    statement.setString(6, this.rmks);
    statement.setString(7, this.fine + "");
    statement.setString(8, this.receipt+"");
    //statement.setString(8,""+(this.SiteUserNo));
    statement.executeUpdate();
    }
   public static String getCurrentDate() {    
   DateTimeFormatter dtf = DateTimeFormatter.ofPattern("YYYY-MM-dd");  
   LocalDateTime now = LocalDateTime.now();  
   return dtf.format(now);  
} 
    public static String getExpectedReturnDate() {    
   DateTimeFormatter dtf = DateTimeFormatter.ofPattern("YYYY-MM-dd");  
   LocalDateTime now = LocalDateTime.now().plusDays(15);  
   return (dtf.format(now)); 
} 
   public static int NoOfDays(String date1,String date2) throws ParseException {    
   DateTimeFormatter dtf = DateTimeFormatter.ofPattern("YYYY-MM-dd");  
   //LocalDateTime now = LocalDateTime.now().plusDays(15); 
   
  // LocalDateTime now1 = LocalDateTime.now();
   //System.out.println(datebig);
  // LocalDateTime now2=LocalDateTime.now();
  //String string = "January 2, 2010";
DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd", Locale.ENGLISH);
LocalDate datebig = LocalDate.parse(date1, formatter);
DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("yyyy-MM-dd", Locale.ENGLISH);
LocalDate datesmall = LocalDate.parse(date2, formatter1);
System.out.println(datesmall);
System.out.println(datebig);
   return (int) (ChronoUnit.DAYS.between(datebig,datesmall)); //dtf.format(now)
}
   public static int fine(String date1, String date2,int fine_per_day) throws ParseException
   {
      int daydiff= NoOfDays( date1 , date2);
      if (daydiff<0)
      {
          return 0;
      }
      return fine_per_day*daydiff;
   }
  public static int NoOfIssuedBooks(int memberno,HttpSession session) throws SQLException
  {
          PreparedStatement  statement=DbConfig.getPreparedStatement("select count(*) from bookissue where userid="+memberno+"and actualreturndate is null",session);
          ResultSet rs=statement.executeQuery();
          rs.next();
          return Integer.parseInt("" + rs.getString(1)); 
  
  }
   
}
