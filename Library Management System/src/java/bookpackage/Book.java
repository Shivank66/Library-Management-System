package bookpackage;

import dbpackage.DbConfig;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import validationspackage.BookNotFoundException;
import java.sql.ResultSet;
import javax.servlet.http.HttpSession;

public class Book {
    
private int bookid,price,location;
private String bookname,publisher,author,edition;

    public Book( String bookname, String publisher, String author, String edition, int price, int location) {
        
        this.price = price;
        this.location = location;
        this.bookname = bookname;
        this.publisher = publisher;
        this.author = author;
        this.edition = edition;
    }

    public Book(int bookid ,HttpSession session) throws BookNotFoundException, SQLException {
        PreparedStatement statement=DbConfig.getPreparedStatement("select * from books where bookid = ?",session);
        statement.setInt(1,bookid);
        ResultSet rs= statement.executeQuery();
       if(!rs.next())
           throw new BookNotFoundException(bookid);
        this.bookid=bookid;
        this.price = Integer.parseInt("" + rs.getObject("price"));
        this.location = Integer.parseInt("" + rs.getObject("location"));
        this.bookname = "" + rs.getObject("bookname");
        this.publisher = "" + rs.getObject("publisher");
        this.author = "" + rs.getObject("author");
        this.edition = "" + rs.getObject("edition");
           
    }

    public int getBookid() {
        return bookid;
    }

 
    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getLocation() {
        return location;
    }

    public void setLocation(int location) {
        this.location = location;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getEdition() {
        return edition;
    }

    public void setEdition(String edition) {
        this.edition = edition;
    }
    public void save(HttpSession session) throws SQLException, BookNotFoundException
    {
        if(isIdExisting(session,   bookid))
            update(session);
        else
        insert(session);
    }
    private static boolean isIdExisting(HttpSession session,   int id) throws SQLException
    {
        PreparedStatement statement=DbConfig.getPreparedStatement("select * from books where bookid=?",session);
        statement.setString(1, "" + id);
        return statement.executeQuery().next();
    }
private void insert(HttpSession session) throws SQLException
{
    PreparedStatement statement=DbConfig.getPreparedStatement("insert into books values(booksequence.nextVal,?,?,?,?,?,?)",session );
    statement.setString(1, bookname);
    statement.setString(2, publisher);
    statement.setString(3, author);
    statement.setString(4,"" + price);
    statement.setString(5, edition);
    statement.setString(6, "" + location);
    statement.executeUpdate();
    this.bookid=getNewId(session);   
}

private static int getNewId(HttpSession session) throws SQLException
{
    PreparedStatement  statement=DbConfig.getPreparedStatement("select max(bookid) from books",session);
    ResultSet rs=statement.executeQuery();
    rs.next();
    return Integer.parseInt("" + rs.getString(1));
}
private void update(HttpSession session) throws SQLException,BookNotFoundException
    {
    PreparedStatement statement=DbConfig.getPreparedStatement("update books set bookname=?,publisher=?,author=?,price=?,edition=?,location=? where bookid=?",session);
    statement.setString(1, bookname);
    statement.setString(2, publisher);
    statement.setString(3, author);
    statement.setString(4,"" + price);
    statement.setString(5, edition);
    statement.setString(6, "" + location);
    statement.setString(7, ""+bookid);
    statement.executeUpdate();
    
    
    }

public static void delete(HttpSession session,  int bookid) throws SQLException
    {
    PreparedStatement statement=DbConfig.getPreparedStatement("delete from books where bookid=?",session);
    statement.setString(1,""+bookid);
    statement.executeUpdate();
    
    
    }




    @Override
    public String toString() {
        return "Book{" + "bookid=" + bookid + ", price=" + price + ", location=" + location + ", bookname=" + bookname + ", publisher=" + publisher + ", author=" + author + ", edition=" + edition + '}';
    }
    
    
    
}
